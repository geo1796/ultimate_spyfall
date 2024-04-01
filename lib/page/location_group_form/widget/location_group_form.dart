import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../controller/locations_controller.dart';
import '../../../model/location_group.dart';

class LocationGroupForm extends StatefulWidget {
  const LocationGroupForm({super.key});

  @override
  State<LocationGroupForm> createState() => _LocationGroupFormState();
}

class _LocationGroupFormState extends State<LocationGroupForm> {
  final LocationsController _locationsController = Get.find();
  final _form = GlobalKey<FormState>();
  final _newGroup = LocationGroup('', locations: List.generate(10, (i) => ''));
  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    return SingleChildScrollView(
      child: Column(
        children: [
          IconButton(onPressed: _onSubmit, icon: const Icon(Icons.save)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: _form,
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'List name'),
                      textInputAction: TextInputAction.next,
                      onChanged: (value) => _newGroup.name = value,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return appLocal.tooShort;
                        }
                        for (final lg in _locationsController.locationGroups) {
                          if (lg.name == value) {
                            return appLocal.alreadyUsed;
                          }
                        }
                        return null;
                      },
                    ),
                    ...List.generate(
                        10,
                        (i) => TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Location ${i + 1}'),
                              textInputAction: i == 10
                                  ? TextInputAction.done
                                  : TextInputAction.next,
                              onChanged: (value) =>
                                  _newGroup.locations[i] = value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return appLocal.tooShort;
                                }
                                for (var y = 0;
                                    y < _newGroup.locations.length;
                                    y++) {
                                  if (_newGroup.locations[y] == value &&
                                      y != i) {
                                    return appLocal.alreadyUsed;
                                  }
                                }
                                return null;
                              },
                            )),
                    const SizedBox(height: 50.0),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Future<void> _onSubmit() async {
    if (!_form.currentState!.validate()) {
      return;
    }
    await _locationsController.addLocationGroup(_newGroup);
    Get.back();
  }
}
