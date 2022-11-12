import 'package:flutter/material.dart';

import 'package:myfirstapp/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/providers/player_controller.dart';

class GuildScreen extends StatefulWidget {
  const GuildScreen({super.key});

  @override
  State<GuildScreen> createState() => _GuildScreen();
}

class _GuildScreen extends State<GuildScreen> {
  @override
  Widget build(BuildContext context) {
    return Text('Guild');
  }
}
