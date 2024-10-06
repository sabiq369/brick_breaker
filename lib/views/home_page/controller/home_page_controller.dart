import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  RxBool hasGameStarted = false.obs,
      isGameOver = false.obs,
      brickBroken = false.obs;
  RxDouble ballX = 0.0.obs, ballY = 0.0.obs, playerX = (-0.2).obs;
  double playerWidth = 0.4,
      brickX = 0.0,
      brickY = -0.9,
      brickWidth = 0.4,
      brickHeight = 0.05;
  var ballDirection = Direction.down;

  void startGame() {
    hasGameStarted.value = true;
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      updateDirection();
      moveBall();
      if (isPlayerDead()) {
        timer.cancel();
        isGameOver.value = true;
      }
      checkForBrokenBrick();
    });
  }

  bool isPlayerDead() {
    if (ballY.value >= 1) {
      return true;
    }
    return false;
  }

  void moveBall() {
    if (ballDirection == Direction.down) {
      ballY.value += 0.01;
    } else if (ballDirection == Direction.up) {
      ballY.value -= 0.01;
    }
  }

  void checkForBrokenBrick() {
    if (ballX.value >= brickX &&
        ballX.value <= brickX + brickWidth &&
        ballY <= brickY + brickHeight &&
        brickBroken.value == false) {
      brickBroken.value = true;
      ballDirection = Direction.down;
    }
  }

  void updateDirection() {
    if (ballY.value >= 0.9 &&
        ballX >= playerX.value &&
        ballX <= playerX.value + playerWidth) {
      ballDirection = Direction.up;
    } else if (ballY.value <= -1) {
      ballDirection = Direction.down;
    }
  }

  onKey(KeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      print('||||| left pressed |||||||||');
      if (!(playerX.value - 0.2 < -1)) {
        playerX.value -= 0.2;
      }
    } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      print('||||| right pressed |||||||||');
      if (!(playerX.value + playerWidth >= 1)) {
        playerX.value += 0.2;
      }
    }
  }
}

enum Direction {
  up,
  down,
}
