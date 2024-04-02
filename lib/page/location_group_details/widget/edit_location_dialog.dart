import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../controller/locations_controller.dart';
import '../../../model/location_group.dart';

class EditLocationDialog extends StatefulWidget {
  const EditLocationDialog({
    super.key,
    required this.locationGroup,
    required this.location,
  });
  final LocationGroup locationGroup;
  final String? location;

  @override
  State<EditLocationDialog> createState() => _EditLocationDialogState();
}

class _EditLocationDialogState extends State<EditLocationDialog> {
  final LocationsController _locationsController = Get.find();
  final _form = GlobalKey<FormState>();
  var _input = '';
  late final bool _newLocation;

  @override
  void initState() {
    if (widget.location != null) {
      _newLocation = false;
      _input = widget.location!;
    } else {
      _newLocation = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    return AlertDialog(
      content: Form(
        key: _form,
        child: TextFormField(
          textInputAction: TextInputAction.done,
          initialValue: _newLocation ? '' : widget.location!,
          decoration: InputDecoration(labelText: appLocal.location),
          validator: (value) {
            if (value == null || value.length < 2) {
              return appLocal.tooShort;
            }
            if (widget.locationGroup.locations.firstWhereOrNull(
                    (l) => l.toLowerCase() == value.toLowerCase()) !=
                null) {
              if (_newLocation ||
                  widget.location!.toLowerCase() != value.toLowerCase()) {
                return appLocal.alreadyUsed;
              }
            }
            return null;
          },
          onChanged: (value) => _input = value,
          onFieldSubmitted: (_) => _newLocation ? _addLocation() : _editLocation(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _newLocation ? _addLocation : _editLocation,
          child: const Text('Ok'),
        ),
        TextButton(
          onPressed: Get.back,
          child: Text(appLocal.cancel),
        ),
      ],
    );
  }

  Future<void> _addLocation() async {
    if (!_form.currentState!.validate()) {
      return;
    }
    _form.currentState!.save();
    final editedGroup = LocationGroup(widget.locationGroup.name,
        locations: List.of([...widget.locationGroup.locations, _input]));
    await _locationsController.editLocationGroup(
        widget.locationGroup.name, editedGroup);
    Get.back();
  }

  Future<void> _editLocation() async {
    if (!_form.currentState!.validate()) {
      return;
    }
    _form.currentState!.save();
    final editedGroup = LocationGroup.copy(widget.locationGroup);
    final index =
        editedGroup.locations.indexWhere((l) => l == widget.location!);
    editedGroup.locations[index] = _input;
    await _locationsController.editLocationGroup(
        widget.locationGroup.name, editedGroup);
    Get.back();
  }
}
