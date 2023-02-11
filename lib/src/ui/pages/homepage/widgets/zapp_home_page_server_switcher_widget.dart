import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:zapp_vpn/src/ui/common/zapp_color_constants.dart';
import 'package:zapp_vpn/src/ui/common/zapp_text_styles.dart';
import 'package:zapp_vpn/src/ui/pages/server_list_page/server_list_tile_widget.dart';
import 'package:zapp_vpn/src/utils/zapp_enums.dart';

class ZappHomePageServerSwitcherWidget extends StatefulWidget {
  final bool isDarkModeEnabled;
  final VPNConnectionStatus vpnConnectionStatus;
  const ZappHomePageServerSwitcherWidget({
    required this.isDarkModeEnabled,
    required this.vpnConnectionStatus,
    super.key,
  });

  @override
  State<ZappHomePageServerSwitcherWidget> createState() =>
      _ZappHomePageServerSwitcherWidgetState();
}

class _ZappHomePageServerSwitcherWidgetState
    extends State<ZappHomePageServerSwitcherWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: widget.vpnConnectionStatus == VPNConnectionStatus.connecting
            ? 0
            : 100,
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              builder: (context) => Container(
                decoration: BoxDecoration(
                  color: theme.backgroundColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Container(
                        width: 60,
                        height: 3,
                        decoration: BoxDecoration(
                          color: theme.secondaryHeaderColor.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const ServerListWidget(),
                  ],
                ),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                gradient: const LinearGradient(
                  colors: [
                    ZappColorConstants.primaryColorLight,
                    ZappColorConstants.primaryColorLight,
                    ZappColorConstants.primaryColorDark,
                  ],
                  transform: GradientRotation(0.5),
                ),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 10,
                    blurRadius: 35,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ]),
            child: Column(
              children: [
                const Icon(
                  EvaIcons.chevronUp,
                  size: 24,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 45.0,
                      height: 45.0,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: NetworkImage('https://picsum.photos/500'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(50.0),
                        ),
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'India South-1',
                      style: ZappFontStyles.bodyMediumS(color: Colors.white),
                    ),
                    const SizedBox(width: 50),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Center(
                    child: Container(
                      height: 3,
                      width: 100,
                      decoration: BoxDecoration(
                        color: theme.secondaryHeaderColor.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
