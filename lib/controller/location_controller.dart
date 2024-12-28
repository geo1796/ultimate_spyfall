import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_local/app_local.dart';
import 'package:ultimate_spyfall/model/location_group.dart';
import 'package:ultimate_spyfall/service/locations_service.dart';

class LocationController extends GetxController {
  final LocationsService _locationsService = Get.find();

  late final RxList<LocationGroup> groups;
  late final Rx<LocationGroup> selectedGroup;

  @override
  void onInit() async {
    super.onInit();
    _onInit();
  }

  void _onInit() async {
    final storedLocations = _locationsService.all;

    if (storedLocations.isEmpty) {
      setupDefaultLocations(AppLocal.localeName);
      return;
    }

    groups = storedLocations.obs;
    selectedGroup = _locationsService.selected.obs;
  }

  Future<void> setupDefaultLocations(String localeName) async {
    localeName == 'fr' ? await _setupFrLocations() : await _setupEnLocations();
  }

  Future<void> _setupFrLocations() async {
    groups.add(frDefaultLocationGroup);
    _locationsService.all = [frDefaultLocationGroup];

    selectedGroup.value = frDefaultLocationGroup;
    _locationsService.selected = frDefaultLocationGroup;
  }

  Future<void> _setupEnLocations() async {
    groups.add(enDefaultLocationGroup);
    _locationsService.all = [enDefaultLocationGroup];

    selectedGroup.value = enDefaultLocationGroup;
    _locationsService.selected = enDefaultLocationGroup;
  }

  Future<void> addLocationGroup(LocationGroup locationGroup) async {
    groups.add(locationGroup);
    _locationsService.all = groups;
  }

  Future<void> selectLocationGroup(LocationGroup locationGroup) async {
    selectedGroup.value = locationGroup;
    _locationsService.selected = locationGroup;
  }

  Future<void> editLocationGroup(
      String oldName, LocationGroup locationGroup) async {
    final index = groups.indexWhere((l) => l.name == oldName);

    groups[index] = locationGroup;

    _locationsService.all = groups;
  }
}
