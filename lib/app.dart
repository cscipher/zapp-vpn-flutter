import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zapp_vpn/src/config/theme_config.dart';
import 'package:zapp_vpn/src/ui/pages/homepage/zapp_home_page.dart';

class ZapVpnApp extends StatelessWidget {
  const ZapVpnApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeConfig>(create: (context) => ThemeConfig()),
      ],
      builder: (context, _) {
        final themeConfig = Provider.of<ThemeConfig>(context);
        return StreamBuilder<bool>(
            stream: Provider.of<ThemeConfig>(context).themeModeStream,
            builder: (context, snapshot) {
              themeConfig.isDarkMode = snapshot.data ?? false;
              return AnnotatedRegion<SystemUiOverlayStyle>(
                value: themeConfig.isDarkMode
                    ? SystemUiOverlayStyle.light
                    : SystemUiOverlayStyle.dark,
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Zapp Vpn',
                  theme: themeConfig.getCurrentThemeConfig(context),
                  home: const ZappHomePage(),
                ),
              );
            });
      },
    );
  }
}
