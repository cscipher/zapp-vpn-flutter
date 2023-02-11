import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zapp_vpn/app.dart';
import 'package:zapp_vpn/src/config/zapp_vpn_config.dart';

final isIos = Platform.isIOS;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ZappVpnApp());
}
