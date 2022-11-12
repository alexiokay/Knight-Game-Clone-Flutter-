import 'package:flutter/material.dart';

import 'package:myfirstapp/game_objects/Items.dart';
import 'package:get/get.dart';
import 'package:myfirstapp/providers/player_controller.dart';
import 'package:intl/intl.dart';

class ShopItem extends StatefulWidget {
  final String? title;
  final double? reward;
  final int? experience;
  final bool? loot;
  final int? cost;
  final int? progress;
  final int? income;
  final String? type;

  const ShopItem(
      {Key? key,
      this.title,
      this.reward,
      this.experience,
      this.loot,
      this.cost,
      this.progress,
      this.income,
      this.type})
      : super(key: key);

  @override
  _ShopItem createState() => _ShopItem();
}

class _ShopItem extends State<ShopItem> {
  bool _isVisible = false;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 35, 20, 7), // Widget background
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 50,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: [
                        Color.fromARGB(255, 169, 216, 250),
                        Colors.blue,
                      ],
                    ),
                  ),
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
            CenterWidget(
                itemPrice: widget.cost,
                itemTitle: widget.title,
                itemIncome: widget.income,
                itemType: widget.type),
            FooterWidget(
              itemPrice: widget.cost,
              itemTitle: widget.title,
            ),
          ]),
    );
  }
}

class CenterWidget extends StatefulWidget {
  final itemPrice;
  final itemTitle;
  final itemIncome;
  final itemType;

  const CenterWidget(
      {super.key,
      this.itemPrice,
      this.itemTitle,
      this.itemIncome,
      this.itemType});

  @override
  State<CenterWidget> createState() => _CenterWidget();
}

class _CenterWidget extends State<CenterWidget> {
  _CenterWidget();

  @override
  Widget build(BuildContext context) {
    PlayerController playerControler = Get.put(PlayerController());
    return Container(
        width: double.infinity,
        height: 200,
        color: Color.fromARGB(255, 160, 44, 36),
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
                                  if (widget.itemType?.toLowerCase() ==
                                      'vassal')
                                    Row(children: [
                                      Image.asset(
                                        'assets/icons/duel.png',
                                        width: 30,
                                        height: 30,
                                        fit: BoxFit.cover,
                                      ),
                                      Text(
                                        'Income: ${widget.itemIncome}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ]),
                                  Row(children: [
                                    Image.asset(
                                      'assets/icons/duel.png',
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.cover,
                                    ),
                                    Text('Atak: 0',
                                        style: TextStyle(color: Colors.white)),
                                  ]),
                                  Row(children: [
                                    Image.asset(
                                      'assets/icons/duel.png',
                                      width: 30,
                                      height: 30,
                                      fit: BoxFit.cover,
                                    ),
                                    Text(
                                      'Obrona: 9',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ]),
                                ])),
                            Flexible(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: Obx(() => Text(
                                      // if player has the item then display amount if not display 0
                                      style: TextStyle(color: Colors.white),
                                      playerControler.inventory
                                                  .where((element) =>
                                                      element.item.title ==
                                                      widget.itemTitle)
                                                  .isEmpty ==
                                              false
                                          ? 'Posiadasz: ${playerControler.inventory.where((element) => element.item.title == widget.itemTitle).first.amount}'
                                          : 'Posiadasz: 0',
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
        color: Color.fromARGB(255, 162, 11, 0),
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
                      ItemFooterButton(widget.itemPrice, _value, 'sell',
                          widget.itemTitle, callback),
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
              width: MediaQuery.of(context).size.width * 0.43,
              height: 40,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buttonType == 'buy'
                        ? Text('Buy', style: TextStyle(color: Colors.white))
                        : Text('Sell', style: TextStyle(color: Colors.white)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/icons/duel.png',
                            width: 20, height: 20),
                        Text(
                            style: TextStyle(color: Colors.white),
                            '${finalPrice()}')
                      ],
                    )
                  ])),
          onTap: () {
            if (buttonType == 'buy') {
              playerControler.buyItem(itemTitle, amount);
              setParentState('abc');
            } else {
              playerControler.sellItem(itemTitle, amount);
              setParentState('abc');
            }
          },
        ));
  }
}
