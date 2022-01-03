import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:health_diary/modules/debug/screens/settings/debug_settings_screen.dart';
import 'package:health_diary/modules/debug/screens/settings/debug_settings_screen_model.dart';
import 'package:health_diary/modules/debug/screens/settings/debug_settings_screen_wm.dart';
import 'package:mocktail/mocktail.dart';

class DebugSettingsScreenModelMock extends Mock
    implements DebugSettingsScreenModel {}

void main() {
  group('Debug settings screen', () {
    late DebugSettingsScreenModelMock model;

    setUp(() {
      model = DebugSettingsScreenModelMock();

      when(model.fetchDeviceModel)
          .thenAnswer((_) => Future<String>.value('mock device'));
    });

    testGoldens('golden test', (tester) async {
      await tester.pumpWidgetBuilder(
        DebugSettingsScreen(wmFactory: (_) => DebugSettingsScreenWM(model)),
        wrapper: materialAppWrapper(
          theme: FlexThemeData.light(
            scheme: FlexScheme.deepBlue,
            // Use very subtly themed app bar elevation in light mode.
            appBarElevation: 0.5,
          ),
        ),
      );

      await multiScreenGolden(tester, 'debug_settings_screen');
    });

    testWidgets('widget test', (tester) async {
      await tester.pumpWidgetBuilder(
        DebugSettingsScreen(wmFactory: (_) => DebugSettingsScreenWM(model)),
      );

      expect(find.text('Device: mock device'), findsOneWidget);
      expect(find.textContaining('screen:'), findsOneWidget);
      expect(find.textContaining('screen safe area:'), findsOneWidget);
      expect(find.textContaining('text scale:'), findsOneWidget);
    });
  });
}
