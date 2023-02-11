// main.dart
import 'package:flutter/material.dart';
import 'package:Cyber_Knights/game_objects/Player.dart';
import 'package:Cyber_Knights/game_objects/Countries.dart';
import 'package:provider/provider.dart';
import 'package:Cyber_Knights/providers/old_player_provider.dart';
import 'package:Cyber_Knights/providers/player_controller.dart';
import 'package:Cyber_Knights/providers/timer_counter.dart';

import 'package:get/get.dart';
import 'screens/HomeScreen.dart.dart';
import 'screens/QuestScreen.dart';
import 'screens/DuelScreen.dart';
import 'screens/EquipmentScreen.dart';
import 'screens/MoreScreen.dart';
import 'package:Cyber_Knights/screens/menu_screens/all.dart';

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
        color: Color.fromARGB(255, 160, 44, 36),
        theme: new ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 160, 44, 36),
          fontFamily: 'Georgia',
        ),

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

  changeScreen(screenIndex) {
    setState(() {
      _selectedScreenIndex = screenIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List _screens = [
      {"screen": const ScreenHome(), "title": "Home"},
      {"screen": const ScreenQuest(), "title": "Quest"},
      {"screen": const ScreenDuel(), "title": "Duel"},
      {"screen": const ScreenEquipment(), "title": "Equipment"},
      {"screen": ScreenMore(changeScreen: changeScreen), "title": "More..."},
      {"screen": const HeroScreen(), "title": "Hero"},
      {"screen": const VassalsScreen(), "title": "Vassals"},
      {"screen": const TreasuryScreen(), "title": "Treasury"},
      {"screen": const MedicScreen(), "title": "Mdic"},
      {"screen": const ShopScreen(), "title": "Shop"},
      {"screen": const LuckyCardsScreen(), "title": "Lucky Cards"},
      {"screen": const GuildScreen(), "title": "Guild"},
      {"screen": const FactionsScreen(), "title": "Factions"},
      {"screen": const HollyMissionsScreen(), "title": "Holly Missions"},
      {"screen": const RankingsScreen(), "title": "Rankings"},
      {"screen": const IgnoredScreen(), "title": "Ignored"},
      {"screen": const SettingsScreen(), "title": "Settings"},
      {"screen": const LobbyScreen(), "title": "Lobby"},
      {"screen": const GameRulesScreen(), "title": "Game Rules"},
      {"screen": const FaqScreen(), "title": "Faq"},
      {"screen": const OtherGamesScreen(), "title": "Other Games"},
      {"screen": const PrivacyPolicyScreen(), "title": "Privacy Policy"},
    ];
    PlayerController playerControler = Get.put(PlayerController());
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 35, 20, 7),
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
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      playerAttribute(
                        title: 'Level',
                        amount: playerControler.level,
                        direction: 'left',
                      ),
                      playerAttribute(
                        title: 'Rubins',
                        amount: playerControler.rubbles,
                        direction: 'left',
                      ),
                      playerAttribute(
                        title: '4.122.033 after 17:34',
                        amount: playerControler.silver,
                        direction: 'left',
                      ),
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
                          _screens[_selectedScreenIndex]["title"],
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Obx(() => Text(
                              'Experience: ${playerControler.experience}',
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            )),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      playerAttribute(
                        title: '1:32',
                        amount: playerControler.courage,
                        hitpoints: playerControler.maxCourage,
                        controllerType: 'courage',
                        direction: 'right',
                      ),

                      // TODO: add timers
                      playerAttribute(
                        title: '1:32',
                        amount: playerControler.strength,
                        hitpoints: playerControler.maxStrength,
                        controllerType: 'strength',
                        direction: 'right',
                      ),
                      playerAttribute(
                        title: '1:32',
                        amount: playerControler.hitpoints,
                        hitpoints: playerControler.maxHitpoints,
                        controllerType: 'health',
                        direction: 'right',
                      ),
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
                      color: Colors.white, fontWeight: FontWeight.normal))
        ]),
        height: 60,
        width: MediaQuery.of(context).size.width / 5,
        decoration: index == _selectedScreenIndex
            ? BoxDecoration(
                border: const Border(
                  bottom: BorderSide(width: 4, color: Colors.black),
                ),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(255, 238, 238, 238).withOpacity(0.3),
                  Colors.blue.withOpacity(0.015),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter))
            : const BoxDecoration(
                gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 117, 117, 117),
                  Color.fromARGB(255, 26, 26, 26),
                  Colors.black,
                ],
              )),
      ),
    );
  }
}

class playerAttribute extends GetView {
  final String title;
  var amount;
  var hitpoints;
  var controllerType;
  var direction;

  playerAttribute({
    Key? key,
    required this.title, // non-nullable and required
    required this.amount, // non-nullable but optional with a default value
    this.hitpoints,
    this.controllerType,
    required this.direction, // nullable and optional
  });

  @override
  Widget build(BuildContext context) {
    var controller = null;
    if (controllerType == 'strength')
      controller = Get.put(TimerStrengthController());
    else if (controllerType == 'courage')
      controller = Get.put(TimerCourageController());
    else if (controllerType == 'health')
      controller = Get.put(TimerHealthController());
    else if (controllerType == 'taxes')
      controller = Get.put(TimerTaxesController());
    PlayerController playerControler = Get.put(PlayerController());
    return Flexible(
        flex: 3,
        child: Row(
            mainAxisAlignment: direction == 'left'
                ? MainAxisAlignment.start
                : MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      if (direction == 'left')
                        Image.asset(
                          'assets/icons/duel.png',
                          width: 34,
                        )
                    ]),
              ),
              Flexible(
                flex: 3,
                child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisAlignment: MainAxisAlignment.center,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: direction == 'left'
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.end,
                          children: [
                            Obx(() => Text('${amount.value}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ))),
                            if (hitpoints != null)
                              Text('/${hitpoints}',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 79, 79, 79),
                                    fontWeight: FontWeight.bold,
                                  )),
                          ]),
                      Obx(
                        () => Row(
                            mainAxisAlignment: direction == 'left'
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Visibility(
                                  visible: false,
                                  child: Text('${playerControler.strength}')),
                              if ((controllerType == 'player') == false &&
                                  controller != null &&
                                  amount != hitpoints)
                                Text('${controller.time.value}',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                              if (controller == null ||
                                  amount ==
                                      hitpoints) // if amount is full or widget has no controllerType then show type
                                Text('${title}',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white)),
                            ]),
                      )
                    ]),
              ),
              if (direction == 'right')
                Flexible(
                  flex: 2,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/duel.png',
                          width: 34,
                        )
                      ]),
                ),
            ]));
  }
}
