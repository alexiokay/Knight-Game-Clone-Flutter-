// screen_b.dart
import 'package:flutter/material.dart';
import 'package:myfirstapp/components/guildInvitation.dart';

final List menuItems = [
  'Postac',
  'Wasale',
  'Skarbiec',
  'Medyk',
  'Sklep',
  'Karty Szczescia',
  'Bractwo',
  'Factions',
  'Holy Missions',
  'Ranking',
  'Lista Ignorowanych',
  'Ustawienia',
  'Lobby',
  'Zasady Gry',
  'FAQ',
  'Inne darmowe gry',
  'Polityka Prywatnosci',
];

const borderColor = Color.fromARGB(255, 115, 76, 30);

class ScreenMore extends StatefulWidget {
  final changeScreen;

  const ScreenMore({Key? key, @required this.changeScreen}) : super(key: key);

  @override
  _ScreenMore createState() => _ScreenMore();
}

class _ScreenMore extends State<ScreenMore> {
  int _selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 51, 24, 8),
        body: SingleChildScrollView(
            child: MainSubmenu(callback: widget.changeScreen)));
  }
}

class MenuItem extends StatelessWidget {
  MenuItem({required this.menu_text});

  final menu_text;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(flex: 1, child: Image.asset('assets/icons/duel.png')),
                Expanded(
                    flex: 5,
                    child: Text('${menu_text} ',
                        style: TextStyle(color: Colors.white))),
                Flexible(flex: 1, child: Image.asset('assets/icons/duel.png')),
              ],
            )));
  }
}

class MainSubmenu extends StatefulWidget {
  Function callback;

  MainSubmenu({required this.callback});

  @override
  _MainSubmenu createState() => _MainSubmenu();
}

class _MainSubmenu extends State<MainSubmenu> {
  _MainSubmenu();

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
        child: Column(children: [
      GuildInvitation(),
      Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 35, 20, 7),
                border: Border.all(
                  color: borderColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Column(children: [
                for (int i = 0;
                    i < menuItems.length;
                    i++) // rendering menuItems from the list
                  InkWell(
                      onTap: () {
                        widget.callback(i +
                            5); // 5 is the number of main screen indexes that should be ignored
                      },
                      child: MenuItem(menu_text: menuItems[i]))
              ])))
    ]));
  }
}
