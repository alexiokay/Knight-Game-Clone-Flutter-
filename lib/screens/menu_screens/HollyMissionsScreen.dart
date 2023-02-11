import 'package:flutter/material.dart';

import 'package:Cyber_Knights/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:Cyber_Knights/providers/player_controller.dart';

class HollyMissionsScreen extends StatefulWidget {
  const HollyMissionsScreen({super.key});

  @override
  State<HollyMissionsScreen> createState() => _HollyMissionsScreen();
}

class _HollyMissionsScreen extends State<HollyMissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Text('Holly Missions');
  }
}
