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
  HomePageBloc? bloc;
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
      return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ZappHomePageHeaderWidget(
                isDarkModeEnabled: state.isDarkModeEnabled,
              ),
              SizedBox(
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
              const Spacer(),
              ZappHomePageServerSwitcherWidget(
                isDarkModeEnabled: state.isDarkModeEnabled,
                vpnConnectionStatus: state.vpnConnectionStatus,
              ),
            ],
          ),
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
    if (bloc == null) {
      bloc = Provider.of<HomePageBloc>(context);
      bloc!.add(HomePageInitialEvent());
    }
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: BlocBuilder<HomePageBloc, HomePageState>(
          bloc: bloc,
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              child: _getPage(state, theme),
            );
          },
        ));
  }
}
