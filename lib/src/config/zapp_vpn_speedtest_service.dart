import 'package:flutter/material.dart';
import 'package:internet_speed_test/callbacks_enum.dart';
import 'package:internet_speed_test/internet_speed_test.dart';

class ZappVpnSpeedTestService {
  late final InternetSpeedTest _speedTestInstance;

  ZappVpnSpeedTestService() {
    _speedTestInstance = InternetSpeedTest();
  }

  Future<void> startDownloadTest({
    required void Function(double transferRate, SpeedUnit unit)
        connectionProgressCallback,
    required void Function(double transferRate, SpeedUnit unit)
        connectionDoneCallback,
    required VoidCallback onError,
  }) async {
    _speedTestInstance.startDownloadTesting(
      testServer: 'https://speedtest.apyhi.com/download/50MiB',
      onDone: connectionDoneCallback,
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        connectionProgressCallback.call(transferRate, unit);
      },
      onError: (errorMessage, speedTestError) {
        onError.call();
      },
    );
    return;
  }

  void startUploadTest({
    required void Function(double transferRate, SpeedUnit unit)
        connectionProgressCallback,
    required void Function(double transferRate, SpeedUnit unit)
        connectionDoneCallback,
    required VoidCallback onError,
  }) {
    _speedTestInstance.startUploadTesting(
      testServer: 'https://fast.com',
      onDone: connectionDoneCallback,
      onProgress: (double percent, double transferRate, SpeedUnit unit) {
        connectionProgressCallback.call(transferRate, unit);
      },
      onError: (errorMessage, speedTestError) {
        onError.call();
      },
    );
  }
}
