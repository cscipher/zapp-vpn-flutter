import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zapp_vpn/app.dart';

final isIos = Platform.isIOS;
void main() {
  runZonedGuarded(
    () => BlocOverrides.runZoned(
      () async => runApp(const ZappVpnApp()),
      blocObserver: Bloc.observer,
    ),
    (error, stackTrace) => log("===========Exception caught============",
        error: error, stackTrace: stackTrace),
  );
}
