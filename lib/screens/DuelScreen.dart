// screen_b.dart
import 'package:flutter/material.dart';
import 'package:Cyber_Knights/game_objects/Player.dart';
import 'package:provider/provider.dart';
import 'package:Cyber_Knights/providers/old_player_provider.dart';
import 'package:Cyber_Knights/providers/player_controller.dart';
import 'package:get/get.dart';

class ScreenDuel extends StatefulWidget {
  const ScreenDuel({
    Key? key,
  }) : super(key: key);

  @override
  State<ScreenDuel> createState() => _ScreenDuel();
}

class _ScreenDuel extends State<ScreenDuel> {
  int opponent = 1;
  final opponentsCounter = 10;
  var _isDuelFinished = false.obs;

  final opponents = <Widget>[];

  void createOppontentList() {
    for (opponent; opponent <= opponentsCounter; opponent++) {
      opponents.add(
        buildOpponentItem('dsds', 2, 'pl', 2),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      createOppontentList();
    });
  }

  callback(newAbc) {
    setState(() {
      _isDuelFinished.value = !_isDuelFinished.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    PlayerController playerControler = Get.put(PlayerController());
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(children: <Widget>[
            Obx(() => Visibility(
                visible: playerControler.hitpoints < 11,
                child: MedicDoor(callback: callback))),
            SizedBox(height: 10),
            Obx(() => Visibility(
                  visible:
                      _isDuelFinished.value && playerControler.hitpoints > 10,
                  child: DuelResultWidget(isDuelWon: false),
                )),
            Row(children: [
              Text('Przeciwnik', style: TextStyle(color: Colors.white)),
              Container(
                margin: EdgeInsets.only(left: 70),
                child: Text('Wielkosc bractwa',
                    style: TextStyle(color: Colors.white)),
              )
            ]),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8),
              children: opponents,
            ),
          ])),
    );
  }

  Widget buildOpponentItem(
    String username,
    int level,
    String country,
    int guildMembers,
  ) {
    PlayerController playerControler = Get.put(PlayerController());
    return Container(
      margin: EdgeInsets.only(top: 2),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 68, 44, 44),
          Color.fromARGB(255, 99, 26, 26),
          Color.fromARGB(255, 71, 16, 16),
        ],
      )),
      width: double.infinity,
      height: 70,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.asset('assets/icons/duel.png', width: 90),
              ),
              Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('test', style: TextStyle(color: Colors.white)),
                    Row(children: [
                      Text('flag ', style: TextStyle(color: Colors.white)),
                      Text('test', style: TextStyle(color: Colors.white)),
                    ])
                  ]),
              Expanded(
                  flex: 4,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 45),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 0, 0, 0),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          width: 20,
                          height: 20,
                          child: Text('5',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  )),
              Expanded(
                flex: 2,
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
                      context.read<PlayerProvider>().fight();
                      playerControler.Attack == true
                          ? print('atacked')
                          : print('couldnt attack');
                      setState(() {
                        _isDuelFinished.value = true;
                      });
                    },
                    child: Row(children: [
                      Image.asset('assets/icons/duel.png', width: 30),
                      Text('Attack', style: TextStyle(color: Colors.white)),
                    ])),
                //button
              )
            ],
          )),
    );
  }
}

class ExhaustedWidged extends StatelessWidget {
  const ExhaustedWidged({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: IntrinsicHeight(
        child: Column(),
      ),
    );
  }
}

class DuelResultWidget extends StatefulWidget {
  final bool isDuelWon;

  const DuelResultWidget({
    Key? key,
    this.isDuelWon = false,
  }) : super(key: key);

  @override
  State<DuelResultWidget> createState() => _DuelResultWidget();
}

class _DuelResultWidget extends State<DuelResultWidget> {
  @override
  Widget build(BuildContext context) {
    PlayerController playerControler = Get.put(PlayerController());
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 0),
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      width: double.infinity,
      height: 300,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0, -1),
                            child: Image.network(
                              'https://picsum.photos/seed/815/600',
                              width: 25,
                              height: 25,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Porazka ...',
                              ),
                              Expanded(
                                child: Text(
                                  'Przegrales walke straciles  12 zdrowia, zadales 22 obrazen rycerzowi Zjahjs i otrzymales 4 doswiadczenia oraz 3,333 srebrnikow',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Twoje bractwo (1) uzylo: ',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFF4E4E4E),
                            fontSize: 12,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 2, 0),
                                  child: Container(
                                    width: 40,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF390A0A),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 32,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                          ),
                                          child: Image.network(
                                            'https://picsum.photos/seed/91/600',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          'x44',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bractwo rycerza Zeieke uzylo: ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xFF5A5A5A),
                            fontSize: 12,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 2, 0),
                                  child: Container(
                                    width: 40,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF390A0A),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 32,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1,
                                            ),
                                          ),
                                          child: Image.network(
                                            'https://picsum.photos/seed/91/600',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Text(
                                          'x44',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Colors.white,
                                            fontSize: 8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: () {
                              playerControler.Attack == true
                                  ? print('atacked')
                                  : print('couldnt attack');
                            },
                            child: Row(children: [Text('jeszcze raz')])),
                        //button
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//

class FastMedic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PlayerController playerControler = Get.put(PlayerController());
    return Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 0, 0),
          border: Border.all(
            color: Color.fromARGB(255, 0, 249, 70),
            width: 3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        width: double.infinity,
        height: 80,
        child: Padding(
            padding: EdgeInsetsDirectional.all(4),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fast Medic',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text('PREMIUM',
                      style: TextStyle(
                          color: Color.fromARGB(255, 254, 242, 27),
                          fontSize: 15))
                ],
              ),
              OutlinedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 16, 197, 67)),
                  ),
                  onPressed: () {
                    playerControler.heal();
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Heal me now ( 5 mega shards )')])),
            ])));
  }
}

class MedicDoor extends StatelessWidget {
  final callback;
  MedicDoor({this.callback});
  @override
  Widget build(BuildContext context) {
    PlayerController playerControler = Get.put(PlayerController());
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 0, 0, 0),
        border: Border.all(
          color: Color.fromARGB(255, 0, 255, 51),
          width: 3,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      width: double.infinity,
      height: 150,
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0, -1),
                            child: Image.network(
                              'https://picsum.photos/seed/815/600',
                              width: 25,
                              height: 25,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 8,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Text(
                                'Exhaussted ...',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              SizedBox(height: 10),
                              Expanded(
                                child: Text(
                                  'You are too weak, to attack. Wait till you get rest, go to medic or summon Fast Medic',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: () {
                              playerControler.heal();
                              callback(2);
                            },
                            child: Row(children: [Text('Heal me now')])),
                        SizedBox(width: 7),
                        OutlinedButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            onPressed: () {},
                            child: Row(children: [Text('Go to medic')])),
                        //button
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
