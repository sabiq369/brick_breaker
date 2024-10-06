import 'package:flutter/material.dart';

class Brick extends StatelessWidget {
  final brickX;
  final brickY;
  final brickWidth;
  final brickHeight;
  final brickBroken;
  Brick(
      {this.brickX,
      this.brickY,
      this.brickWidth,
      this.brickHeight,
      this.brickBroken});

  @override
  Widget build(BuildContext context) {
    return brickBroken
        ? const SizedBox()
        : Container(
            alignment: Alignment(brickX, brickY),
            child: Container(
              width: MediaQuery.of(context).size.width * brickWidth / 2,
              height: MediaQuery.of(context).size.height * brickHeight / 2,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(5)),
            ),
          );
  }
}
