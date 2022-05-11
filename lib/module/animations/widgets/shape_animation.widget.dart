import 'package:flutter/material.dart';
import 'dart:math' as math;

class ShapeAnimationWidget extends StatelessWidget {
  double size;
  double rotate;
  double opacity;
  double offsetX;
  double offsetY;
  double containerSize;

  ShapeAnimationWidget({
    Key? key,
    this.size = 1,
    this.rotate = 0,
    this.opacity = 1,
    this.offsetX = 0.5,
    this.offsetY = 0.5,
    this.containerSize = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerSize,
      height: containerSize,
      clipBehavior: Clip.hardEdge,
      alignment: Alignment(1 - (offsetX * 2), 1 - (offsetY * 2)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.black54, width: 1),
      ),
      child: Transform.rotate(
        angle: (rotate * math.pi / 180) * 100,
        child: Opacity(
          opacity: math.max(math.min(opacity, 1), 0),
          child: Container(
            width: math.max((containerSize * 0.6) * size, 0) + 30,
            height: math.max(((containerSize * 0.6) * size) / 2, 0) + 15,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}
