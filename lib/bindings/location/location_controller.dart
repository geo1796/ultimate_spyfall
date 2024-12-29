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

  void _onInit() {
    final storedLocations = _locationsService.all;

    if (storedLocations.isEmpty) {
      setupDefaultLocations(AppLocal.localeName);
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
}
