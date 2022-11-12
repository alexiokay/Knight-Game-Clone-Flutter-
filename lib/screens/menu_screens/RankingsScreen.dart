import 'package:flutter/material.dart';

import 'package:myfirstapp/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/providers/player_controller.dart';

class RankingsScreen extends StatefulWidget {
  const RankingsScreen({super.key});

  @override
  State<RankingsScreen> createState() => _RankingsScreen();
}

class _RankingsScreen extends State<RankingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Text('Rankings');
  }
}
