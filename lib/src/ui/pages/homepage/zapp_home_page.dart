import 'package:flutter/material.dart';
import 'package:zapp_vpn/src/ui/pages/homepage/widgets/zapp_home_page_widgets.dart';

class ZappHomePage extends StatefulWidget {
  const ZappHomePage({super.key});

  @override
  State<ZappHomePage> createState() => _ZappHomePageState();
}

class _ZappHomePageState extends State<ZappHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: const [
              ZappHomePageHeaderWidget(),
              ZappHomePageConnectButtonWidget(),
              ZappHomePageServerSwitcherWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
