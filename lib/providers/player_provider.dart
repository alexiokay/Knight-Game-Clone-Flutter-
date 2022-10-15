import 'package:flutter/material.dart';

class PlayerProvider with ChangeNotifier {
  int _maxCourage = 5;
  int _courage = 5;
  int _level = 1;
  int _avalibleAttributePoints = 0;
  int _strength = 5;
  int _maxStrength = 5;
  int _hitpoints = 5;
  int _maxHitpoints = 100;
  int _rubbles = 1;
  double _silver = 29.000;

  int get rubbles => _rubbles;
  double get silver => _silver;

  int get courage => _courage;
  int get maxCourage => _maxCourage;
  int get strength => _strength;
  int get maxStrength => _maxStrength;
  int get hitpoints => _hitpoints;
  int get maxHitpoints => _maxHitpoints;
  int get avalibleAttributePoints => _avalibleAttributePoints;

  int get level => _level;

  void fight() {
    if ((_courage <= 0) == false) {
      _courage--;
      notifyListeners();
    }
  }

  void levelUp() {
    _level++;
    _avalibleAttributePoints + 3;
    notifyListeners();
  }
}
