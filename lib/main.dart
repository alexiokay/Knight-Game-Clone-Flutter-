// main.dart
import 'package:flutter/material.dart';
import 'package:myfirstapp/game_objects/Player.dart';
import 'package:myfirstapp/game_objects/Countries.dart';
import 'package:provider/provider.dart';
import 'package:myfirstapp/providers/player_provider.dart';

import 'screens/HomeScreen.dart.dart';
import 'screens/QuestScreen.dart';
import 'screens/DuelScreen.dart';
import 'screens/EquipmentScreen.dart';
import 'screens/MoreScreen.dart';

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
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PlayerProvider())],
      child: MaterialApp(
        // Hide the debug banner
        debugShowCheckedModeBanner: false,
        title: 'Kindacode.com',
        home: MyHomePage(),
      ),
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
                image: AssetImage("assets/icons/header.jpg"),
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
                      playerAttribute(
                        title: '1:32',
                        amount: Provider.of<PlayerProvider>(context).level,
                      ),
                      playerAttribute(
                        title: '1:32',
                        amount: Provider.of<PlayerProvider>(context).rubbles,
                      ),
                      playerAttribute(
                          title: '1:32',
                          amount: Provider.of<PlayerProvider>(context).silver),
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
                      playerAttribute(
                          title: '1:32',
                          amount: Provider.of<PlayerProvider>(context).courage,
                          amount2: Provider.of<PlayerProvider>(context)
                              .maxCourage), // TODO: add timers
                      playerAttribute(
                          title: '1:32',
                          amount: Provider.of<PlayerProvider>(context).strength,
                          amount2:
                              Provider.of<PlayerProvider>(context).maxStrength),
                      playerAttribute(
                          title: '1:32',
                          amount:
                              Provider.of<PlayerProvider>(context).hitpoints,
                          amount2: Provider.of<PlayerProvider>(context)
                              .maxHitpoints),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: _screens[_selectedScreenIndex]["screen"],
        bottomNavigationBar: Row(children: <Widget>[
          buildNavBarItem('Home', 'assets/icons/duel.png', 0),
          buildNavBarItem('Quest', 'assets/icons/quest.png', 1),
          buildNavBarItem('Duel', 'assets/icons/duel.png', 2),
          buildNavBarItem('Equipment', 'assets/icons/equipment.png', 3),
          buildNavBarItem('More..', 'assets/icons/duel.png', 4),
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

class playerAttribute extends StatelessWidget {
  final String title;
  var amount;
  var amount2;

  playerAttribute({
    Key? key,
    required this.title, // non-nullable and required
    required this.amount, // non-nullable but optional with a default value
    this.amount2, // nullable and optional
  });

  @override
  Widget build(BuildContext context) {
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
                        'assets/icons/duel.png',
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
                        Text('${amount}',
                            style: TextStyle(
                              color: Colors.yellow[600],
                              fontWeight: FontWeight.bold,
                            )),
                        if (amount2 != null)
                          Text('/${amount2}',
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
}
