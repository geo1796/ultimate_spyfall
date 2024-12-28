import 'dart:async';

import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_local/app_local.dart';
import 'package:ultimate_spyfall/model/location_group.dart';
import 'package:ultimate_spyfall/bindings/location/location_service.dart';

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

  void _onInit() async {
    final storedLocations = _locationsService.all;

    if (storedLocations.isEmpty) {
      await setupDefaultLocations(AppLocal.localeName);
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

  Future<void> setupDefaultLocations(String localeName) async {
    localeName == 'fr' ? await _setupFrLocations() : await _setupEnLocations();
  }

  Future<void> _setupFrLocations() async {
    groups = [frDefaultLocationGroup].obs;
    _locationsService.all = [frDefaultLocationGroup];

    selectedGroup = frDefaultLocationGroup.obs;
  }

  Future<void> _setupEnLocations() async {
    groups = [enDefaultLocationGroup].obs;
    _locationsService.all = [enDefaultLocationGroup];

    selectedGroup = enDefaultLocationGroup.obs;
  }

  Future<void> addLocationGroup(LocationGroup locationGroup) async {
    groups.add(locationGroup);
    _locationsService.all = groups;
  }

  Future<void> selectLocationGroup(LocationGroup locationGroup) async {
    selectedGroup.value = locationGroup;
  }

  Future<void> editLocationGroup(
      String oldName, LocationGroup locationGroup) async {
    final index = groups.indexWhere((l) => l.name == oldName);

    groups[index] = locationGroup;

    _locationsService.all = groups;
  }
}
