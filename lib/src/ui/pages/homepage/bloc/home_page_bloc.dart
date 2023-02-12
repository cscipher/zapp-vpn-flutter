import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:zapp_vpn/src/config/zapp_vpn_connection_service.dart';
import 'package:zapp_vpn/src/ui/pages/splash_page/splash_page_data.dart';
import 'package:zapp_vpn/src/utils/zapp_enums.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageLoadingState(dataIndex: 0)) {
    ZappVpnConnectionService.instance.init(
      connectionStatusChangeCallback: (status, error) {
        add(HomePageVpnStatusEvent(vpnStatus: status, error: error));
      },
    );

    on<HomePageToggleDarkModeEvent>(_handleDarkMode);
    on<HomePageToggleConnectionEvent>(_handleVpnConnection);
    on<HomePageLoadingEvent>(_mapHomePageLoadingEventToState);
    on<HomePageVpnStatusEvent>(_vpnStatusUpdate);

    _splashPageCarousalTimer =
        Timer.periodic(const Duration(seconds: 2), (timer) {
      if (x >= splashData.length) x = 0;
      add(HomePageLoadingEvent(x++));
    });
  }

  HomePageLoadedState? cachedLoadedState;
  int x = 0;
  Timer? _splashPageCarousalTimer;

  // String get _constructConnectionSinceString {
  //   if (_connectionTimeStopwatch == null) return '';
  //   String hr = '', sec = '', min = '';
  //   hr = _connectionTimeStopwatch!.elapsed.inHours.toString().padLeft(2, '0');
  //   min = (_connectionTimeStopwatch!.elapsed.inMinutes % 60)
  //       .toString()
  //       .padLeft(2, '0');
  //   sec = (_connectionTimeStopwatch!.elapsed.inSeconds % 60)
  //       .toString()
  //       .padLeft(2, '0');
  //   return '$hr:$min:$sec';
  // }

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
      if (event.vpnConnectionStatus == VPNConnectionStatus.connecting) {
        cachedLoadedState = cachedLoadedState!.copyWith(
          vpnConnectionStatus: event.vpnConnectionStatus,
        );
        emit(cachedLoadedState!);
        ZappVpnConnectionService.instance.connect();
      } else if (event.vpnConnectionStatus ==
          VPNConnectionStatus.notConnected) {
        ZappVpnConnectionService.instance.disconnected();
      }
    }
  }

  FutureOr<void> _vpnStatusUpdate(
      HomePageVpnStatusEvent event, Emitter<HomePageState> emit) {
    if (event.error && state is! HomePageVpnConnectionErrorState) {
      emit(const HomePageVpnConnectionErrorState());
    }
    cachedLoadedState = cachedLoadedState!.copyWith(
      connectedSinceString: event.vpnStatus?.duration ?? '',
      vpnConnectionStatus: event.vpnStatus != null
          ? VPNConnectionStatus.connected
          : VPNConnectionStatus.notConnected,
    );
    emit(cachedLoadedState!);
  }
}
