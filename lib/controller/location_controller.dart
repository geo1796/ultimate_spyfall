import 'package:get/get.dart';

import '../model/location_group.dart';
import '../service/locations_service.dart';

class LocationController extends GetxController {
  final LocationsService _locationsService = Get.find();
  
  var setupCompleted = false;

  final groups = <LocationGroup>[].obs;
  final currentGroup = Rxn<LocationGroup>(null);

  @override
  void onInit() async {
    final storedLocations = await _locationsService.getAll();
    if (storedLocations.isNotEmpty) {
      setupCompleted = true;
      groups.value = storedLocations;
      currentGroup.value = await _locationsService.getCurrent();
    }
    super.onInit();
  }

  Future<void> setupDefaultLocations(String localeName) async {
    if (setupCompleted) {
      return;
    }
    localeName == 'fr' ? await _setupFrLocations() : await _setupEnLocations();
    setupCompleted = true;
  }

  Future<void> _setupFrLocations() async {
    groups.add(frDefaultLocationGroup);
    await _locationsService.setAll([frDefaultLocationGroup]);
    currentGroup.value = frDefaultLocationGroup;
    await _locationsService.setCurrent(frDefaultLocationGroup);
  }

  Future<void> _setupEnLocations() async {
    groups.add(enDefaultLocationGroup);
    await _locationsService.setAll([enDefaultLocationGroup]);
    currentGroup.value = enDefaultLocationGroup;
    await _locationsService.setCurrent(enDefaultLocationGroup);
  }

  Future<void> addLocationGroup(LocationGroup locationGroup) async {
    groups.add(locationGroup);
    await _locationsService.setAll(groups);
  }

  Future<void> setCurrent(LocationGroup locationGroup) async {
    currentGroup.value = locationGroup;
    await _locationsService.setCurrent(locationGroup);
  }

  Future<void> editLocationGroup(
      String oldName, LocationGroup locationGroup) async {
    final index = groups.indexWhere((l) => l.name == oldName);
    groups[index] = locationGroup;
    await _locationsService.setAll(groups);
  }
}
