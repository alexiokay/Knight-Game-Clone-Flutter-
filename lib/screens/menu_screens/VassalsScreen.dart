import 'package:flutter/material.dart';

import 'package:myfirstapp/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/providers/player_controller.dart';
import 'package:intl/intl.dart';
import 'package:myfirstapp/components/shop_item.dart';

class Vassal {
  String name;
  int income;
  int levelRequired;

  Vassal(this.name, this.income, this.levelRequired);
}

List Vassals = [
  Vassal('Żebrak', 100, 6),
  Vassal('Chłop', 100, 11),
  Vassal('Błazen', 100, 17),
  Vassal('Oprawca', 100, 22),
  Vassal('Mnich', 100, 27),
  Vassal('Alchemik', 100, 32),
  Vassal('Dziedzic', 100, 37),
  Vassal('Kupiec', 100, 42),
  Vassal('Rycerz', 100, 47),
  Vassal('Książę', 100, 31),
];

class VassalsScreen extends StatefulWidget {
  const VassalsScreen({super.key});

  @override
  State<VassalsScreen> createState() => _VassalsScreen();
}

class _VassalsScreen extends State<VassalsScreen> {
  @override
  Widget build(BuildContext context) {
    PlayerController playerControler = Get.put(PlayerController());
    return SingleChildScrollView(
        child: IntrinsicHeight(
            child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      HeaderVassals(),
                      Bilans(),
                      for (var vassal
                          in Vassals) // display vassals if required level match
                        if (vassal.levelRequired <= playerControler.level.value)
                          ShopItem(
                              title: vassal.name,
                              reward: 2,
                              experience: 2,
                              loot: false,
                              cost: 4,
                              progress: 2,
                              income: vassal.income,
                              type: 'vassal'),
                      SizedBox(height: 300)
                    ]))));
  }
}

class HeaderVassals extends StatelessWidget {
  HeaderVassals();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 60,
        color: Color.fromARGB(255, 35, 20, 7),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Vassals',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Container(
            height: 10,
            child: Image.asset('assets/icons/duel.png'),
          ),
        ]));
  }
}

class Bilans extends StatelessWidget {
  Bilans();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Bilans', style: TextStyle(color: Colors.white)),
      Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          height: 1,
          width: double.infinity,
          color: Colors.white),
      Row(
        children: [
          Expanded(
              flex: 2,
              child: Text('Dochód', style: TextStyle(color: Colors.white))),
          Expanded(
              flex: 2,
              child: Row(children: [
                Image.asset('assets/icons/duel.png', width: 20, height: 20),
                Text(' + 12.000',
                    style: TextStyle(color: Color.fromARGB(255, 255, 123, 0)))
              ]))
        ],
      ),
      SizedBox(height: 4),
      Row(
        children: [
          Expanded(
              flex: 2,
              child: Text('Bonus podatkowy: ',
                  style: TextStyle(color: Colors.white))),
          Expanded(
              flex: 2,
              child: Row(children: [
                Image.asset('assets/icons/duel.png', width: 20, height: 20),
                Text(' + 13.000.000',
                    style: TextStyle(color: Color.fromARGB(255, 255, 123, 0)))
              ]))
        ],
      ),
      SizedBox(height: 4),
      Row(
        children: [
          Expanded(
              flex: 2,
              child: Text('Utrzymanie', style: TextStyle(color: Colors.white))),
          Expanded(
              flex: 2,
              child: Row(children: [
                Image.asset('assets/icons/duel.png', width: 20, height: 20),
                Text(' + 13.000',
                    style: TextStyle(color: Color.fromARGB(255, 255, 123, 0)))
              ]))
        ],
      ),
      SizedBox(height: 4),
      Container(
          margin: const EdgeInsets.only(top: 5, bottom: 5),
          height: 0.4,
          width: double.infinity,
          color: Colors.white),
      Row(
        children: [
          Expanded(
              flex: 2,
              child: Text('Zaopatrzenie: ',
                  style: TextStyle(color: Colors.white))),
          Expanded(
              flex: 2,
              child: Row(children: [
                Image.asset('assets/icons/duel.png', width: 20, height: 20),
                RichText(
                  text: TextSpan(
                    text: " + 14.000.000",
                    style: TextStyle(color: Color.fromARGB(255, 255, 123, 0)),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' co 20 min',
                          style: TextStyle(
                              color: Color.fromARGB(255, 171, 171, 171))),
                    ],
                  ),
                )
              ]))
        ],
      ),
      SizedBox(height: 4),
      Row(
        children: [
          Expanded(
              flex: 3,
              child: Text('Next payment after: 20 minutes',
                  style: TextStyle(color: Colors.white))),
        ],
      ),
    ]);
  }
}
