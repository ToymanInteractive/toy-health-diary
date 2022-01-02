import 'dart:async';

import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

const _devices = [
  Device(
    size: Size(1440, 2907),
    devicePixelRatio: 3.5,
    name: 'Samsung SM-G65F',
    safeArea: EdgeInsets.only(top: 24),
    textScale: 1.1,
  ),
];

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  return GoldenToolkit.runWithConfiguration(
    () async {
      await loadAppFonts();
      await testMain();
    },
    config: GoldenToolkitConfiguration(
      defaultDevices: [
        ..._devices.map(_mapDevice),
        ..._devices.map(_mapDevice).map((device) => device.dark()),
      ],
      enableRealShadows: true,
    ),
  );
}

// Temporary downscale while bug not fixed https://github.com/eBay/flutter_glove_box/issues/119
Device _mapDevice(Device originalDevice) => originalDevice.copyWith(
      size: originalDevice.size / originalDevice.devicePixelRatio,
      devicePixelRatio: 1,
    );
