import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_locale/app_locale.dart';
import 'package:ultimate_spyfall/page/game/game_page.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Get.offAllNamed(GamePage.route),
      child: Text(AppLocale.play),
    );
  }
}
