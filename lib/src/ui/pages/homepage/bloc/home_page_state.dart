// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_page_bloc.dart';

abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageInitialState extends HomePageState {}

class HomePageLoadedState extends HomePageState {
  final bool isDarkModeEnabled;
  final bool isConnected;
  final String connectedSinceString;

  const HomePageLoadedState({
    required this.isDarkModeEnabled,
    this.isConnected = false,
    this.connectedSinceString = '',
  });

  @override
  List<Object> get props =>
      [isDarkModeEnabled, isConnected, connectedSinceString];

  HomePageLoadedState copyWith({
    bool? isDarkModeEnabled,
    bool? isConnected,
    String? connectedSinceString,
  }) {
    return HomePageLoadedState(
      connectedSinceString: connectedSinceString ?? this.connectedSinceString,
      isConnected: isConnected ?? this.isConnected,
      isDarkModeEnabled: isDarkModeEnabled ?? this.isDarkModeEnabled,
    );
  }
}
