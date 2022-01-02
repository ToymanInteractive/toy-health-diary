import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:health_diary/widgets/uikit/circle_painter.dart';
import 'package:health_diary/widgets/uikit/exercise_widget.dart';

void main() {
  group('Debug settings screen', () {
    testGoldens('Exercise widget golden test', (tester) async {
      final builder = GoldenBuilder.column()
        ..addScenario(
          'Exercise widget with image',
          const ExerciseWidget(
            image: AssetImage('assets/stubs/exercise.png'),
            size: 48,
          ),
        )
        ..addScenario(
          'Exercise widget with fallback icon',
          const ExerciseWidget(size: 48),
        );

      await tester.pumpWidgetBuilder(
        builder.build(),
        surfaceSize: const Size(286, 194),
      );

      await screenMatchesGolden(tester, 'exercise_widget');
    });

    testWidgets('widget test', (tester) async {
      await tester.pumpWidgetBuilder(
        const ExerciseWidget(size: 48),
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Image && widget.width == 42 && widget.height == 42,
        ),
        findsOneWidget,
      );
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Padding && widget.padding == const EdgeInsets.all(3),
        ),
        findsOneWidget,
      );
      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is CustomPaint &&
              widget.painter is CirclePainter &&
              (widget.painter as CirclePainter).width == 3,
        ),
        findsOneWidget,
      );
    });
  });
}
