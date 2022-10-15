// screen_b.dart
import 'package:flutter/material.dart';

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
    return Text('ds');
  }
}
