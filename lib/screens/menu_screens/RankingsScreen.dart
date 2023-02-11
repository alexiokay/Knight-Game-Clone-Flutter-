import 'package:flutter/material.dart';

import 'package:Cyber_Knights/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:Cyber_Knights/providers/player_controller.dart';

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
