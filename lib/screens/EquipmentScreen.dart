// screen_b.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myfirstapp/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/providers/player_controller.dart';

var item1 = Item(title: 'Antim', asset: 'assets/icons/duel.png', type: 'bow');
var item2 = Item(title: 'Ur', asset: 'assets/icons/duel.png', type: 'sword');
var item3 = Item(title: 'Wood', asset: 'assets/icons/duel.png', type: 'shield');

var items = [item1, item2];
var items2 = [item2, item3];

class ScreenEquipment extends StatefulWidget {
  const ScreenEquipment({super.key});

  @override
  State<ScreenEquipment> createState() => _ScreenEquipment();
}

class _ScreenEquipment extends State<ScreenEquipment> {
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
                child: Column(children: [
                  Header(title: 'Uzbrojenie'),
                  Column(
                    children: [
                      for (var item in items)
                        Column(
                          children: [
                            EquipmentWidget(
                              title: item.title,
                              reward: 2,
                              experience: 2,
                              loot: false,
                              cost: 4,
                              progress: 2,
                            ),
                            SizedBox(height: 50),
                          ],
                        )
                    ],
                  ),
                ]),
              ),
            ]),
          ],
        ),
      ],
    )));
  }
}

class EquipmentWidget extends StatefulWidget {
  final String? title;
  final double? reward;
  final int? experience;
  final bool? loot;
  final int? cost;
  final int? progress;

  const EquipmentWidget({
    Key? key,
    this.title,
    this.reward,
    this.experience,
    this.loot,
    this.cost,
    this.progress,
  }) : super(key: key);

  @override
  _EquipmentWidget createState() => _EquipmentWidget();
}

class _EquipmentWidget extends State<EquipmentWidget> {
  bool _isVisible = false;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Container(
                  height: 50,
                  color: Colors.blue,
                  child: Column(children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, top: 5, bottom: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ])),
            ),
            CenterWidget(),
            FooterWidget(itemPrice: widget.cost, itemTitle: widget.title),
          ]),
    );
  }
}

class Header extends StatelessWidget {
  Header({required this.title});

  final title;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 140,
        color: Color.fromARGB(255, 35, 20, 7),
        child: Column(children: [
          Armament(),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          Container(
            height: 10,
            child: Image.asset('assets/icons/duel.png'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Container(
                alignment: Alignment.topLeft,
                height: 60,
                child: Text(
                  'Twoje bractwo rycerskie używa podczas ataków Twoje najsilniejsze uzbrojenie. Każdy członek bractwa może użyć maksymalnie 1x broń, 1x tarczę i 1x zbroję.',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                )),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'New Armaments will be unlocked at level  ',
              style: TextStyle(
                  color: Color.fromARGB(255, 232, 124, 23), fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ),
        ]));
  }
}

class Armament extends StatelessWidget {
  Armament();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        width: 160,
        height: 20,
        color: Colors.white,
        child: Row(children: [
          Expanded(
            flex: 1,
            child: Text(
              'Armor',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Armor',
              textAlign: TextAlign.center,
            ),
          ),
          const Expanded(
            flex: 1,
            child: Text(
              'Armor',
              textAlign: TextAlign.center,
            ),
          ),
        ]));
  }
}

class CenterWidget extends StatelessWidget {
  CenterWidget();

  @override
  Widget build(BuildContext context) {
    PlayerController playerControler = Get.put(PlayerController());
    return Container(
        width: double.infinity,
        height: 200,
        color: Colors.red,
        child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/header.jpg',
                      width: 140,
                      height: 180,
                      fit: BoxFit.cover,
                    ),
                  ]),
              Expanded(
                  flex: 8,
                  child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                flex: 8,
                                child: Column(children: [
                                  Row(children: [
                                    Image.asset(
                                      'assets/icons/duel.png',
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.cover,
                                    ),
                                    Text('Atak: 0'),
                                  ]),
                                  Row(children: [
                                    Image.asset(
                                      'assets/icons/duel.png',
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.cover,
                                    ),
                                    Text('Obrona: 9'),
                                  ]),
                                ])),
                            Flexible(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Obx(() => Text(
                                      'Posiadasz: ${playerControler.weaponCount}',
                                    )),
                              ),
                            )
                          ]))),
            ])));
  }
}

class FooterWidget extends StatefulWidget {
  final itemPrice;
  final itemTitle;
  const FooterWidget({super.key, this.itemPrice, this.itemTitle});

  @override
  State<FooterWidget> createState() => _FooterWidget();
}

class _FooterWidget extends State<FooterWidget> {
  double _value = 0;
  final _controller = TextEditingController(text: "0");
  int abc = 0;

  @override
  void dispose() {
    super.dispose();
  }

  void callback(String abc) {
    setState(() {
      abc = abc;
    });
  }

  _FooterWidget();

  @override
  Widget build(BuildContext context) {
    PlayerController playerControler = Get.put(PlayerController());
    return Container(
        width: double.infinity,
        height: 110,
        color: Color.fromARGB(255, 231, 34, 20),
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  new Flexible(
                      flex: 2,
                      child: Container(
                        height: 33,
                        child: TextField(
                          controller: _controller,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          style: TextStyle(fontSize: 17),
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      )),
                  Expanded(
                    flex: 9,
                    child: Slider(
                      min: 0,
                      max: 100,
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          _controller.text = value.toInt().toString();
                          playerControler.countWeapons();
                        });
                      },
                    ),
                  )
                ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ItemFooterButton(widget.itemPrice, _value, 'buy',
                          widget.itemTitle, callback),
                      ItemFooterButton(widget.itemPrice, _value, ' sell',
                          widget.itemTitle, callback)
                    ]),
              ]),
        ));
  }
}

class ItemFooterButton extends StatelessWidget {
  String buttonType;
  int itemPrice;
  double resellingMultipler = 0.65;
  double amount;
  var setParentState;

  ItemFooterButton(this.itemPrice, this.amount, this.buttonType, this.itemTitle,
      this.setParentState);
  NumberFormat myFormat = NumberFormat.decimalPattern('en_us');
  final itemTitle;
  String finalPrice() {
    int finalPriceInt = 0;
    String finalPriceString = '';
    if (buttonType == 'buy') {
      finalPriceInt = -(amount.toInt() * itemPrice);
      finalPriceString = myFormat.format(finalPriceInt);
    } else {
      finalPriceInt = amount.toInt() * (itemPrice * resellingMultipler).round();
      finalPriceString = '+${myFormat.format(finalPriceInt)}';
    }

    return finalPriceString;
  }

  @override
  Widget build(BuildContext context) {
    PlayerController playerControler = Get.put(PlayerController());

    return Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: playerControler.checkInventoryElement(
                    itemTitle, buttonType, amount) !=
                false
            ? Colors.blue
            : Colors.red,
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          splashColor: Colors.red,
          child: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width * 0.46,
              height: 40,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buttonType == 'buy' ? Text('Buy') : Text('Sell'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/duel.png',
                            width: 20, height: 20),
                        Text('${finalPrice()}')
                      ],
                    )
                  ])),
          onTap: () {
            if (buttonType == 'buy') {
              playerControler.buyItem(itemTitle, amount);
              setParentState('abc');
              playerControler.countWeapons();
            } else {
              playerControler.sellItem(itemTitle, amount);
              setParentState('abc');
              playerControler.countWeapons();
            }
          },
        ));
  }
}
