import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:zapp_vpn/src/ui/pages/homepage/bloc/home_page_bloc.dart';
import 'package:zapp_vpn/src/ui/pages/homepage/widgets/zapp_home_page_widgets.dart';

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

  @override
  Widget build(BuildContext context) {
    if (bloc == null) {
      bloc = Provider.of<HomePageBloc>(context);
      bloc!.add(HomePageInitialEvent());
    }
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<HomePageBloc, HomePageState>(
              bloc: bloc,
              builder: (context, state) {
                switch (state.runtimeType) {
                  case HomePageLoadedState:
                    final loadedState = state as HomePageLoadedState;
                    return Column(
                      children: [
                        ZappHomePageHeaderWidget(
                          isDarkModeEnabled: loadedState.isDarkModeEnabled,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                          child: const Placeholder(),
                        ),
                        const SizedBox(height: 50),
                        ZappHomePageConnectButtonWidget(
                          connectedSinceString:
                              loadedState.connectedSinceString,
                          isConnected: loadedState.isConnected,
                          isDarkModeEnabled: loadedState.isDarkModeEnabled,
                        ),
                        const Spacer(),
                        ZappHomePageServerSwitcherWidget(
                          isDarkModeEnabled: loadedState.isDarkModeEnabled,
                        ),
                      ],
                    );

                  default:
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                }
              },
            ),
          ),
        ));
  }
}
