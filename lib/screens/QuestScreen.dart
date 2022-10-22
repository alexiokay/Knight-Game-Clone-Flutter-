// screen_b.dart

import 'package:myfirstapp/game_objects/Quests.dart';
import 'package:myfirstapp/game_objects/Items.dart';
import 'package:myfirstapp/game_objects/MapLocation.dart';
import 'package:get/get.dart';

import 'package:myfirstapp/game_objects/Player.dart';
import 'package:provider/provider.dart';
import 'package:myfirstapp/providers/old_player_provider.dart';
import 'package:myfirstapp/providers/player_controller.dart';

import 'package:flutter/material.dart';

var item1 = Item(title: 'Antim', asset: 'assets/icons/duel.png', type: 'bow');
var item2 = Item(title: 'Ur', asset: 'assets/icons/duel.png', type: 'sword');
var item3 = Item(title: 'Wood', asset: 'assets/icons/duel.png', type: 'shield');

var items = [item1, item2];
var items2 = [item2, item3];
var exampleRequirements = QuestRequirements(items: items);
var exampleRequirements2 = QuestRequirements(items: items2);

List<MapLocation> locations = [
  MapLocation(
      title: 'Norvum',
      levelAvailability: 0,
      rubinsAvalible: 10,
      quests: [
        Quest(
          title: "Kill skelletons",
          reward: 250.000,
          experience: 9,
          loot: true,
          cost: 8,
          progress: 0,
          requirements: exampleRequirements2,
        ),
        Quest(
          title: "Kill the Mad King",
          reward: 400.000,
          experience: 9,
          loot: true,
          cost: 10,
          progress: 0,
          requirements: exampleRequirements,
        ),
        Quest(
          title: "Kill spider mother",
          reward: 500.000,
          experience: 9,
          loot: false,
          cost: 18,
          progress: 0,
          requirements: exampleRequirements2,
        ),
      ])
];

var currentLocation = locations[0];

class ScreenQuest extends StatefulWidget {
  const ScreenQuest({super.key});

  @override
  State<ScreenQuest> createState() => _ScreenQuest();
}

class _ScreenQuest extends State<ScreenQuest> {
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
                  width: double.infinity,
                  child: Image.asset('assets/icons/map.jpg', fit: BoxFit.fill)),
              Container(
                child: Column(children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 120),
                    height: _animatedHeight,
                    child: Container(
                      width: double.infinity,
                      color: Colors.redAccent.withOpacity(0.0),
                    ),

                    //visible: _isMapOpen,
                  ),
                  InkWell(
                      child: Container(
                        height: 32,
                        width: double.infinity,
                        color: Color.fromARGB(255, 35, 20, 7),
                        child: Image.asset('assets/icons/duel.png', width: 20),
                      ),
                      onTap: () {
                        setState(() => {
                              _animatedHeight != 0.0
                                  ? _animatedHeight = 0.0
                                  : _animatedHeight = 240.0
                            });
                      }),
                  Container(
                      width: double.infinity,
                      height: 140,
                      color: Color.fromARGB(255, 35, 20, 7),
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                currentLocation.title,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                                textAlign: TextAlign.start,
                              ),
                              Text(
                                'Ruby deposits: ${currentLocation.rubinsAvalible} ',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        new Divider(
                            color: Colors.grey,
                            height: 7,
                            thickness: 0, //thickness of divier line
                            indent: 10, //Spacing at the top of divider.
                            endIndent: 10),
                        new Divider(
                            color: Colors.grey,
                            height: 1,
                            thickness: 0, //thickness of divier line
                            indent: 10, //Spacing at the top of divider.
                            endIndent: 10),
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Row(children: [
                            Text(
                              'degree of loyalty: ${currentLocation.rubinsAvalible} * ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                            Text(
                              'Tax bonus: ${currentLocation.rubinsAvalible} ',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ]),
                        ),
                        Container(
                          height: 10,
                          child: Image.asset('assets/icons/duel.png'),
                        ),
                        Container(height: 60),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            'New Missions will be unlocked at level: ',
                            style: TextStyle(
                                color: Color.fromARGB(255, 232, 124, 23),
                                fontSize: 13),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ])),
                  Column(children: [
                    for (var item in locations[0].quests) ...[
                      QuestWidget(
                        title: item.title,
                        reward: item.reward,
                        experience: item.experience,
                        loot: item.loot,
                        cost: item.cost,
                        progress: item.progress,
                        requirements: item.requirements,
                      ),
                      SizedBox(height: 50),
                    ],
                  ]),
                ]),
              ),
            ]),
          ],
        ),
      ],
    )));
  }
}

