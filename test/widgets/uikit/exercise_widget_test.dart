import 'package:flutter/rendering.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:health_diary/widgets/uikit/exercise_widget.dart';

void main() {
  testGoldens('Exercise widget golden test', (tester) async {
    final builder = GoldenBuilder.column()
      ..addScenario(
        'Exercise widget',
        const ExerciseWidget(
          avatar: AssetImage('assets/stubs/exercise.png'),
          size: 48,
        ),
      );

    await tester.pumpWidgetBuilder(
      builder.build(),
      surfaceSize: const Size(142, 105),
    );

    await screenMatchesGolden(tester, 'exercise_widget');
  });
}
