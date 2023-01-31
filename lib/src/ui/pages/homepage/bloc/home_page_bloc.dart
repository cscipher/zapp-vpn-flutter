import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:zapp_vpn/src/ui/pages/splash_page/splash_page_data.dart';
import 'package:zapp_vpn/src/utils/zapp_enums.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageLoadingState(dataIndex: 0)) {
    on<HomePageToggleDarkModeEvent>(_handleDarkMode);
    on<HomePageToggleConnectionEvent>(_handleVpnConnection);
    on<HomePageLoadingEvent>(_mapHomePageLoadingEventToState);
    on<HomePageVpnConnectedTimeStringEvent>(_buildConnectedSinceString);

    _splashPageCarousalTimer =
        Timer.periodic(const Duration(seconds: 2), (timer) {
      if (x >= splashData.length) x = 0;
      add(HomePageLoadingEvent(x++));
    });
  }

  HomePageLoadedState? cachedLoadedState;
  int x = 0;
  Timer? _splashPageCarousalTimer;
  Timer? _connectionTimeStringBuildTimer;
  Stopwatch? _connectionTimeStopwatch;

  String get _constructConnectionSinceString {
    if (_connectionTimeStopwatch == null) return '';
    String hr = '', sec = '', min = '';
    hr = _connectionTimeStopwatch!.elapsed.inHours.toString().padLeft(2, '0');
    min = (_connectionTimeStopwatch!.elapsed.inMinutes % 60)
        .toString()
        .padLeft(2, '0');
    sec = (_connectionTimeStopwatch!.elapsed.inSeconds % 60)
        .toString()
        .padLeft(2, '0');
    return '$hr:$min:$sec';
  }

  FutureOr<void> _mapHomePageLoadingEventToState(
      HomePageLoadingEvent event, Emitter<HomePageState> emit) async {
    emit(HomePageLoadingState(dataIndex: event.x));
    await Future.delayed(const Duration(seconds: 1));
    _splashPageCarousalTimer?.cancel();
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
      _connectionTimeStringBuildTimer?.cancel();
      cachedLoadedState = cachedLoadedState!.copyWith(
        vpnConnectionStatus: event.vpnConnectionStatus,
        // connectedSinceTime: null,
      );
      emit(cachedLoadedState!);
      if (event.vpnConnectionStatus == VPNConnectionStatus.connecting) {
        await Future.delayed(const Duration(seconds: 3));
        _connectionTimeStopwatch = Stopwatch();
        _connectionTimeStopwatch!.start();
        cachedLoadedState = cachedLoadedState!.copyWith(
          vpnConnectionStatus: VPNConnectionStatus.connected,
          connectedSinceString: _constructConnectionSinceString,
        );

        emit(cachedLoadedState!);
        _connectionTimeStringBuildTimer =
            Timer.periodic(const Duration(seconds: 1), (timer) {
          add(HomePageVpnConnectedTimeStringEvent());
        });
      }
    }
  }

  FutureOr<void> _buildConnectedSinceString(
      HomePageVpnConnectedTimeStringEvent event, Emitter<HomePageState> emit) {
    if (cachedLoadedState != null) {
      cachedLoadedState = cachedLoadedState!.copyWith(
        connectedSinceString: _constructConnectionSinceString,
      );
      emit(cachedLoadedState!);
    }
  }
}
