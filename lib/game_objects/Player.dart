import 'package:Cyber_Knights/game_objects/Countries.dart';

class Player {
  String username;
  Country nationality;
  int experience;
  int rubbles;
  int level;
  double silver;
  int attack;
  int defense;
  int maxCourage;
  int maxStrength;
  int maxHitpoints;

  Player({
    required this.username,
    required this.nationality,
    required this.rubbles,
    required this.level,
    required this.experience,
    required this.silver,
    required this.attack,
    required this.defense,
    required this.maxCourage,
    required this.maxStrength,
    required this.maxHitpoints,
  });
}

login() {
  final player = Player(
    username: 'player#22323',
    nationality: PL,
    experience: 100,
    level: 1,
    rubbles: 10,
    silver: 29.000,
    attack: 5,
    defense: 5,
    maxCourage: 5,
    maxStrength: 5,
    maxHitpoints: 100,
  );

  return (player);
}

final player = login();
