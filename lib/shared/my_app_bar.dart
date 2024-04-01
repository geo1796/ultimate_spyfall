import 'package:flutter/material.dart';

import 'theme_switch.dart';

AppBar myAppBar(BuildContext context, String title, {bool withDrawer = true}) {
  return AppBar(
    title: Text(title),
    leading: withDrawer
        ? Builder(
            builder: (ctx) => IconButton(
              onPressed: Scaffold.of(ctx).openDrawer,
              icon: const Icon(Icons.menu),
            ),
          )
        : null,
    actions: const [ThemeSwitch()],
  );
}
