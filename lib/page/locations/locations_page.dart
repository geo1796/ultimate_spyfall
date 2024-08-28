import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_local/app_local.dart';

import '../../shared/my_app_bar.dart';
import '../../shared/my_drawer.dart';
import '../location_group_form/location_group_form_page.dart';
import 'widget/location_group_list.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({super.key});
  static const route = '/locations';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(LocationGroupFormPage.route),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: myAppBar(context, AppLocal.locations),
        drawer: const MyDrawer(),
        body: const LocationGroupList());
  }
}
