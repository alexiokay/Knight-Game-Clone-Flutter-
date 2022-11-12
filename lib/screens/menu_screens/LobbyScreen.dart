import 'package:flutter/material.dart';

import 'package:myfirstapp/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/providers/player_controller.dart';

class LobbyScreen extends StatefulWidget {
  const LobbyScreen({super.key});

  @override
  State<LobbyScreen> createState() => _LobbyScreen();
}

class _LobbyScreen extends State<LobbyScreen> {
  @override
  Widget build(BuildContext context) {
    return Text('Lobby');
  }
}
