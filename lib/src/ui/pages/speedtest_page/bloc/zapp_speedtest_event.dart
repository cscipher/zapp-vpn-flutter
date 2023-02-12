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
  final SpeedUnit unit;
  final SpeedtestType speedtestType;
  final SpeedtestStatus speedtestStatus;

  final bool isError;

  const ZappSpeedtestUpdateConnectionDataEvent({
    required this.speedtestStatus,
    this.downloadTransferRate = 0.0,
    this.uploadTransferRate = 0.0,
    this.unit = SpeedUnit.Mbps,
    required this.speedtestType,
    this.isError = false,
  });
}
