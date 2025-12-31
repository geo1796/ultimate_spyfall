import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_locale/app_locale.dart';
import 'package:ultimate_spyfall/page/players/bindings/players_page_controller.dart';

import '../../../model/player.dart';

class EditPlayerDialog extends StatelessWidget {
  const EditPlayerDialog({
    super.key,
    this.player,
  });
  final Player? player;

  bool get isNewPlayer => player == null;

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<PlayersPageController>();
    return AlertDialog(
      content: Form(
        key: ctrl.form,
        child: TextFormField(
          textInputAction: TextInputAction.done,
          initialValue: isNewPlayer ? '' : player!.name,
          decoration: InputDecoration(
            labelText: AppLocale.playerName,
          ),
          validator: (value) {
            if (value == null || value.length < 2) {
              return AppLocale.tooShort;
            }
            if (ctrl.currentPlayers.firstWhereOrNull(
                    (p) => p.name.toLowerCase() == value.toLowerCase()) !=
                null) {
              if (isNewPlayer ||
                  player!.name.toLowerCase() != value.toLowerCase()) {
                return AppLocale.alreadyUsed;
              }
            }
            return null;
          },
          onSaved: (value) => ctrl.data = value!,
          onFieldSubmitted: (_) =>
              isNewPlayer ? ctrl.addPlayer() : ctrl.renamePlayer(player!),
        ),
      ),
      actions: [
        TextButton(
          onPressed: isNewPlayer
              ? () => ctrl.addPlayer()
              : () => ctrl.renamePlayer(player!),
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
