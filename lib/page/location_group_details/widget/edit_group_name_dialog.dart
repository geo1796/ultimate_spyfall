import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_local/app_local.dart';
import 'package:ultimate_spyfall/bindings/location/location_controller.dart';
import 'package:ultimate_spyfall/page/location_group_details/bindings/location_group_details_controller.dart';

class EditGroupNameDialog extends StatelessWidget {
  const EditGroupNameDialog({super.key});

  LocationGroupDetailsController get _detailsCtrl =>
      Get.find<LocationGroupDetailsController>();
  LocationController get _locationCtrl => Get.find<LocationController>();

  @override
  Widget build(BuildContext context) {
    final group = _detailsCtrl.group;

    return AlertDialog(
      title: Text(AppLocal.listName),
      content: Form(
        key: _detailsCtrl.form,
        child: TextFormField(
          initialValue: group.value.name,
          textInputAction: TextInputAction.done,
          onSaved: (value) => _detailsCtrl.groupData = value!,
          onFieldSubmitted: (_) => _detailsCtrl.renameGroup(),
          validator: (value) {
            if (group.value.name == value) return null;

            if (value == null || value.isEmpty) {
              return AppLocal.tooShort;
            }

            for (final g in _locationCtrl.groups) {
              if (g.name == value) {
                return AppLocal.alreadyUsed;
              }
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(onPressed: Get.back, child: Text(AppLocal.cancel)),
        TextButton(
            onPressed: _detailsCtrl.renameGroup, child: Text(AppLocal.submit)),
      ],
    );
  }
}
