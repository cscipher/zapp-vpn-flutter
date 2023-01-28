import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapp_vpn/src/config/theme_config.dart';
import 'package:zapp_vpn/src/ui/pages/splash_page/splash_page.dart';

class ZapVpnApp extends StatelessWidget {
  const ZapVpnApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeConfig>(create: (context) => ThemeConfig()),
      ],
      builder: (context, _) {
        return StreamBuilder<bool>(
            stream: Provider.of<ThemeConfig>(context).themeModeStream,
            builder: (context, snapshot) {
              return MaterialApp(
                title: 'Zapp Vpn',
                theme: Provider.of<ThemeConfig>(context)
                    .copyWith(isDarkMode: snapshot.data)
                    .getCurrentThemeConfig(context),
                home: const SplashPage(),
              );
            });
      },
    );
  }
}
