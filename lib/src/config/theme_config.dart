// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zapp_vpn/src/ui/common/colors.dart';

class ThemeConfig {
  final bool isDarkMode;
  late final StreamController<bool> _themeModeStreamController;
  ThemeConfig({this.isDarkMode = false}) {
    _themeModeStreamController = StreamController();
  }

  Stream<bool> get themeModeStream => _themeModeStreamController.stream;
  Sink<bool> get themeModeSink => _themeModeStreamController.sink;

  ThemeData getCurrentThemeConfig(BuildContext context) {
    return ThemeData(
      backgroundColor: isDarkMode
          ? ColorConstants.backgroundDark
          : ColorConstants.backgroundLight,
      scaffoldBackgroundColor: isDarkMode
          ? ColorConstants.backgroundDark
          : ColorConstants.backgroundLight,
      primaryColor: ColorConstants.primarySwatch,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: isDarkMode
                ? ColorConstants.primaryTextDark
                : ColorConstants.primaryTextLight,
            displayColor: isDarkMode
                ? ColorConstants.primaryTextDark
                : ColorConstants.primaryTextLight,
          ),
    );
  }

  ThemeConfig copyWith({
    bool? isDarkMode,
  }) {
    return ThemeConfig(
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
