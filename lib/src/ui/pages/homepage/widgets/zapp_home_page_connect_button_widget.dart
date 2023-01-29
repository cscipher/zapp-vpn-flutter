import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zapp_vpn/src/ui/common/zapp_asset_files.dart';
import 'package:zapp_vpn/src/ui/common/zapp_color_constants.dart';
import 'package:zapp_vpn/src/ui/common/zapp_text_styles.dart';
import 'package:zapp_vpn/src/ui/pages/homepage/bloc/home_page_bloc.dart';

class ZappHomePageConnectButtonWidget extends StatefulWidget {
  final bool isDarkModeEnabled;
  final bool isConnected;
  final String connectedSinceString;

  const ZappHomePageConnectButtonWidget({
    required this.isDarkModeEnabled,
    required this.isConnected,
    required this.connectedSinceString,
    super.key,
  });

  @override
  State<ZappHomePageConnectButtonWidget> createState() =>
      _ZappHomePageConnectButtonWidgetState();
}

class _ZappHomePageConnectButtonWidgetState
    extends State<ZappHomePageConnectButtonWidget>
    with SingleTickerProviderStateMixin {
  late final Animation fadeInOutAnimation;
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));
    fadeInOutAnimation =
        Tween<double>(begin: 0, end: widget.isDarkModeEnabled ? 0.3 : 0.8)
            .animate(controller)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              if (!widget.isConnected) {
                controller.forward();
              }
            }
          });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = Provider.of<HomePageBloc>(context);

    return GestureDetector(
      onTap: () {
        if (!widget.isConnected) {
          controller.reset();
        } else {
          controller.forward();
        }
        bloc.add(HomePageToggleConnectionEvent(!widget.isConnected));
      },
      // borderRadius: BorderRadius.circular(200),
      child: Column(
        children: [
          Container(
            height: 220,
            width: 220,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color:
                      theme.primaryColor.withOpacity(fadeInOutAnimation.value),
                  spreadRadius: widget.isDarkModeEnabled ? 2 : 5,
                  blurRadius: 30,
                ),
              ],
              gradient: LinearGradient(
                colors: [
                  (widget.isDarkModeEnabled
                      ? ZappColorConstants.primaryColorDark
                      : ZappColorConstants.primaryColorLight),
                  (widget.isDarkModeEnabled
                      ? ZappColorConstants.primaryColorDark
                      : ZappColorConstants.primaryColorLight),
                  (!widget.isDarkModeEnabled
                      ? ZappColorConstants.primaryColorDark
                      : ZappColorConstants.primaryColorLight),
                ],
                transform: const GradientRotation(0.5),
              ),
              borderRadius: BorderRadius.circular(200),
            ),
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  ZappAssetFiles.premiumCrownV2,
                  height: 90,
                  width: 90,
                ),
                // SizedBox(
                //   height: 90,
                //   chipld: Lottie.asset(
                //     ZappAssetFiles.thumderLottie,
                //     animate: !widget.isConnected,
                //   ),
                // ),
                const SizedBox(height: 10),
                if (!widget.isConnected)
                  FittedBox(
                    child: Text(
                      'TAP TO CONNECT',
                      style: ZappFontStyles.bodyMediumS(color: Colors.white),
                    ),
                  )
              ],
            ),
          ),
          const SizedBox(height: 25),
          if (widget.isConnected)
            Text(
              'Connected',
              style: ZappFontStyles.bodyRegularS(),
            ),
          if (widget.isConnected)
            Text(
              '00:12:44', //widget.connectedSinceString,
              style: ZappFontStyles.bodyMediumL(),
            ),
        ],
      ),
    );
  }
}
