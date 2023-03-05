part of 'zapp_speedtest_bloc.dart';

abstract class ZappSpeedtestEvent extends Equatable {
  const ZappSpeedtestEvent();

  @override
  List<Object> get props => [];
}

class ZappSpeedtestDownloadTestEvent extends ZappSpeedtestEvent {
  final BuildContext context;
  const ZappSpeedtestDownloadTestEvent(this.context);
}

class ZappSpeedtestUploadTestEvent extends ZappSpeedtestEvent {
  final BuildContext context;
  const ZappSpeedtestUploadTestEvent(this.context);
}

class ZappSpeedtestResetEvent extends ZappSpeedtestEvent {}

class ZappSpeedtestUpdateConnectionDataEvent extends ZappSpeedtestEvent {
  final double uploadTransferRate;
  final double downloadTransferRate;
  final SpeedUnit? downloadUnit;
  final SpeedUnit? uploadUnit;
  final SpeedtestType speedtestType;
  final SpeedtestStatus speedtestStatus;

  final bool isError;

  const ZappSpeedtestUpdateConnectionDataEvent({
    this.downloadUnit,
    this.uploadUnit,
    required this.speedtestStatus,
    required this.speedtestType,
    this.isError = false,
    this.uploadTransferRate = 0.0,
    this.downloadTransferRate = 0.0,
  });
}
