import 'package:Cyber_Knights/game_objects/Quests.dart';

class MapLocation {
  String title;
  int levelAvailability;
  int rubinsAvalible;
  List<Quest> quests;

  MapLocation({
    required this.title,
    required this.levelAvailability,
    required this.rubinsAvalible,
    required this.quests,
  });
}
