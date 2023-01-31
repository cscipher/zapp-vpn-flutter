import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapp_vpn/src/config/theme_config.dart';
import 'package:zapp_vpn/src/ui/common/zapp_asset_files.dart';
import 'package:zapp_vpn/src/ui/common/zapp_image_button.dart';
import 'package:zapp_vpn/src/ui/common/zapp_text_styles.dart';
import 'package:zapp_vpn/src/ui/common/zapp_theme_mode_switch_widget.dart';
import 'package:zapp_vpn/src/ui/pages/homepage/bloc/home_page_bloc.dart';

class ZappHomePageHeaderWidget extends StatefulWidget {
  final bool isDarkModeEnabled;

  const ZappHomePageHeaderWidget({required this.isDarkModeEnabled, super.key});

  @override
  State<ZappHomePageHeaderWidget> createState() =>
      _ZappHomePageHeaderWidgetState();
}

class _ZappHomePageHeaderWidgetState extends State<ZappHomePageHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<HomePageBloc>(context);
    final themeConfig = Provider.of<ThemeConfig>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            //todo : drawer opening
          },
          icon: const Icon(EvaIcons.menu2Outline),
        ),
        const Spacer(),
        Text(
          'ZAPP VPN',
          style: ZappFontStyles.bodyBoldS(),
        ),
        const Spacer(),
        ZappThemeModeSwitchWidget(
          isDarkModeEnabled: widget.isDarkModeEnabled,
          onPressed: () {
            bloc.add(HomePageToggleDarkModeEvent(
              updateTheme: themeConfig.themeModeSink.add,
            ));
          },
        ),
        const SizedBox(width: 10),
        // IconButton(
        //   onPressed: () {
        //     bloc.add(HomePageToggleDarkModeEvent(
        //       updateTheme: themeConfig.themeModeSink.add,
        //     ));
        //   },
        //   icon: Icon(
        //     widget.isDarkModeEnabled
        //         ? EvaIcons.toggleRight
        //         : EvaIcons.toggleLeft,
        //     size: 30,
        //   ),
        // ),
        ZappImageButton(
            path: ZappAssetFiles.premiumCrownV2,
            size: 22,
            onPressed: () {
              // todo :premium navigation
            })
      ],
    );
  }
}
