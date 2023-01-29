part of 'home_page_bloc.dart';

abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class HomePageInitialEvent extends HomePageEvent {}

class HomePageToggleDarkModeEvent extends HomePageEvent {
  final Function(bool state) updateTheme;
  const HomePageToggleDarkModeEvent({required this.updateTheme});
}

class HomePageToggleConnectionEvent extends HomePageEvent {
  final bool isConnected;
  const HomePageToggleConnectionEvent(this.isConnected);
}
