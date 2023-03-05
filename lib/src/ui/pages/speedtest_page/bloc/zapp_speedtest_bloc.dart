import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internet_speed_test/flutter_internet_speed_test.dart';
import 'package:zapp_vpn/src/utils/zapp_enums.dart';
import 'package:zapp_vpn/src/utils/zapp_snackbar.dart';

part 'zapp_speedtest_event.dart';
part 'zapp_speedtest_state.dart';

class ZappSpeedtestBloc extends Bloc<ZappSpeedtestEvent, ZappSpeedtestState> {
  ZappSpeedtestBloc() : super(const ZappSpeedtestConnectionState()) {
    on<ZappSpeedtestDownloadTestEvent>(
        _mapZappSpeedtestDownloadTestEventToState);
    on<ZappSpeedtestUploadTestEvent>(_mapZappSpeedtestUploadTestEventToState);
    on<ZappSpeedtestUpdateConnectionDataEvent>(
        _mapZappSpeedtestUpdateConnectionDataEventToState);
    on<ZappSpeedtestResetEvent>(_mapZappSpeedtestResetEventToState);
  }

  void _errorCallback(BuildContext context, Emitter<ZappSpeedtestState> emit) {
    add(const ZappSpeedtestUpdateConnectionDataEvent(
      speedtestStatus: SpeedtestStatus.completed,
      speedtestType: SpeedtestType.none,
      uploadUnit: SpeedUnit.kbps,
      downloadUnit: SpeedUnit.kbps,
    ));
    showZappSnackbar(
      context,
      message: 'Cannot test at this time. Try again',
    );
  }

  FutureOr<void> _mapZappSpeedtestDownloadTestEventToState(
      ZappSpeedtestDownloadTestEvent event, Emitter<ZappSpeedtestState> emit) {
    final speedTest = FlutterInternetSpeedTest();
    speedTest.startTesting(
      useFastApi: true,
      onStarted: () {},
      onCompleted: (TestResult download, TestResult upload) {
        add(ZappSpeedtestUpdateConnectionDataEvent(
          downloadUnit: download.unit,
          uploadUnit: upload.unit,
          downloadTransferRate: download.transferRate,
          uploadTransferRate: upload.transferRate,
          speedtestType: SpeedtestType.none,
          speedtestStatus: SpeedtestStatus.completed,
        ));
      },
      onProgress: (double percent, TestResult data) {
        if (data.type == TestType.download) {
          add(ZappSpeedtestUpdateConnectionDataEvent(
            downloadTransferRate: data.transferRate,
            speedtestStatus: SpeedtestStatus.running,
            speedtestType: SpeedtestType.downloadTest,
            downloadUnit: data.unit,
          ));
        } else {
          add(ZappSpeedtestUpdateConnectionDataEvent(
            downloadUnit: data.unit,
            uploadTransferRate: data.transferRate,
            speedtestStatus: SpeedtestStatus.running,
            speedtestType: SpeedtestType.uploadTest,
          ));
        }
      },
      onError: (String errorMessage, String speedTestError) {
        _errorCallback(event.context, emit);
      },
      onDownloadComplete: (TestResult data) {},
      onUploadComplete: (TestResult data) {},
      onCancel: () {},
    );

    // _zappVpnSpeedTestService.startDownloadTest(
    //   connectionProgressCallback: (transferRate, unit) {
    //   add(ZappSpeedtestUpdateConnectionDataEvent(
    //     unit: unit,
    //     downloadTransferRate: transferRate,
    //     speedtestStatus: SpeedtestStatus.running,
    //     speedtestType: SpeedtestType.downloadTest,
    //   ));
    // },
    //   connectionDoneCallback: (transferRate, unit) {
    //     add(ZappSpeedtestUploadTestEvent(event.context));
    //   },
    //   onError: () => _errorCallback(event.context, emit),
    // );
  }

  FutureOr<void> _mapZappSpeedtestResetEventToState(
      ZappSpeedtestResetEvent event, Emitter<ZappSpeedtestState> emit) {
    emit(const ZappSpeedtestConnectionState());
  }

  FutureOr<void> _mapZappSpeedtestUploadTestEventToState(
      ZappSpeedtestUploadTestEvent event, Emitter<ZappSpeedtestState> emit) {
    // _zappVpnSpeedTestService.startUploadTest(
    //   connectionProgressCallback: (transferRate, unit) {
    // add(ZappSpeedtestUpdateConnectionDataEvent(
    //   unit: unit,
    //   uploadTransferRate: transferRate,
    //   speedtestStatus: SpeedtestStatus.running,
    //   speedtestType: SpeedtestType.uploadTest,
    // ));
    //   },
    //   connectionDoneCallback: (transferRate, unit) {
    // add(ZappSpeedtestUpdateConnectionDataEvent(
    //   unit: unit,
    //   uploadTransferRate: transferRate,
    //   speedtestType: SpeedtestType.none,
    //   speedtestStatus: SpeedtestStatus.completed,
    // ));
    //   },
    //   onError: () => _errorCallback(event.context, emit),
    // );
  }

  ZappSpeedtestConnectionState cachedState =
      const ZappSpeedtestConnectionState();

  FutureOr<void> _mapZappSpeedtestUpdateConnectionDataEventToState(
      ZappSpeedtestUpdateConnectionDataEvent event,
      Emitter<ZappSpeedtestState> emit) {
    if (event.speedtestType == SpeedtestType.downloadTest) {
      cachedState = cachedState.copyWith(
        speedUnit: event.downloadUnit,
        downloadTransferRate: event.downloadTransferRate,
        speedtestStatus: event.speedtestStatus,
        speedtestType: event.speedtestType,
      );
      emit(cachedState);
    } else if (event.speedtestType == SpeedtestType.uploadTest) {
      cachedState = cachedState.copyWith(
        speedUnit: event.downloadUnit,
        uploadTransferRate: event.uploadTransferRate,
        speedtestStatus: event.speedtestStatus,
        speedtestType: event.speedtestType,
      );
      emit(cachedState);
    } else {
      emit(ZappSpeedtestConnectionState(
        uploadTransferRate: cachedState.uploadTransferRate,
        downloadTransferRate: cachedState.downloadTransferRate,
        speedUnit: cachedState.speedUnit,
        speedtestStatus: SpeedtestStatus.completed,
        speedtestType: SpeedtestType.none,
      ));
    }
  }
}
