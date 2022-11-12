import 'package:flutter/material.dart';

import 'package:myfirstapp/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/providers/player_controller.dart';

class HeroScreen extends StatefulWidget {
  const HeroScreen({super.key});

  @override
  State<HeroScreen> createState() => _HeroScreen();
}

class _HeroScreen extends State<HeroScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: IntrinsicHeight(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
          Column(children: [
            Armament(),
            Header(title: 'sds'),
            Image.asset('assets/icons/duel.png', height: 10),
            Container(
                margin: const EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.65,
                height: 20,
                color: Color.fromARGB(255, 0, 0, 0),
                child: RichText(
                  text: TextSpan(
                    text: "Avalible attribute points:  ",
                    style: TextStyle(color: Colors.white),
                    children: <TextSpan>[
                      TextSpan(text: '0', style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                )),
            Attributes(),
            Armament(),
          ])
        ])));
  }
}

class Header extends StatelessWidget {
  Header({required this.title});

  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Color.fromARGB(255, 35, 20, 7),
      child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset('assets/icons/duel.png', width: 50, height: 50),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(left: 5),
                child: Text('Nickname', style: TextStyle(color: Colors.white)),
              ),
              Row(children: [
                Image.asset('assets/icons/duel.png', width: 30, height: 30),
                Text('Poziom 55', style: TextStyle(color: Colors.white)),
                Text(' X ', style: TextStyle(color: Colors.white)),
                Text('Wielkosc bractwa: 122',
                    style: TextStyle(color: Colors.white)),
              ]),
            ]),
          ])),
    );
  }
}

class Armament extends StatelessWidget {
  Armament();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10, bottom: 20),
        width: 350,
        height: 20,
        color: Colors.white,
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Text(
              'Atributes',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Achivements',
              textAlign: TextAlign.center,
            ),
          ),
          const Expanded(
            flex: 1,
            child: Text(
              'Info',
              textAlign: TextAlign.center,
            ),
          ),
          const Expanded(
            flex: 1,
            child: Text(
              'Comments',
              textAlign: TextAlign.center,
            ),
          ),
        ]));
  }
}

class Attributes extends StatelessWidget {
  Attributes();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      width: double.infinity,
      color: Color.fromARGB(255, 35, 20, 7),
      child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Container(),
              Column(children: [
                Attribute(
                  title: 'Attack',
                ),
                SizedBox(height: 2),
                Attribute(
                  title: 'Defense',
                ),
                SizedBox(height: 2),
                Attribute(
                  title: 'Max. Courage',
                ),
                SizedBox(height: 2),
                Attribute(
                  title: 'Max. Strength',
                ),
                SizedBox(height: 2),
                Attribute(
                  title: 'Max. Health',
                )
              ])
            ],
          )),
    );
  }
}

class Attribute extends StatelessWidget {
  final title;
  Attribute({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: Color.fromARGB(255, 74, 45, 20),
      child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 6,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Image.asset('assets/icons/duel.png', width: 20),
                  SizedBox(width: 5),
                  Text('${title}', style: TextStyle(color: Colors.white))
                ]),
              ),
              Expanded(
                flex: 2,
                child:
                    Image.asset('assets/icons/duel.png', width: 20, height: 20),
              ),
              Flexible(
                  flex: 5,
                  child: Text('9', style: TextStyle(color: Colors.white))),
              Flexible(
                flex: 4,
                child: ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.only(left: 5)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                    ),
                    onPressed: () {},
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Increase',
                              style: TextStyle(color: Colors.white)),
                        ])),
              ),
            ],
          )),
    );
  }
}
