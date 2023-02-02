import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:zapp_vpn/src/ui/common/zapp_text_styles.dart';

class SpeedtestResultWidget extends StatelessWidget {
  final int downloadSpeed;
  final int uploadSpeed;
  const SpeedtestResultWidget({
    Key? key,
    required this.theme,
    required this.downloadSpeed,
    required this.uploadSpeed,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Download ', style: ZappFontStyles.bodyMediumM()),
                Icon(
                  EvaIcons.cloudDownloadOutline,
                  color: theme.primaryColor,
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                text: downloadSpeed.toString(),
                style: ZappFontStyles.custom(
                  fontSize: 30,
                  weight: FontWeight.w700,
                  color: theme.textTheme.bodyLarge!.color,
                ),
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                      text: 'Mbps',
                      style: ZappFontStyles.bodyRegularXs(
                        color: theme.secondaryHeaderColor,
                      )),
                ],
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Text('Upload ', style: ZappFontStyles.bodyMediumM()),
                Icon(
                  EvaIcons.cloudUploadOutline,
                  color: theme.primaryColor,
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                text: uploadSpeed.toString(),
                style: ZappFontStyles.custom(
                  fontSize: 30,
                  weight: FontWeight.w700,
                  color: theme.textTheme.bodyLarge!.color,
                ),
                children: [
                  const TextSpan(text: ' '),
                  TextSpan(
                      text: 'Mbps',
                      style: ZappFontStyles.bodyRegularXs(
                        color: theme.secondaryHeaderColor,
                      )),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
