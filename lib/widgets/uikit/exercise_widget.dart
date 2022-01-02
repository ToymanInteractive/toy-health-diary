import 'package:flutter/widgets.dart';

import 'circle_painter.dart';

const _imageWeight = 0.875;
const _outlineWeight = 0.0625;

class ExerciseWidget extends StatelessWidget {
  final ImageProvider image;
  final double size;

  const ExerciseWidget({
    Key? key,
    required this.image,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(width: size * _outlineWeight),
      child: Padding(
        padding: EdgeInsets.all(size * (1.0 - _outlineWeight - _imageWeight)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size * _imageWeight),
          child: Image(
            image: image,
            height: size * _imageWeight,
            width: size * _imageWeight,
          ),
        ),
      ),
    );
  }
}
