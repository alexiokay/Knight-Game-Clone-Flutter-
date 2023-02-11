import 'package:flutter/material.dart';

import 'package:Cyber_Knights/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:Cyber_Knights/providers/player_controller.dart';

class MedicScreen extends StatefulWidget {
  const MedicScreen({super.key});

  @override
  State<MedicScreen> createState() => _MedicScreen();
}

class _MedicScreen extends State<MedicScreen> {
  final wasHealed = false.obs;
  @override
  Widget build(BuildContext context) {
    PlayerController playerControler = Get.put(PlayerController());
    return Column(children: [
      Container(
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
                          Text('Medic',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                          Obx(() => playerControler.hitpoints < 100
                              ? Text(
                                  'Go to medic for healing, needed silver coins wil be taken directly from your treasury ',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.right)
                              : Text('You are healthy, no need to go to medic',
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.right))
                        ])) /*  )
          ])
          add child content here */
                ,
              ),
            ],
          )),
      Obx(
        () => playerControler.hitpoints < 100
            ? Container(
                margin: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width * 0.50,
                child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.only(left: 5)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {
                      playerControler.hitpoints.value = 100;
                      wasHealed.value = true;
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Heal yourself for',
                              style: TextStyle(color: Colors.white)),
                          Image.asset('assets/icons/duel.png', width: 30),
                          Text('200', style: TextStyle(color: Colors.white)),
                        ])),
              )
            : Text(''),
      ),
      Obx(() => wasHealed.value == true ? HealedNotification() : Container())
    ]);
  }
}

class HealedNotification extends StatelessWidget {
  HealedNotification();

  @override
  Widget build(BuildContext context) {
    PlayerController playerControler = Get.put(PlayerController());
    return Container(
        width: double.infinity,
        height: 90,
        color: Colors.red,
        child: Text('Success, You have been successfully healed',
            style: TextStyle(color: Colors.white)));
  }
}
