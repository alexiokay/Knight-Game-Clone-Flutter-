import 'package:flutter/material.dart';
import 'package:myfirstapp/game_objects/Items.dart';
import 'package:myfirstapp/game_objects/Countries.dart';
import 'package:myfirstapp/providers/timer_counter.dart';
import 'package:myfirstapp/game_objects/Items.dart';

import 'dart:async';

import 'package:get/get.dart';

var strengthTimerController = Get.put(TimerStrengthController());
var courageTimerController = Get.put(TimerCourageController());
var taxesTimerController = Get.put(TimerTaxesController());
var healthTimerController = Get.put(TimerHealthController());

class PlayerController extends GetxController {
  var abc = 10.obs;
  String username = '';
  Country nationality = PL;
  var experience = 100.obs;
  var rubbles = 200.obs;
  var level = 10.obs;
  var silver = 1.000;
  var attack = 220.obs;
  var defense = 190.obs;
  var maxCourage = 50.obs;

  var maxStrength = 44.obs;
  var maxHitpoints = 100.obs;
  var courage = 22.obs;
  var strength = 43.obs;
  var hitpoints = 22.obs;
  var isItemInInventory = false.obs;

  List<String> guildInvitations = [
    'Bractwo 1',
    'Bractwo 2',
    'Bractwo 3',
    'Bractwo 4',
  ].obs;

  RxList inventory = [
    {
      'item': Item(title: 'Antim', asset: 'assets/icons/duel.png', type: 'bow'),
      'amount': 2
    }.obs,
    {
      'item': Item(title: 'Ur', asset: 'assets/icons/duel.png', type: 'sword'),
      'amount': 1
    }.obs
  ].obs;

  bool checkInventoryElement(item_name, intention, amount) {
    if (intention == 'buy') {
      return true;
    } else if (inventory
            .where((element) => element['item'].title == item_name)
            .first['amount'] >
        amount - 2) {
      return true;
    } else {
      return false;
    }
  }

  String get getinv {
    return this.inventory[0]['amount'].toString();
  }

  duel(cost) => {
        if (courage.value == maxCourage.value) courageTimerController.onReady(),
        if ((cost <= courage.value) == true) courage - cost,
      };

  makeQuest(cost) => {
        if (strength.value == maxStrength.value)
          strengthTimerController.onReady(),
        if ((cost <= strength.value) == true) strength - cost,
      };

  collectTaxes() => silver + 100;
  incrementCourage() => {if (courage.value < maxCourage.value) courage.value++};
  incrementStrength() =>
      {if (strength.value < maxStrength.value) strength.value++};
  incrmentHealth() =>
      {if (hitpoints.value < maxHitpoints.value) hitpoints.value++};
  incrementExperience() =>
      {if (experience.value < experience.value) experience++};

  buyItem(item_name, count) => {
        if (inventory.where((element) => element['item'].title == item_name) !=
            null)
          {
            inventory
                .where((element) => element['item'].title == item_name)
                .first['amount'] += count.toInt(),
            print('count added to first element')
          }
        else
          {
            inventory.add({
              'item': new Item(
                  title: item_name,
                  asset: 'assets/icons/duel.png',
                  type: 'bow'),
              'amount': count.round()
            })
          },
        print(inventory.length),
        for (var item in inventory) {print(item)},
        inventory.refresh()
      };

  inventoryCheck(item_name) => {
        if (inventory
                .where((element) => element['item'].title == item_name)
                .first['amount'] !=
            0)
          {
            isItemInInventory.value = true,
          }
        else
          {
            isItemInInventory.value = false,
          }
      };
  sellItem(item_name, count) => {
        if (inventory.where((element) => element['item'].title == item_name) !=
            null)
          {
            if (inventory
                    .where((element) => element['item'].title == item_name)
                    .first['amount'] <
                count.toInt())
              {
                inventory
                    .where((element) => element['item'].title == item_name)
                    .first['amount'] = 0
              }
            else
              {
                inventory
                    .where((element) => element['item'].title == item_name)
                    .first['amount'] -= count.toInt()
              }
          }
        else
          {print('doesnt work')},
        print('how mnay items?: ${inventory.length}'),
        for (var item in inventory) {print(item)},
        inventory.refresh()
      };
}
