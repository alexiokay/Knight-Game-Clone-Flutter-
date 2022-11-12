import 'package:flutter/material.dart';

import 'package:myfirstapp/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/providers/player_controller.dart';

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
