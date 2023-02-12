// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'zapp_speedtest_bloc.dart';

abstract class ZappSpeedtestState extends Equatable {
  const ZappSpeedtestState();

  @override
  List<Object> get props => [];
}

class ZappSpeedtestConnectionState extends ZappSpeedtestState {
  final double downloadTransferRate;
  final double uploadTransferRate;
  final SpeedUnit speedUnit;
  final SpeedtestType speedtestType;
  final SpeedtestStatus speedtestStatus;

  const ZappSpeedtestConnectionState({
    this.uploadTransferRate = 0.0,
    this.downloadTransferRate = 0.0,
    this.speedUnit = SpeedUnit.Kbps,
    this.speedtestType = SpeedtestType.none,
    this.speedtestStatus = SpeedtestStatus.notStarted,
  });

  @override
  List<Object> get props => [
        downloadTransferRate,
        uploadTransferRate,
        speedUnit,
        speedtestType,
        speedtestStatus,
      ];

  ZappSpeedtestConnectionState copyWith({
    double? downloadTransferRate,
    double? uploadTransferRate,
    SpeedUnit? speedUnit,
    SpeedtestType? speedtestType,
    SpeedtestStatus? speedtestStatus,
  }) {
    return ZappSpeedtestConnectionState(
      downloadTransferRate: downloadTransferRate ?? this.downloadTransferRate,
      uploadTransferRate: uploadTransferRate ?? this.uploadTransferRate,
      speedUnit: speedUnit ?? this.speedUnit,
      speedtestType: speedtestType ?? this.speedtestType,
      speedtestStatus: speedtestStatus ?? this.speedtestStatus,
    );
  }
}
