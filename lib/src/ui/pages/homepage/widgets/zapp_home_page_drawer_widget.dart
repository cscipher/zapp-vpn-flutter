import 'dart:io';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zapp_vpn/src/config/theme_config.dart';
import 'package:zapp_vpn/src/ui/common/zapp_asset_files.dart';
import 'package:zapp_vpn/src/ui/common/zapp_image_button.dart';
import 'package:zapp_vpn/src/ui/common/zapp_navigation_routes.dart';
import 'package:zapp_vpn/src/ui/common/zapp_string_constants.dart';
import 'package:zapp_vpn/src/ui/common/zapp_text_styles.dart';
import 'package:zapp_vpn/src/ui/pages/homepage/bloc/home_page_bloc.dart';
import 'package:zapp_vpn/src/utils/zapp_navigation_util.dart';

class ZappHomePageDrawerWidget extends StatefulWidget {
  final String userName;
  const ZappHomePageDrawerWidget({required this.userName, super.key});

  @override
  State<ZappHomePageDrawerWidget> createState() =>
      _ZappHomePageDrawerWidgetState();
}

class _ZappHomePageDrawerWidgetState extends State<ZappHomePageDrawerWidget> {
  Widget _getDrawerItem({
    required String label,
    IconData? iconData,
    Color? iconColor,
    String? path,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: Theme.of(context).primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 40),
            iconData != null
                ? Icon(
                    iconData,
                    size: 20,
                    color: iconColor ?? Theme.of(context).primaryColor,
                  )
                : path != null
                    ? ZappImageButton(path: path, size: 20)
                    : const SizedBox.shrink(),
            const SizedBox(width: 5),
            Text(
              label,
              style: ZappFontStyles.bodyRegularXs(),
            ),
            const SizedBox(width: 30),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeConfig = Provider.of<ThemeConfig>(context);
    final homeBloc = Provider.of<HomePageBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Spacer(),
        CircleAvatar(
          radius: 60,
          backgroundColor: theme.primaryColor,
          backgroundImage: const NetworkImage('https://picsum.photos/500'),
        ),
        const SizedBox(height: 10),
        Text(
          'Hey, ${widget.userName}! 👋🏻',
          style: ZappFontStyles.bodyBoldM(),
        ),
        const SizedBox(height: 40),
        _getDrawerItem(
          onTap: () {},
          label: 'Get Premium',
          path: ZappAssetFiles.premiumCrownV2,
        ),
        _getDrawerItem(
          onTap: () {
            Navigator.pop(context);
            ZappNavigate.to(context, ZappNavigationRoutes.speedtestPage);
          },
          label: 'Speed Test',
          iconData: EvaIcons.cloudUploadOutline,
        ),
        _getDrawerItem(
          onTap: () {
            Navigator.pop(context);
            ZappNavigate.to(context, ZappNavigationRoutes.privacyPolicyPage);
          },
          label: 'Privacy Policy',
          iconData: EvaIcons.infoOutline,
        ),
        _getDrawerItem(
          onTap: () {
            Share.share(
              'Check out this best VPN app! ${ZappStringConstants.thunder}',
              subject: 'ZAPP VPN! ${ZappStringConstants.thunder}',
            );
          },
          label: 'Share App',
          iconData: EvaIcons.shareOutline,
        ),
        _getDrawerItem(
          onTap: () {
            if (Platform.isAndroid || Platform.isIOS) {
              final appId = Platform.isAndroid
                  ? 'YOUR_ANDROID_PACKAGE_ID'
                  : 'YOUR_IOS_APP_ID';
              final url = Uri.parse(
                Platform.isAndroid
                    ? "market://details?id=$appId"
                    : "https://apps.apple.com/app/id$appId",
              );
              launchUrl(
                url,
                mode: LaunchMode.externalApplication,
              );
            }
          },
          label: 'Rate us',
          iconData: EvaIcons.starOutline,
        ),
        _getDrawerItem(
          onTap: () {
            homeBloc.add(
              HomePageToggleDarkModeEvent(
                  updateTheme: themeConfig.themeModeSink.add),
            );
          },
          label: 'Switch theme',
          iconData: themeConfig.isDarkMode ? EvaIcons.sun : EvaIcons.moon,
          iconColor: themeConfig.isDarkMode
              ? const Color.fromARGB(255, 255, 179, 0)
              : const Color.fromARGB(255, 2, 5, 29),
        ),
        const Spacer(),
        const Placeholder(
          fallbackHeight: 120,
          // fallbackWidth: 100,
        ),
        const Spacer(),
      ],
    );
  }
}
