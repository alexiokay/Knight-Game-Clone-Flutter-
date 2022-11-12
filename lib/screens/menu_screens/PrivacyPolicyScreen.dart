import 'package:flutter/material.dart';

import 'package:myfirstapp/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/providers/player_controller.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreen();
}

class _PrivacyPolicyScreen extends State<PrivacyPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Text('PrivacyPolicy');
  }
}
