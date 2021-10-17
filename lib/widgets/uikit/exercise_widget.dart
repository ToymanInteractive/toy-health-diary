import 'package:flutter/widgets.dart';

import 'circle_painter.dart';

class ExerciseWidget extends StatelessWidget {
  final ImageProvider avatar;
  final double size;

  const ExerciseWidget({
    Key? key,
    required this.avatar,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CirclePainter(width: size * 0.03125),
      child: Padding(
        padding: EdgeInsets.all(size * 0.0625),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(size)),
          child: Image(
            image: avatar,
            height: size * 0.875,
            width: size * 0.875,
          ),
        ),
      ),
    );
  }
}
