import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:zapp_vpn/src/config/theme_config.dart';
import 'package:zapp_vpn/src/ui/common/zapp_asset_files.dart';
import 'package:zapp_vpn/src/ui/common/zapp_image_button.dart';
import 'package:zapp_vpn/src/ui/common/zapp_text_styles.dart';
import 'package:zapp_vpn/src/ui/pages/homepage/bloc/home_page_bloc.dart';
import 'package:zapp_vpn/src/ui/pages/homepage/widgets/zapp_home_page_drawer_widget.dart';
import 'package:zapp_vpn/src/ui/pages/homepage/widgets/zapp_home_page_widgets.dart';
import 'package:zapp_vpn/src/ui/pages/splash_page/splash_page.dart';
import 'package:zapp_vpn/src/utils/zapp_snackbar.dart';

class ZappHomePage extends StatefulWidget {
  const ZappHomePage({super.key});

  @override
  State<ZappHomePage> createState() => _ZappHomePageState();
}

class _ZappHomePageState extends State<ZappHomePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget _getPage(HomePageState state, ThemeData theme) {
    if (state is HomePageLoadingState) {
      return SplashPage(
        index: state.dataIndex,
      );
    } else if (state is HomePageLoadedState) {
      return Container(
        color: theme.backgroundColor,
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: const Placeholder(),
                ),
                const SizedBox(height: 50),
                ZappHomePageConnectButtonWidget(
                  connectedSinceString: state.connectedSinceString,
                  vpnConnectionStatus: state.vpnConnectionStatus,
                  isDarkModeEnabled: state.isDarkModeEnabled,
                ),
              ],
            ),
            ZappHomePageServerSwitcherWidget(
              isDarkModeEnabled: state.isDarkModeEnabled,
              vpnConnectionStatus: state.vpnConnectionStatus,
            ),
          ],
        ),
      );
    } else {
      return Container(
        color: theme.primaryColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = Provider.of<HomePageBloc>(context);
    final themeConfig = Provider.of<ThemeConfig>(context);

    return BlocConsumer<HomePageBloc, HomePageState>(
      bloc: bloc,
      listenWhen: (previous, current) => current is HomePageActionState,
      listener: (context, state) {
        if (state is HomePageVpnConnectionErrorState) {
          showZappSnackbar(context,
              message: 'Cannot connect at this time. Try again!');
          return;
        }
      },
      buildWhen: (previous, current) => current is! HomePageActionState,
      builder: (context, state) {
        return Scaffold(
            drawer: Drawer(
              width: 250,
              backgroundColor: theme.backgroundColor,
              child: const ZappHomePageDrawerWidget(
                userName: 'Cipher',
              ),
            ),
            appBar: (state is HomePageLoadingState)
                ? null
                : AppBar(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),
                        Text(
                          'ZAPP VPN',
                          style: ZappFontStyles.custom(
                            weight: FontWeight.w800,
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(width: 30),
                        ZappImageButton(
                            path: ZappAssetFiles.premiumCrownV2,
                            size: 30,
                            onPressed: () {
                              // todo :premium navigation
                            })
                      ],
                    ),
                  ),
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              child: _getPage(state, theme),
            ));
      },
    );
  }
}
