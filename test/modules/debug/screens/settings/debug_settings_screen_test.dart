import 'dart:async';

import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:health_diary/modules/debug/screens/settings/debug_settings_screen.dart';
import 'package:health_diary/modules/debug/screens/settings/debug_settings_screen_model.dart';
import 'package:health_diary/modules/debug/screens/settings/debug_settings_screen_wm.dart';
import 'package:mocktail/mocktail.dart';

class DebugSettingsScreenModelMock extends Mock
    implements DebugSettingsScreenModel {}

void main() {
  testGoldens('Debug settings screen test', (tester) async {
    final model = DebugSettingsScreenModelMock();

    when(model.fetchDeviceModel)
        .thenAnswer((_) => Future<String>.value('mock device'));

    await tester.pumpWidgetBuilder(
      DebugSettingsScreen(wmFactory: (_) => DebugSettingsScreenWM(model)),
    );

    await multiScreenGolden(tester, 'debug_settings_screen');
  });
}
