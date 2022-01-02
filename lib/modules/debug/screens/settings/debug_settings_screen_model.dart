import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';

class DebugSettingsScreenModel extends ElementaryModel {
  final DeviceInfoPlugin _deviceInfo;

  DebugSettingsScreenModel(this._deviceInfo);

  Future<String> fetchDeviceModel() async {
    if (kIsWeb) {
      final info = await _deviceInfo.webBrowserInfo;

      return '${info.vendor ?? ''} ${info.userAgent ?? ''}'.trim();
    }

    if (Platform.isAndroid) {
      final info = await _deviceInfo.androidInfo;

      return '${info.brand ?? ''}  ${info.model ?? ''}'.trim();
    }

    if (Platform.isIOS) {
      final info = await _deviceInfo.iosInfo;

      return info.name ?? '';
    }

    return '';
  }
}
