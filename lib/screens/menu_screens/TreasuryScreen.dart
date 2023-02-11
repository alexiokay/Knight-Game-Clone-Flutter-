import 'package:flutter/material.dart';

import 'package:Cyber_Knights/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:Cyber_Knights/providers/player_controller.dart';

class TreasuryScreen extends StatefulWidget {
  const TreasuryScreen({super.key});

  @override
  State<TreasuryScreen> createState() => _TreasuryScreen();
}

class _TreasuryScreen extends State<TreasuryScreen> {
  @override
  Widget build(BuildContext context) {
    PlayerController playerControler = Get.put(PlayerController());
    return Column(children: [
      TreasuryHeader(),
      Container(width: double.infinity, height: 200, color: Colors.white),
    ]);
  }
}

class TreasuryHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icons/duel.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Row(
          children: [
            Expanded(flex: 2, child: Text('')),
            Expanded(
              flex: 3,
              child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Skarbiec',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        Text(
                            'You can hide your silver coins into that treasury, to hide them from robbers.',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.right),
                        Container(
                            margin: const EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.65,
                            height: 20,
                            color: Color.fromARGB(255, 0, 0, 0),
                            child: RichText(
                              text: TextSpan(
                                text: "Treasury:  ",
                                style: TextStyle(color: Colors.white),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: '2.000.455.555.000',
                                      style: TextStyle(color: Colors.blue)),
                                ],
                              ),
                            )),
                      ])) /*  )
          ])
          add child content here */
              ,
            ),
          ],
        ));
  }
}
