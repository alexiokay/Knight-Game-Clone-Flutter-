// screen_b.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:Cyber_Knights/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:Cyber_Knights/providers/player_controller.dart';
import 'package:Cyber_Knights/components/shop_item.dart';

var item1 = Item(title: 'Antim', asset: 'assets/icons/duel.png', type: 'bow');
var item2 = Item(title: 'Ur', asset: 'assets/icons/duel.png', type: 'sword');
var item3 = Item(title: 'Wood', asset: 'assets/icons/duel.png', type: 'shield');

var items = [item1, item2];
var items2 = [item2, item3];

class ScreenEquipment extends StatefulWidget {
  const ScreenEquipment({super.key});

  @override
  State<ScreenEquipment> createState() => _ScreenEquipment();
}

class _ScreenEquipment extends State<ScreenEquipment> {
  bool _isMapOpen = true;
  double _animatedHeight = 240.0;

  void shopMap() {
    setState(() {
      _isMapOpen = !_isMapOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: IntrinsicHeight(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Column(
          children: [
            Stack(children: [
              Container(
                child: Column(children: [
                  Header(title: 'Uzbrojenie'),
                  Column(
                    children: [
                      for (var item in items)
                        Column(
                          children: [
                            ShopItem(
                              title: item.title,
                              reward: 2,
                              experience: 2,
                              loot: false,
                              cost: 4,
                              progress: 2,
                            ),
                          ],
                        )
                    ],
                  ),
                ]),
              ),
            ]),
          ],
        ),
      ],
    )));
  }
}

class Header extends StatelessWidget {
  Header({required this.title});

  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 140,
        color: Color.fromARGB(255, 35, 20, 7),
        child: Column(children: [
          Armament(),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Container(
            height: 10,
            child: Image.asset('assets/icons/duel.png'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
                alignment: Alignment.topLeft,
                height: 60,
                child: Text(
                  'Twoje bractwo rycerskie używa podczas ataków Twoje najsilniejsze uzbrojenie. Każdy członek bractwa może użyć maksymalnie 1x broń, 1x tarczę i 1x zbroję.',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'New Armaments will be unlocked at level  ',
              style: TextStyle(
                  color: Color.fromARGB(255, 232, 124, 23), fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ),
        ]));
  }
}

class Armament extends StatelessWidget {
  Armament();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        width: 160,
        height: 20,
        color: Colors.white,
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Text(
              'Armor',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Armor',
              textAlign: TextAlign.center,
            ),
          ),
          const Expanded(
            flex: 1,
            child: Text(
              'Armor',
              textAlign: TextAlign.center,
            ),
          ),
        ]));
  }
}
