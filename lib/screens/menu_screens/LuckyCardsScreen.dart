import 'package:flutter/material.dart';

import 'package:Cyber_Knights/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:Cyber_Knights/providers/player_controller.dart';

class LuckyCardsScreen extends StatefulWidget {
  const LuckyCardsScreen({super.key});

  @override
  State<LuckyCardsScreen> createState() => _LuckyCardsScreen();
}

class _LuckyCardsScreen extends State<LuckyCardsScreen> {
  @override
  Widget build(BuildContext context) {
    PlayerController playerControler = Get.put(PlayerController());
    return SingleChildScrollView(
        child: IntrinsicHeight(
            child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[HeaderLuckyCards()]))));
  }
}

class HeaderLuckyCards extends StatelessWidget {
  HeaderLuckyCards();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 80,
        color: Color.fromARGB(255, 35, 20, 7),
        child: Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lucky Cards',
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.start,
              ),
              Text(
                'let destiny draw a random card for you and you will get your reward. Get yourself new cards if you want a sword of chances for other rewards ',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ]));
  }
}
