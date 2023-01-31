import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:zapp_vpn/src/ui/pages/homepage/bloc/home_page_bloc.dart';
import 'package:zapp_vpn/src/ui/pages/homepage/widgets/zapp_home_page_widgets.dart';
import 'package:zapp_vpn/src/ui/pages/splash_page/splash_page.dart';

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
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).viewPadding.top,
                      left: 16,
                      right: 16),
                  child: ZappHomePageHeaderWidget(
                    isDarkModeEnabled: state.isDarkModeEnabled,
                  ),
                ),
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

    return Scaffold(
        body: BlocBuilder<HomePageBloc, HomePageState>(
      bloc: Provider.of<HomePageBloc>(context),
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          child: _getPage(state, theme),
        );
      },
    ));
  }
}
