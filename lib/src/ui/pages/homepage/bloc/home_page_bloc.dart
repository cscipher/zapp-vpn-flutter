import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitialState()) {
    on<HomePageInitialEvent>(_mapHomePageInitialEventToState);
    on<HomePageToggleDarkModeEvent>(_handleDarkMode);
    on<HomePageToggleConnectionEvent>(_handleVpnConnection);
  }

  HomePageLoadedState? cachedLoadedState;

  FutureOr<void> _mapHomePageInitialEventToState(
      HomePageInitialEvent event, Emitter<HomePageState> emit) {
    cachedLoadedState = const HomePageLoadedState(isDarkModeEnabled: false);
    emit(cachedLoadedState!);
  }

  FutureOr<void> _handleDarkMode(
      HomePageToggleDarkModeEvent event, Emitter<HomePageState> emit) {
    if (cachedLoadedState != null) {
      cachedLoadedState = cachedLoadedState!
          .copyWith(isDarkModeEnabled: !cachedLoadedState!.isDarkModeEnabled);
      event.updateTheme(cachedLoadedState!.isDarkModeEnabled);
      emit(cachedLoadedState!);
    }
  }

  FutureOr<void> _handleVpnConnection(
      HomePageToggleConnectionEvent event, Emitter<HomePageState> emit) {
    if (cachedLoadedState != null) {
      cachedLoadedState =
          cachedLoadedState!.copyWith(isConnected: event.isConnected);
      emit(cachedLoadedState!);
    }
  }
}
