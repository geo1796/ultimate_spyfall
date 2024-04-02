class LocationGroup {
  String name;

  List<String> locations;

  LocationGroup(this.name, {this.locations = const <String>[]});

  @override
  String toString() {
    return 'LocationGroup{name=$name, locations=$locations}';
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'locations': locations};
  }

  factory LocationGroup.fromJson(Map<String, dynamic> json) {
    return LocationGroup(
      json['name'],
      locations: (json['locations'] as List).cast<String>(),
    );
  }

  factory LocationGroup.copy(LocationGroup original) {
    return LocationGroup(original.name, locations: original.locations);
  }
}

final enDefaultLocationGroup = LocationGroup(
  'Default list',
  locations: <String>[
    'The Moon',
    'The Sun',
    'In Hell',
    'In Heaven',
    'The desert',
    'The beach',
    'The Eiffel Tower',
    'The kitchen',
    'In the shower',
    'Stuck in traffic',
    'On Rihanna\'s boat',
  ],
);

final frDefaultLocationGroup = LocationGroup(
  'Liste par défaut',
  locations: <String>[
    'La lune',
    'Le soleil',
    'En enfer',
    'Au paradis',
    'Le désert',
    'La plage',
    'La tour Eiffel',
    'La cuisine',
    'Sous la douche',
    'Bloqué dans les bouchons',
    'Sur le bâteau de Rihanna',
  ],
);
