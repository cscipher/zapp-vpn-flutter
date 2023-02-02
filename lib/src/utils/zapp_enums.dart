enum VPNConnectionStatus { notConnected, connecting, connected }

enum VPNServerNetworkStrength { poor, normal, strong }

enum SpeedtestStatus { notStarted, running, completed }

extension SpeedtestStatusX on SpeedtestStatus {
  bool get isCompleted => this == SpeedtestStatus.completed;
  bool get isNotStarted => this == SpeedtestStatus.notStarted;
  bool get isRunning => this == SpeedtestStatus.running;
}
