import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:zapp_vpn/src/ui/common/zapp_asset_files.dart';
import 'package:zapp_vpn/src/ui/common/zapp_color_constants.dart';
import 'package:zapp_vpn/src/ui/common/zapp_text_styles.dart';
import 'package:zapp_vpn/src/ui/pages/homepage/bloc/home_page_bloc.dart';
import 'package:zapp_vpn/src/utils/zapp_enums.dart';

class ZappHomePageConnectButtonWidget extends StatefulWidget {
  final bool isDarkModeEnabled;
  final VPNConnectionStatus vpnConnectionStatus;
  final String connectedSinceString;

  const ZappHomePageConnectButtonWidget({
    required this.isDarkModeEnabled,
    required this.vpnConnectionStatus,
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

  bool get isConnected =>
      widget.vpnConnectionStatus == VPNConnectionStatus.connected;

  bool get isNotConnected =>
      widget.vpnConnectionStatus == VPNConnectionStatus.notConnected;

  bool get isConnecting =>
      widget.vpnConnectionStatus == VPNConnectionStatus.connecting;

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
              if (isNotConnected) {
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

    return AbsorbPointer(
      absorbing: isConnecting,
      child: GestureDetector(
        onTap: () {
          if (isNotConnected) {
            controller.reset();
            bloc.add(
              const HomePageToggleConnectionEvent(
                  VPNConnectionStatus.connecting),
            );
          } else {
            controller.forward();
            bloc.add(
              const HomePageToggleConnectionEvent(
                  VPNConnectionStatus.notConnected),
            );
          }
        },
        // borderRadius: BorderRadius.circular(200),
        child: Align(
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    child: Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: theme.primaryColor
                                .withOpacity(fadeInOutAnimation.value),
                            spreadRadius: widget.isDarkModeEnabled ? 2 : 5,
                            blurRadius: 30,
                          ),
                        ],
                        gradient: const LinearGradient(
                          colors: [
                            ZappColorConstants.primaryColorLight,
                            ZappColorConstants.primaryColorLight,
                            ZappColorConstants.primaryColorDark,
                          ],
                          transform: GradientRotation(0.7),
                        ),
                        borderRadius: BorderRadius.circular(200),
                      ),
                      padding: const EdgeInsets.all(50),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: isConnected ? 140 : 110,
                            child: !isConnecting
                                ? Image.asset(
                                    ZappAssetFiles.thunder,
                                  )
                                : Lottie.network(
                                    ZappAssetFiles.thunderLottie,
                                  ),
                          ),
                          const SizedBox(height: 10),
                          if (isNotConnected || isConnecting)
                            FittedBox(
                              child: Text(
                                isConnecting
                                    ? 'CONNECTING...'
                                    : 'TAP TO CONNECT',
                                style: ZappFontStyles.bodyMediumS(
                                    color: Colors.white),
                              ),
                            )
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isConnected,
                    child: Align(
                      child: Lottie.network(
                        ZappAssetFiles.bolt,
                        height: 250,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isConnected,
                    child: Align(
                      child: Transform.rotate(
                        angle: 1.78,
                        child: Lottie.network(
                          ZappAssetFiles.bolt,
                          height: 250,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              if (isConnected)
                Text(
                  'Connected',
                  style: ZappFontStyles.bodyRegularS(
                      color: theme.secondaryHeaderColor),
                ),
              if (isConnected)
                Text(
                  widget.connectedSinceString, //widget.connectedSinceString,
                  style: ZappFontStyles.bodyBoldL(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
