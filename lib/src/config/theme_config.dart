// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zapp_vpn/src/ui/common/zapp_color_constants.dart';
import 'package:zapp_vpn/src/ui/common/zapp_text_styles.dart';

class ThemeConfig {
  bool isDarkMode;
  late final StreamController<bool> _themeModeStreamController;
  ThemeConfig({this.isDarkMode = false}) {
    _themeModeStreamController = StreamController();
  }

  Stream<bool> get themeModeStream => _themeModeStreamController.stream;
  Sink<bool> get themeModeSink => _themeModeStreamController.sink;

  ThemeData getCurrentThemeConfig(BuildContext context) {
    return ThemeData(
      secondaryHeaderColor: isDarkMode
          ? ZappColorConstants.secondaryTextDark
          : ZappColorConstants.secondaryTextLight,
      backgroundColor: isDarkMode
          ? ZappColorConstants.backgroundDark
          : ZappColorConstants.backgroundLight,
      scaffoldBackgroundColor: isDarkMode
          ? ZappColorConstants.backgroundDark
          : ZappColorConstants.backgroundLight,
      primaryColor: isDarkMode
          ? ZappColorConstants.primaryColorDark
          : ZappColorConstants.primaryColorLight,
      iconTheme: IconThemeData(
        color: isDarkMode
            ? ZappColorConstants.primaryTextDark
            : ZappColorConstants.primaryTextLight,
      ),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: isDarkMode
                ? ZappColorConstants.primaryTextDark
                : ZappColorConstants.primaryTextLight,
            displayColor: isDarkMode
                ? ZappColorConstants.primaryTextDark
                : ZappColorConstants.primaryTextLight,
          ),
      appBarTheme: AppBarTheme(
        color: isDarkMode
            ? ZappColorConstants.backgroundDark
            : ZappColorConstants.backgroundLight,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: isDarkMode
              ? ZappColorConstants.primaryTextDark
              : ZappColorConstants.primaryTextLight,
        ),
        titleTextStyle: ZappFontStyles.custom(
          fontSize: 30,
          weight: FontWeight.bold,
          color: isDarkMode
              ? ZappColorConstants.primaryTextDark
              : ZappColorConstants.primaryTextLight,
        ),
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
