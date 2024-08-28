import 'package:flutter/material.dart';

import '../../../model/location_group.dart';
import 'edit_location_dialog.dart';

class LocationTile extends StatelessWidget {
  const LocationTile({
    super.key,
    required this.locationGroup,
    required this.location,
  });
  final LocationGroup locationGroup;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      child: ListTile(
        leading: const Icon(Icons.place),
        title: Text(location),
        trailing: IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async => await showDialog(
                context: context,
                builder: (_) => EditLocationDialog(location: location))),
      ),
    );
  }
}
