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

class ScreenMore extends StatelessWidget {
  const ScreenMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderColor = Color.fromARGB(255, 115, 76, 30);
    return SingleChildScrollView(
        child: IntrinsicHeight(
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
                  Column(children: [
                    MenuItem(menu_text: menuItems[i]),
                    if (i + 1 !=
                        menuItems
                            .length) // if the items is not last of the list then return fake border
                      const SizedBox(
                        width: double.infinity,
                        height: 2,
                        child: const DecoratedBox(
                          decoration: const BoxDecoration(color: borderColor),
                        ),
                      ),
                  ])
              ])))
    ])));
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
