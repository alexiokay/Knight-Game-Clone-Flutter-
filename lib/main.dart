// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/HomeScreen.dart.dart';
import 'screens/QuestScreen.dart';
import 'screens/DuelScreen.dart';
import 'screens/EquipmentScreen.dart';
import 'screens/MoreScreen.dart';

class Player {
  String username;
  int level;
  int rubbles;
  double silver;
  int power;
  int strength;
  int health;
  int experience;

  Player({
    required this.username,
    required this.level,
    required this.rubbles,
    required this.silver,
    required this.power,
    required this.strength,
    required this.health,
    required this.experience,
  });
}

login() {
  final player = Player(
      username: 'player#22323',
      level: 1,
      rubbles: 10,
      silver: 29.000,
      power: 5,
      strength: 35,
      health: 100,
      experience: 1);

  return (player);
}

final player = login();

Future<void> main() async {
  //WidgetsFlutterBinding.ensureInitialized();
  //final SharedPreferences prefs = await SharedPreferences.getInstance();
  //var isLoggedIn = (prefs.getBool('isLoggedIn') == null) ? false : prefs.getBool('isLoggedIn');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedScreenIndex = 0;
  final List _screens = [
    {"screen": const ScreenHome(), "title": "Home"},
    {"screen": const ScreenQuest(), "title": "Quest"},
    {"screen": const ScreenDuel(), "title": "Duel"},
    {"screen": const ScreenEquipment(), "title": "Equipment"},
    {"screen": const ScreenMore(), "title": "More..."},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 140, // Set this height
          flexibleSpace: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/icons/header.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      playerAttribute('Level', player.level),
                      playerAttribute('Rubbles', player.rubbles),
                      playerAttribute('Silver', player.silver),
                    ],
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                        flex: 1,
                        child: Text(
                          player.username,
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Text(
                          'Experience: ${player.experience}',
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      playerAttribute('1:32', player.power), // TODO: add timers
                      playerAttribute('1:32', player.strength),
                      playerAttribute('1:32', player.health),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: _screens[_selectedScreenIndex]["screen"],
        bottomNavigationBar: Row(children: <Widget>[
          buildNavBarItem('Home', 'lib/icons/duel.png', 0),
          buildNavBarItem('Quest', 'lib/icons/quest.png', 1),
          buildNavBarItem('Duel', 'lib/icons/duel.png', 2),
          buildNavBarItem('Equipment', 'lib/icons/equipment.png', 3),
          buildNavBarItem('More..', 'lib/icons/duel.png', 4),
        ]));
  }

  Widget buildNavBarItem(
    String title,
    String iconpath,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedScreenIndex = index;
        });
      },
      child: Container(
        // ignore: sort_child_properties_last
        child: Column(children: [
          SizedBox(
            height: 40,
            child: Image.asset(iconpath),
          ),
          Text(title,
              style: index == _selectedScreenIndex
                  ? TextStyle(color: Colors.blue, fontWeight: FontWeight.normal)
                  : TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal))
        ]),
        height: 60,
        width: MediaQuery.of(context).size.width / 5,
        decoration: index == _selectedScreenIndex
            ? BoxDecoration(
                border: const Border(
                  bottom: BorderSide(width: 4, color: Colors.black),
                ),
                gradient: LinearGradient(colors: [
                  Colors.green.withOpacity(0.3),
                  Colors.blue.withOpacity(0.015),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter))
            : const BoxDecoration(),
      ),
    );
  }
}

Widget playerAttribute(String title, amount) {
  return Flexible(
      flex: 1,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'lib/icons/duel.png',
                      width: 50,
                    )
                  ]),
            ),
            Flexible(
              child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(children: [
                      Text('$amount',
                          style: TextStyle(
                            color: Colors.yellow[600],
                            fontWeight: FontWeight.bold,
                          ))
                    ]),
                    Row(children: [
                      Text(title,
                          style: TextStyle(fontSize: 10, color: Colors.white))
                    ]),
                  ]),
            ),
          ]));
}
