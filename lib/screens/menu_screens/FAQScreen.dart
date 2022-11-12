import 'package:flutter/material.dart';

import 'package:myfirstapp/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/providers/player_controller.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreen();
}

class _FaqScreen extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Text('Faq');
  }
}
