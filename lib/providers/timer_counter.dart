import 'dart:async';

import 'package:get/get.dart';
import 'package:myfirstapp/providers/player_controller.dart';

var player2 = Get.put(PlayerController());

class TimerStrengthController extends GetxController {
  Timer? _timer;

  int remainingSeconds = 1;

  final time = '00.00'.obs;
  final duration = 10;

  @override
  void onReady() {
    _startTimer(duration);
    super.onReady();
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        player2.incrementStrength();
        _startTimer(10);
      }
      if (player2.strength == player2.maxStrength) {
        timer.cancel();
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = (remainingSeconds % 60);
        time.value = minutes.toString().padLeft(2, "0") +
            ":" +
            seconds.toString().padLeft(2, "0");
        remainingSeconds--;
      }
    });

    // create timer
  }

  // create timer
}

class TimerCourageController extends GetxController {
  Timer? _timer;

  int remainingSeconds = 1;

  final time = '00.00'.obs;
  final duration = 300;

  @override
  void onReady() {
    _startTimer(duration);
    super.onReady();
  }

  //@override
  // void onClose() {
  //  if (_timer != null) {
  //     _timer!.cancel();
  //   }
  //  super.onClose();
  //}

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();

        player2.incrementCourage();
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = (remainingSeconds % 60);
        time.value = minutes.toString().padLeft(2, "0") +
            ":" +
            seconds.toString().padLeft(2, "0");
        remainingSeconds--;
      }
    });

    // create timer
  }

  // create timer
}

class TimerHealthController extends GetxController {
  Timer? _timer;

  int remainingSeconds = 1;

  final time = '00.00'.obs;
  final duration = 300;

  @override
  void onReady() {
    _startTimer(duration);
    super.onReady();
  }

  //@override
  // void onClose() {
  //  if (_timer != null) {
  //     _timer!.cancel();
  //   }
  //  super.onClose();
  //}

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        player2.incrmentHealth();
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = (remainingSeconds % 60);
        time.value = minutes.toString().padLeft(2, "0") +
            ":" +
            seconds.toString().padLeft(2, "0");
        remainingSeconds--;
      }
    });

    // create timer
  }

  // create timer
}

class TimerTaxesController extends GetxController {
  Timer? _timer;

  int remainingSeconds = 1;

  final time = '00.00'.obs;
  final duration = 300;

  @override
  void onReady() {
    _startTimer(duration);
    super.onReady();
  }

  //@override
  // void onClose() {
  //  if (_timer != null) {
  //     _timer!.cancel();
  //   }
  //  super.onClose();
  //}

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        player2.collectTaxes();
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = (remainingSeconds % 60);
        time.value = minutes.toString().padLeft(2, "0") +
            ":" +
            seconds.toString().padLeft(2, "0");
        remainingSeconds--;
      }
    });

    // create timer
  }

  // create timer
}
