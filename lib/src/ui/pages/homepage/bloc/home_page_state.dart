// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageInitialState extends HomePageState {}

class HomePageLoadingState extends HomePageState {
  final int dataIndex;
  const HomePageLoadingState({required this.dataIndex});

  @override
  List<Object> get props => [dataIndex];
}

class HomePageLoadedState extends HomePageState {
  final bool isDarkModeEnabled;
  final VPNConnectionStatus vpnConnectionStatus;
  final String connectedSinceString;

  const HomePageLoadedState({
    required this.isDarkModeEnabled,
    this.vpnConnectionStatus = VPNConnectionStatus.notConnected,
    this.connectedSinceString = '',
  });

  @override
  List<Object> get props =>
      [isDarkModeEnabled, vpnConnectionStatus, connectedSinceString];

  HomePageLoadedState copyWith({
    bool? isDarkModeEnabled,
    VPNConnectionStatus? vpnConnectionStatus,
    String? connectedSinceString,
  }) {
    return HomePageLoadedState(
      connectedSinceString: connectedSinceString ?? this.connectedSinceString,
      vpnConnectionStatus: vpnConnectionStatus ?? this.vpnConnectionStatus,
      isDarkModeEnabled: isDarkModeEnabled ?? this.isDarkModeEnabled,
    );
  }
}
