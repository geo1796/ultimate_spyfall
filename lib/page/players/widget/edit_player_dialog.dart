import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../controller/player_controller.dart';
import '../../../model/player.dart';

class EditPlayerDialog extends StatefulWidget {
  const EditPlayerDialog(this.player, {super.key});
  final Player? player;

  @override
  State<EditPlayerDialog> createState() => _EditPlayerDialogState();
}

class _EditPlayerDialogState extends State<EditPlayerDialog> {
  final PlayerController _playerController = Get.find();
  final _form = GlobalKey<FormState>();
  var _input = '';
  late final bool _newPlayer;

  @override
  void initState() {
    if (widget.player != null) {
      _newPlayer = false;
      _input = widget.player!.name;
    } else {
      _newPlayer = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    return AlertDialog(
      content: Form(
        key: _form,
        child: TextFormField(
          textInputAction: TextInputAction.done,
          initialValue: _newPlayer ? '' : widget.player!.name,
          decoration: InputDecoration(
            labelText: appLocal.playerName,
          ),
          validator: (value) {
            if (value == null || value.length < 2) {
              return appLocal.tooShort;
            }
            if (_playerController.players.firstWhereOrNull(
                    (p) => p.name.toLowerCase() == value.toLowerCase()) !=
                null) {
              if (_newPlayer ||
                  widget.player!.name.toLowerCase() != value.toLowerCase()) {
                return appLocal.alreadyUsed;
              }
            }
            return null;
          },
          onChanged: (value) => _input = value,
          onFieldSubmitted: (_) => _newPlayer ? _addPlayer() : _renamePlayer(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: _newPlayer ? _addPlayer : _renamePlayer,
          child: const Text('Ok'),
        ),
        TextButton(
          onPressed: Get.back,
          child: Text(appLocal.cancel),
        ),
      ],
    );
  }

  Future<void> _addPlayer() async {
    if (!_form.currentState!.validate()) {
      return;
    }
    _form.currentState!.save();
    await _playerController.addPlayer(Player(_input));
    Get.back();
  }

  Future<void> _renamePlayer() async {
    if (!_form.currentState!.validate()) {
      return;
    }
    _form.currentState!.save();
    await _playerController.renamePlayer(widget.player!.name, Player(_input));
    Get.back();
  }
}