class QuestWidget extends StatefulWidget {
  final String? title;
  final double? reward;
  final int? experience;
  final bool? loot;
  final int cost;
  final int? progress;
  final QuestRequirements requirements;

  const QuestWidget({
    Key? key,
    this.title,
    this.reward,
    this.experience,
    this.loot,
    this.cost = 0,
    this.progress,
    required this.requirements,
  }) : super(key: key);

  @override
  _QuestWidget createState() => _QuestWidget();
}

class _QuestWidget extends State<QuestWidget> {
  bool _isVisible = false;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    PlayerController playerControler = Get.put(PlayerController());
    return Container(
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Container(
                  height: 60,
                  color: Colors.blue,
                  child: Column(children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 5, bottom: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${widget.title}',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text('${widget.progress} %',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15,
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: LinearProgressIndicator(
                          backgroundColor: Color.fromARGB(255, 35, 7, 5),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color.fromARGB(255, 255, 7, 7),
                          ),
                          value: (widget.progress! / 100),
                        ))
                  ])),
            ),
            Container(
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,

                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    SizedBox(
                                      height: 30,
                                      child:
                                          Image.asset('assets/icons/duel.png'),
                                    ),
                                    Text('${widget.reward}')
                                  ]),
                                  Row(children: [
                                    SizedBox(
                                      height: 30,
                                      child:
                                          Image.asset('assets/icons/duel.png'),
                                    ),
                                    Text('Experience ${widget.experience}')
                                  ]),
                                  Row(children: [
                                    SizedBox(
                                      height: 30,
                                      child:
                                          Image.asset('assets/icons/duel.png'),
                                    ),
                                    Text('Chance of loot: ${widget.loot}')
                                  ]),
                                  Row(children: [
                                    InkWell(
                                        child: Text(' + Prerequisities: ( )'),
                                        onTap: () {
                                          setState(() {
                                            _isVisible = !_isVisible;
                                          });
                                        }),

                                    ///
                                  ]),
                                  // Prerequisities toogler
                                ]),
                            OutlinedButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue),
                                ),
                                onPressed: () {
                                  playerControler.makeQuest(widget.cost);
                                },
                                child: Row(children: [
                                  SizedBox(
                                    height: 30,
                                    child: Image.asset('assets/icons/duel.png'),
                                  ),
                                  Text('${widget.cost}'),
                                ])),
                            //button
                          ]),
                    ),
                    Visibility(
                        visible: _isVisible,
                        child:
                            Prerequisities(requirements: widget.requirements))
                  ]),
            ),
          ]),
    );
  }
}

class PrerequisitiesItem extends StatelessWidget {
  PrerequisitiesItem({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 2, right: 2),
      padding: const EdgeInsets.all(2),
      child: Column(
        children: [
          Container(
            width: 25,
            height: 35,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/icons/header.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text('${this.title}',
                style: TextStyle(color: Colors.white, fontSize: 10),
                textAlign: TextAlign.center),
          ),
        ],
      ),
      color: Colors.brown,
      width: 35,
      height: 51,
    );
  }
}

class Prerequisities extends StatelessWidget {
  Prerequisities({required this.requirements});

  final QuestRequirements requirements;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Text('3 order members'),
        ]),
        Wrap(
            runSpacing: 5.0,
            spacing: 5.0,
            alignment: WrapAlignment.start,
            children: [
              for (var item in requirements.items)
                PrerequisitiesItem(title: item.title),
            ])
      ]),
    );
  }
}
