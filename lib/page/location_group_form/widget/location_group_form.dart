import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_local/app_local.dart';
import 'package:ultimate_spyfall/page/location_group_form/bindings/location_group_form_controller.dart';

class LocationGroupForm extends StatelessWidget {
  const LocationGroupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formCtrl = Get.find<LocationGroupFormController>();
    return SingleChildScrollView(
      child: Column(
        children: [
          IconButton(
              onPressed: formCtrl.onSubmit, icon: const Icon(Icons.save)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: formCtrl.form,
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: AppLocal.listName),
                      textInputAction: TextInputAction.next,
                      onSaved: (value) => formCtrl.newGroup.name = value!,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return AppLocal.tooShort;
                        }
                        for (final g in formCtrl.currentGroups) {
                          if (g.name == value) {
                            return AppLocal.alreadyUsed;
                          }
                        }
                        return null;
                      },
                    ),
                    ...List.generate(
                        10,
                        (i) => TextFormField(
                              decoration: InputDecoration(
                                  labelText: '${AppLocal.location} ${i + 1}'),
                              textInputAction: i == 10
                                  ? TextInputAction.done
                                  : TextInputAction.next,
                              onChanged: (value) =>
                                  formCtrl.newGroup.locations[i] = value,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return AppLocal.tooShort;
                                }
                                for (var y = 0;
                                    y < formCtrl.newGroup.locations.length;
                                    y++) {
                                  if (formCtrl.newGroup.locations[y] == value &&
                                      y != i) {
                                    return AppLocal.alreadyUsed;
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
}
