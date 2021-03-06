import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_diary/services/theme_service.dart';

import '../app/app.dart';

Future<void> runApplication() async {
  // Need to be called so that the orientation does not fall
  WidgetsFlutterBinding.ensureInitialized();

  // Freeze orientation
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const App(themeService: ThemeService()));
}
