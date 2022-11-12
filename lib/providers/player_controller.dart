import 'package:flutter/material.dart';
import 'package:myfirstapp/game_objects/Items.dart';
import 'package:myfirstapp/game_objects/Countries.dart';
import 'package:myfirstapp/providers/timer_counter.dart';
import 'package:myfirstapp/game_objects/Items.dart';
import 'dart:math';

import 'dart:async';

import 'package:get/get.dart';

var strengthTimerController = Get.put(TimerStrengthController());
var courageTimerController = Get.put(TimerCourageController());
var taxesTimerController = Get.put(TimerTaxesController());
var healthTimerController = Get.put(TimerHealthController());

class InventoryObject {
  Item item;
  num amount;

  InventoryObject(this.item, this.amount);
}

class PlayerController extends GetxController {
  var abc = 10.obs;
  String username = '';
  Country nationality = PL;
  var experience = 100.obs;
  var rubbles = 200.obs;
  var level = 1.obs;
  var silver = 1000.obs;
  var attack = 220.obs;
  var defense = 190.obs;
  var maxCourage = 50.obs;

  var maxStrength = 44.obs;
  var maxHitpoints = 100.obs;
  var courage = 22.obs;
  var strength = 43.obs;
  var hitpoints = 22.obs;
  var isItemInInventory = false.obs;
  var random_damage;

  List<String> guildInvitations = [
    'Bractwo 1',
    'Bractwo 2',
    'Bractwo 3',
    'Bractwo 4',
  ].obs;

  RxList<InventoryObject> inventory = <InventoryObject>[
    InventoryObject(
        Item(title: 'Antim', asset: 'assets/icons/duel.png', type: 'bow'), 2),
    InventoryObject(
        Item(title: 'Ur', asset: 'assets/icons/duel.png', type: 'sword'), 1),
  ].obs;

  bool checkInventoryElement(item_name, intention, amount) {
    // checks in inventory contains element
    if (intention == 'buy') {
      return true;
    } else if (intention == 'sell' &&
        inventory.where((element) => element.item.title == item_name).isEmpty ==
            false) {
      if (inventory
              .where((element) => element.item.title == item_name)
              .first
              .amount >
          amount - 1) {
        // -2 because we want to check if we have enough items to sell
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

  String get getinv {
    return this.inventory[0].amount.toString();
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

  collectTaxes() => silver.value + 100;
  incrementCourage() => {if (courage.value < maxCourage.value) courage.value++};
  incrementStrength() =>
      {if (strength.value < maxStrength.value) strength.value++};
  incrmentHealth() =>
      {if (hitpoints.value < maxHitpoints.value) hitpoints.value++};
  incrementExperience() =>
      {if (experience.value < experience.value) experience++};

  randomDamage() {
    Random rnd;
    int min = 10;
    int max = 14;
    rnd = new Random();

    return min + rnd.nextInt(max - min);
  }

  randomExperience() {
    Random rnd;
    int min = (level.value * 11);
    int max = (level.value * 15);
    rnd = new Random();

    return min + rnd.nextInt(max - min);
  }

  heal({points}) {
    if (points != null) {
    } else {
      hitpoints.value = 100;
    }
  }

  bool get isLevelUp {
    if (experience.value >= (200 * level.value) * level.value) {
      level.value++;
      return true;
    } else {
      return false;
    }
  }

  bool get Attack {
    int random_damage = randomDamage();
    int random_experience = randomExperience();
    if (hitpoints.value - random_damage > 0 && courage.value > 0) {
      hitpoints.value = hitpoints.value - random_damage;
      experience.value = experience.value + random_experience;
      courage.value = courage.value - 1;
      isLevelUp;

      return true;
    } else {
      return false;
    }
  }

  buyItem(item_name, count) => {
        if (inventory
                .where((element) => element.item.title == item_name)
                .isEmpty ==
            false)
          {
            inventory
                .where((element) => element.item.title == item_name)
                .first
                .amount += count.toInt(),
            print('count added to first element')
          }
        else
          {
            print(
                'item is not inside inventory. Adding new item to inventory...'),
            inventory.add(InventoryObject(
                Item(
                    title: item_name,
                    asset: 'assets/icons/duel.png',
                    type: 'bow'),
                count.round()))
          },
        //print('items in inventory: ${inventory.length}'),
        inventory.refresh()
      };

  inventoryCheck(item_name) => {
        if (inventory
                .where((element) => element.item.title == item_name)
                .first
                .amount !=
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
        if (inventory.where((element) => element.item.title == item_name) !=
            null)
          {
            if (inventory
                    .where((element) => element.item.title == item_name)
                    .first
                    .amount <
                count.toInt())
              {
                inventory
                    .where((element) => element.item.title == item_name)
                    .first
                    .amount = 0
              }
            else
              {
                inventory
                    .where((element) => element.item.title == item_name)
                    .first
                    .amount -= count.toInt()
              }
          }
        else
          {print('doesnt work')},
        print('how mnay items?: ${inventory.length}'),
        for (var item in inventory) {print(item.amount)},
        inventory.refresh()
      };
}
