import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../shared/my_app_bar.dart';
import '../../shared/my_drawer.dart';
import '../location_group_form/location_group_form_page.dart';
import 'widget/location_groups_list_view.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({super.key});
  static const route = '/locations';

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.toNamed(LocationGroupFormPage.route),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        appBar: myAppBar(context, appLocal.locations),
        drawer: const MyDrawer(),
        body: const LocationGroupsListView());
  }
}
