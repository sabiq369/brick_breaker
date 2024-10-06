import 'package:brick_breaker/common/extracted_widget/brick.dart';
import 'package:brick_breaker/views/home_page/controller/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomePageController _homePageController = Get.put(HomePageController());
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return KeyboardListener(
        onKeyEvent: (event) => _homePageController.onKey(event),
        autofocus: true,
        focusNode: focusNode,
        child: GestureDetector(
          onTap: _homePageController.startGame,
          child: Scaffold(
            backgroundColor: Colors.deepPurple[100],
            body: Center(
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment(0, -0.1),
                    child: Text('Tap to play'),
                  ),
                  Container(
                    alignment: Alignment(_homePageController.ballX.value,
                        _homePageController.ballY.value),
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment(
                        (2 * _homePageController.playerX.value +
                                _homePageController.playerWidth) /
                            (2 - _homePageController.playerWidth),
                        0.9),
                    child: Container(
                      height: 12,
                      width: MediaQuery.of(context).size.width *
                          _homePageController.playerWidth /
                          2,
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Brick(
                    brickX: _homePageController.brickX,
                    brickY: _homePageController.brickY,
                    brickWidth: _homePageController.brickWidth,
                    brickHeight: _homePageController.brickHeight,
                    brickBroken: _homePageController.brickBroken.value,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
