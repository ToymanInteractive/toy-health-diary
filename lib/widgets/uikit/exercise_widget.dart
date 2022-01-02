import 'package:flutter/material.dart';

import 'circle_painter.dart';

const _imageWeight = 0.875;
const _outlineWeight = 0.0625;

class ExerciseWidget extends StatelessWidget {
  final double size;
  final Color color;
  final ImageProvider? image;

  const ExerciseWidget({
    Key? key,
    required this.size,
    this.color = Colors.cyan,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(width: size * _outlineWeight, color: color),
      child: Padding(
        padding: EdgeInsets.all(size * (1.0 - _outlineWeight - _imageWeight)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size * _imageWeight),
          child: image != null
              ? Image(
                  image: image!,
                  width: size * _imageWeight,
                  height: size * _imageWeight,
                )
              : Container(
                  color: color,
                  width: size * _imageWeight,
                  height: size * _imageWeight,
                  child: Center(
                    child: Icon(
                      Icons.fitness_center_outlined,
                      size: size * _imageWeight * 0.75,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
