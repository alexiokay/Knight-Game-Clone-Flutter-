import 'package:flutter/material.dart';

import 'package:myfirstapp/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/providers/player_controller.dart';

class GameRulesScreen extends StatefulWidget {
  const GameRulesScreen({super.key});

  @override
  State<GameRulesScreen> createState() => _GameRulesScreen();
}

class _GameRulesScreen extends State<GameRulesScreen> {
  @override
  Widget build(BuildContext context) {
    return Text('Game Rules');
  }
}
