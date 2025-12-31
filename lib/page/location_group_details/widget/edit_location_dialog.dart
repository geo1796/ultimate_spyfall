import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_locale/app_locale.dart';
import 'package:ultimate_spyfall/page/location_group_details/bindings/location_group_details_controller.dart';

class EditLocationDialog extends StatelessWidget {
  const EditLocationDialog({
    super.key,
    this.location,
  });
  final String? location;

  bool get isNewLocation => location == null;

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<LocationGroupDetailsController>();

    return AlertDialog(
      content: Form(
        key: ctrl.form,
        child: TextFormField(
          textInputAction: TextInputAction.done,
          initialValue: location ?? '',
          decoration: InputDecoration(labelText: AppLocale.location),
          validator: (value) {
            if (value == null || value.length < 2) {
              return AppLocale.tooShort;
            }
            if (ctrl.group.value.locations.firstWhereOrNull(
                    (l) => l.toLowerCase() == value.toLowerCase()) !=
                null) {
              if (isNewLocation ||
                  location!.toLowerCase() != value.toLowerCase()) {
                return AppLocale.alreadyUsed;
              }
            }
            return null;
          },
          onSaved: (value) => ctrl.locationData = value!,
          onFieldSubmitted: (_) =>
              isNewLocation ? ctrl.addLocation() : ctrl.editLocation(location!),
        ),
      ),
      actions: [
        TextButton(
          onPressed: isNewLocation
              ? () => ctrl.addLocation()
              : () => ctrl.editLocation(location!),
          child: const Text('Ok'),
        ),
        TextButton(
          onPressed: Get.back,
          child: Text(AppLocale.cancel),
        ),
      ],
    );
  }
}
