import 'package:flutter/material.dart';
import 'package:ultimate_spyfall/shared/play_button.dart';

import '../../shared/my_app_bar.dart';
import '../../shared/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'Ultimate Spyfall'),
      drawer: const MyDrawer(),
      body: const Center(child: PlayButton()),
    );
  }
}
