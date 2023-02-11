import 'package:flutter/material.dart';

import 'package:Cyber_Knights/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:Cyber_Knights/providers/player_controller.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreen();
}

class _ShopScreen extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    PlayerController playerControler = Get.put(PlayerController());
    return SingleChildScrollView(
        child: IntrinsicHeight(
            child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      HeaderShop(),
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.40,
                        height: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                        child: Obx(() => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Rubins:',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Image.asset('assets/icons/duel.png'),
                                  Text('${playerControler.rubbles}',
                                      style: TextStyle(color: Colors.blue)),
                                ])),
                      ),
                    ]))));
  }
}

class HeaderShop extends StatelessWidget {
  HeaderShop();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 70,
        color: Color.fromARGB(255, 35, 20, 7),
        child: Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shop',
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.start,
              ),
              Text(
                'Here you can get Rubins and others useful things for Rubins',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ]));
  }
}

class Offers extends StatelessWidget {
  Offers();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 70,
        color: Color.fromARGB(255, 35, 20, 7),
        child: Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shop',
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.start,
              ),
              Text(
                'Here you can get Rubins and others useful things for Rubins',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ]));
  }
}

class RecieveCoupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 70,
        color: Color.fromARGB(255, 35, 20, 7),
        child: Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shop',
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.start,
              ),
              Text(
                'Here you can get Rubins and others useful things for Rubins',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ]));
  }
}

class Goods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 70,
        color: Color.fromARGB(255, 35, 20, 7),
        child: Column(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shop',
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.start,
              ),
              Text(
                'Here you can get Rubins and others useful things for Rubins',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ]));
  }
}
