enum VPNConnectionStatus { notConnected, connecting, connected }

enum VPNServerNetworkStrength { poor, normal, strong }

enum SpeedtestStatus { notStarted, running, completed }

enum SpeedtestType { none, downloadTest, uploadTest }

extension SpeedtestStatusX on SpeedtestStatus {
  bool get isCompleted => this == SpeedtestStatus.completed;
  bool get isNotStarted => this == SpeedtestStatus.notStarted;
  bool get isRunning => this == SpeedtestStatus.running;
}

extension SpeedtestTypeX on SpeedtestType {
  String get name => this == SpeedtestType.downloadTest
      ? 'Downloading...'
      : this == SpeedtestType.uploadTest
          ? 'Uploading...'
          : '';
}
