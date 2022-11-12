import 'package:flutter/material.dart';

import 'package:myfirstapp/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/providers/player_controller.dart';

class FactionsScreen extends StatefulWidget {
  const FactionsScreen({super.key});

  @override
  State<FactionsScreen> createState() => _FactionsScreen();
}

class _FactionsScreen extends State<FactionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Text('Factions');
  }
}
