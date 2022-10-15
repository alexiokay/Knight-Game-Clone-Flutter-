// screen_b.dart
import 'package:flutter/material.dart';
import 'package:myfirstapp/game_objects/Player.dart';
import 'package:provider/provider.dart';
import 'package:myfirstapp/providers/player_provider.dart';

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
  var _isDuelFinished = false;

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
      _isDuelFinished = !_isDuelFinished;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(children: <Widget>[
            Visibility(
              visible: _isDuelFinished,
              child: DuelResultWidget(isDuelWon: false),
            ),
            Row(children: [
              Text('Przeciwnik'),
              Container(
                margin: EdgeInsets.only(left: 70),
                child: Text('Wielkosc bractwa'),
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
    return Container(
      margin: EdgeInsets.only(top: 2),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 212, 156, 156),
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
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
                    Text('test'),
                    Row(children: [
                      Text('flag '),
                      Text('test'),
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
                      setState(() {
                        _isDuelFinished = true;
                        player.level++;
                      });
                      print(player.maxCourage);
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
                              setState(() {
                                //widget.isDuelWon = !widget._isDuelWon;
                              });
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
