import 'package:flutter/material.dart';

import 'package:myfirstapp/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/providers/player_controller.dart';

class OtherGamesScreen extends StatefulWidget {
  const OtherGamesScreen({super.key});

  @override
  State<OtherGamesScreen> createState() => _OtherGamesScreen();
}

class _OtherGamesScreen extends State<OtherGamesScreen> {
  @override
  Widget build(BuildContext context) {
    return Text('OtherGames');
  }
}
