// screen_b.dart
import 'package:flutter/material.dart';

class ScreenMore extends StatelessWidget {
  const ScreenMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'More',
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
