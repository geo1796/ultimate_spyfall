import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/location_group.dart';

class LocationsService extends GetxService {
  final _box = GetStorage();

  Future<List<LocationGroup>> getAll() async {
    if (!_box.hasData('locationGroups')) {
      return [];
    }
    var jsonLocations = _box.read('locationGroups') as List<dynamic>;
    return jsonLocations.map((jl) => LocationGroup.fromJson(jl)).toList();
  }

  Future<void> setAll(List<LocationGroup> locationGroups) async {
    await _box.write(
        'locationGroups', locationGroups.map((l) => l.toJson()).toList());
  }

  Future<LocationGroup> getCurrent() async {
    return LocationGroup.fromJson(_box.read('currentLocationGroup'));
  }

  Future<void> setCurrent(LocationGroup locationGroup) async {
    await _box.write('currentLocationGroup', locationGroup.toJson());
  }
}
