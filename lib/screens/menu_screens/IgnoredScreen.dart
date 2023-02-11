import 'package:flutter/material.dart';

import 'package:Cyber_Knights/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:Cyber_Knights/providers/player_controller.dart';

class IgnoredScreen extends StatefulWidget {
  const IgnoredScreen({super.key});

  @override
  State<IgnoredScreen> createState() => _IgnoredScreen();
}

class _IgnoredScreen extends State<IgnoredScreen> {
  @override
  Widget build(BuildContext context) {
    return Text('Ignored');
  }
}
