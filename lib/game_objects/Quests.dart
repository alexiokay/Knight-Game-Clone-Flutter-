import 'package:myfirstapp/game_objects/Items.dart';

class QuestRequirements {
  List<Item> items;

  QuestRequirements({
    required this.items,
  });
}

class Quest {
  String title;
  double reward;
  int experience;
  bool loot;
  int cost;
  int progress;
  QuestRequirements requirements;

  Quest({
    required this.title,
    required this.reward,
    required this.experience,
    required this.loot,
    required this.progress,
    required this.cost,
    required this.requirements,
  });
}
