import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:zapp_vpn/src/config/theme_config.dart';
import 'package:zapp_vpn/src/ui/common/zapp_navigation_routes.dart';
import 'package:zapp_vpn/src/ui/pages/homepage/bloc/home_page_bloc.dart';
import 'package:zapp_vpn/src/ui/pages/homepage/zapp_home_page.dart';
import 'package:zapp_vpn/src/ui/pages/privacy_policy_page/zapp_privacy_policy_page.dart';
import 'package:zapp_vpn/src/ui/pages/speedtest_page/zapp_speedtest_page.dart';

class ZappVpnApp extends StatelessWidget {
  const ZappVpnApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeConfig>(create: (context) => ThemeConfig()),
        BlocProvider<HomePageBloc>(create: (context) => HomePageBloc()),
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
                  routes: {
                    ZappNavigationRoutes.speedtestPage: (context) =>
                        const ZappSpeedTestPage(),
                    ZappNavigationRoutes.homepage: (context) =>
                        const ZappHomePage(),
                    ZappNavigationRoutes.privacyPolicyPage: (context) =>
                        const ZappPrivacyPolicyPage(),
                  },
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
