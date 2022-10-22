import 'package:flutter/material.dart';
import 'package:myfirstapp/game_objects/Items.dart';
import 'package:myfirstapp/game_objects/Countries.dart';
import 'package:myfirstapp/providers/timer_counter.dart';

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
}
