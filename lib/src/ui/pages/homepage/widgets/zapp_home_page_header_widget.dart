import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapp_vpn/src/config/theme_config.dart';
import 'package:zapp_vpn/src/ui/common/zapp_text_styles.dart';

class ZappHomePageHeaderWidget extends StatefulWidget {
  const ZappHomePageHeaderWidget({super.key});

  @override
  State<ZappHomePageHeaderWidget> createState() =>
      _ZappHomePageHeaderWidgetState();
}

class _ZappHomePageHeaderWidgetState extends State<ZappHomePageHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    final themeConfig = Provider.of<ThemeConfig>(context);
    bool toggle = themeConfig.isDarkMode;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            //todo : drawer opening
          },
          icon: const Icon(EvaIcons.menu2Outline),
        ),
        Text(
          'ZAPP VPN',
          style: ZappFontStyles.bodyMediumS(),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                themeConfig.themeModeSink.add(toggle);
              },
              icon: Icon(
                toggle ? EvaIcons.toggleLeft : EvaIcons.toggleRight,
              ),
            ),
          ],
        )
      ],
    );
  }
}
