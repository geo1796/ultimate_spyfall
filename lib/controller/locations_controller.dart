import 'package:get/get.dart';

import '../model/location_group.dart';
import '../service/locations_service.dart';

class LocationsController extends GetxController {
  final LocationsService _locationsService = Get.find();
  var setupCompleted = false;
  final locationGroups = <LocationGroup>[].obs;
  final currentGroup = Rxn<LocationGroup>(null);

  @override
  void onInit() async {
    final storedLocations = await _locationsService.getAll();
    if (storedLocations.isNotEmpty) {
      setupCompleted = true;
      locationGroups.value = storedLocations;
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
    locationGroups.add(frDefaultLocationGroup);
    await _locationsService.setAll([frDefaultLocationGroup]);
    currentGroup.value = frDefaultLocationGroup;
    await _locationsService.setCurrent(frDefaultLocationGroup);
  }

  Future<void> _setupEnLocations() async {
    locationGroups.add(enDefaultLocationGroup);
    await _locationsService.setAll([enDefaultLocationGroup]);
    currentGroup.value = enDefaultLocationGroup;
    await _locationsService.setCurrent(enDefaultLocationGroup);
  }

  Future<void> addLocationGroup(LocationGroup locationGroup) async {
    locationGroups.add(locationGroup);
    await _locationsService.setAll(locationGroups);
  }

  Future<void> setCurrent(LocationGroup locationGroup) async {
    currentGroup.value = locationGroup;
    await _locationsService.setCurrent(locationGroup);
  }
}
