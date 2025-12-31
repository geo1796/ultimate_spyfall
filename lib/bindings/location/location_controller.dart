import 'dart:async';
import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_locale/app_locale.dart';
import 'package:ultimate_spyfall/bindings/location/location_service.dart';
import 'package:ultimate_spyfall/model/location_group.dart';

class LocationController extends GetxController {
  final LocationService _locationsService = Get.find();

  late final RxList<LocationGroup> groups;
  late final Rx<LocationGroup> selectedGroup;
  late final StreamSubscription<LocationGroup> _selectedGroupSub;

  @override
  void onClose() {
    _selectedGroupSub.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    _onInit();
  }

  void _onInit() {
    final storedLocations = _locationsService.all;

    if (storedLocations.isEmpty) {
      setupDefaultLocations(AppLocale.localeName);
      return;
    }

    groups = storedLocations.obs;

    final previousSelectedGroup = _locationsService.selected;

    if (previousSelectedGroup == null) {
      selectedGroup = groups[0].obs;
    } else {
      selectedGroup = previousSelectedGroup.obs;
    }

    _selectedGroupSub = selectedGroup.listen((newValue) {
      _locationsService.saveSelectedLocationGroup(newValue);
    });
  }

  void setupDefaultLocations(String localeName) {
    localeName == 'fr' ? _setupFrLocations() : _setupEnLocations();
  }

  void _setupFrLocations() {
    groups = [frDefaultLocationGroup].obs;
    _locationsService.all = [frDefaultLocationGroup];

    selectedGroup = frDefaultLocationGroup.obs;
  }

  void _setupEnLocations() {
    groups = [enDefaultLocationGroup].obs;
    _locationsService.all = [enDefaultLocationGroup];

    selectedGroup = enDefaultLocationGroup.obs;
  }

  void addLocationGroup(LocationGroup locationGroup) {
    groups.add(locationGroup);
    _locationsService.all = groups;
  }

  void selectLocationGroup(LocationGroup locationGroup) {
    selectedGroup.value = locationGroup;
  }

  void editLocationGroup(String oldName, LocationGroup locationGroup) {
    final index = groups.indexWhere((l) => l.name == oldName);

    groups[index] = locationGroup;

    _locationsService.all = groups;

    if (oldName == selectedGroup.value.name) {
      selectedGroup.value = locationGroup;
    }
  }

  void deleteLocationGroup(LocationGroup locationGroup) {
    groups.remove(locationGroup);
    _locationsService.all = groups;
  }

  LocationGroup getGroupByName(String groupName) =>
      groups.firstWhere((g) => g.name == groupName);

  Future<void> exportLocations() async {
    final bytes = utf8.encode(const JsonEncoder.withIndent('  ').convert(
      {'locationGroups': groups.map((g) => g.toJson()).toList()},
    ));

    final now = DateTime.now();

    await FilePicker.platform.saveFile(
      dialogTitle: AppLocale.export,
      fileName: 'spyfall_${now.day}-${now.month}-${now.year}.json',
      type: FileType.custom,
      allowedExtensions: ['json'],
      bytes: bytes,
    );
  }

  Future<void> importLocations() async {
    final pick = await FilePicker.platform.pickFiles(
      dialogTitle: AppLocale.import,
      type: FileType.custom,
      allowedExtensions: ['json'],
      withData: true,
    );

    if (pick == null || pick.files.length != 1) return;

    final bytes = await pick.files[0].xFile.readAsBytes();

    final json = jsonDecode(utf8.decode(bytes)) as Map<String, dynamic>;

    for (LocationGroup import in (json['locationGroups'] as List<dynamic>)
        .map((j) => LocationGroup.fromJson(j))
        .toList()) {
      while (groups.where((g) => g.name == import.name).isNotEmpty) {
        import = import.copyWith(name: '${import.name}*');
      }
      addLocationGroup(import);
    }
  }
}
