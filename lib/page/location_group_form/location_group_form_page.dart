import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/my_app_bar.dart';
import 'widget/location_group_form.dart';

class LocationGroupFormPage extends StatelessWidget {
  const LocationGroupFormPage({super.key});
  static const route = '/location-group-form';

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: myAppBar(context, appLocal.newLocationGroup, withDrawer: false),
      body: const LocationGroupForm(),
    );
  }
}
