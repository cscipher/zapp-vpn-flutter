import 'package:flutter/material.dart';
import 'package:zapp_vpn/src/ui/common/zapp_asset_files.dart';
import 'package:zapp_vpn/src/ui/common/zapp_image_button.dart';
import 'package:zapp_vpn/src/ui/common/zapp_network_strength_icon_widget.dart';
import 'package:zapp_vpn/src/ui/common/zapp_text_styles.dart';
import 'package:zapp_vpn/src/utils/zapp_enums.dart';

class ServerListWidget extends StatefulWidget {
  const ServerListWidget({super.key});

  @override
  State<ServerListWidget> createState() => _ServerListWidgetState();
}

class _ServerListWidgetState extends State<ServerListWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 25,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: NetworkImage('https://picsum.photos/500'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.white,
                      width: 5,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Text('INDIA South-1', style: ZappFontStyles.bodyMediumXs()),
                const Spacer(),
                const ZappImageButton(
                  path: ZappAssetFiles.premiumCrownV2,
                  size: 30,
                ),
                const SizedBox(width: 15),
                const ZappNetworkStrengthIconWidget(
                  networkStrength: VPNServerNetworkStrength.strong,
                ),
                const SizedBox(width: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
