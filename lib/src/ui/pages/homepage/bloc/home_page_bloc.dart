import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zapp_vpn/src/ui/pages/splash_page/splash_page_data.dart';
import 'package:zapp_vpn/src/utils/zapp_enums.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageInitialState()) {
    on<HomePageInitialEvent>(_mapHomePageInitialEventToState);
    on<HomePageToggleDarkModeEvent>(_handleDarkMode);
    on<HomePageToggleConnectionEvent>(_handleVpnConnection);
    on<HomePageLoadingEvent>(_mapHomePageLoadingEventToState);

    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (x >= splashData.length) x = 0;
      add(HomePageLoadingEvent(x++));
    });
  }

  HomePageLoadedState? cachedLoadedState;
  int x = 0;
  Timer? timer;

  FutureOr<void> _mapHomePageLoadingEventToState(
      HomePageLoadingEvent event, Emitter<HomePageState> emit) {
    emit(HomePageLoadingState(dataIndex: event.x));
  }

  FutureOr<void> _mapHomePageInitialEventToState(
      HomePageInitialEvent event, Emitter<HomePageState> emit) async {
    await Future.delayed(const Duration(seconds: 5));
    timer?.cancel();
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
      HomePageToggleConnectionEvent event, Emitter<HomePageState> emit) async {
    if (cachedLoadedState != null) {
      cachedLoadedState = cachedLoadedState!
          .copyWith(vpnConnectionStatus: event.vpnConnectionStatus);
      emit(cachedLoadedState!);
      if (event.vpnConnectionStatus == VPNConnectionStatus.connecting) {
        await Future.delayed(const Duration(seconds: 3));
        cachedLoadedState = cachedLoadedState!
            .copyWith(vpnConnectionStatus: VPNConnectionStatus.connected);
        emit(cachedLoadedState!);
      }
    }
  }
}
