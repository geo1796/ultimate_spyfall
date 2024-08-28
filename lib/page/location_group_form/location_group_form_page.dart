import 'package:flutter/material.dart';
import 'package:ultimate_spyfall/app_local/app_local.dart';

import '../../shared/my_app_bar.dart';
import 'widget/location_group_form.dart';

class LocationGroupFormPage extends StatelessWidget {
  const LocationGroupFormPage({super.key});
  static const route = '/location-group-form';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, AppLocal.newLocationGroup, withDrawer: false),
      body: const LocationGroupForm(),
    );
  }
}
