import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:zapp_vpn/src/ui/common/zapp_color_constants.dart';
import 'package:zapp_vpn/src/ui/common/zapp_text_styles.dart';
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
    return VPNConnectionStatus.connecting == widget.vpnConnectionStatus
        ? const SizedBox.shrink()
        : InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(30),
            child: Ink(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    ZappColorConstants.primaryColorLight,
                    ZappColorConstants.primaryColorLight,
                    ZappColorConstants.primaryColorDark,
                  ],
                  transform: GradientRotation(0.5),
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              width: 280,
              child: Row(
                children: [
                  Container(
                    width: 40.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage('https://picsum.photos/500'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(50.0)),
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
                  const Spacer(),
                  const Icon(
                    EvaIcons.chevronRight,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          );
  }
}
