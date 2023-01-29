import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:zapp_vpn/src/ui/common/zapp_color_constants.dart';
import 'package:zapp_vpn/src/ui/common/zapp_text_styles.dart';

class ZappHomePageServerSwitcherWidget extends StatefulWidget {
  final bool isDarkModeEnabled;
  const ZappHomePageServerSwitcherWidget(
      {required this.isDarkModeEnabled, super.key});

  @override
  State<ZappHomePageServerSwitcherWidget> createState() =>
      _ZappHomePageServerSwitcherWidgetState();
}

class _ZappHomePageServerSwitcherWidgetState
    extends State<ZappHomePageServerSwitcherWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(30),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
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
                borderRadius: const BorderRadius.all(Radius.circular(50.0)),
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
            IconButton(
              onPressed: () {
                // todo : navigate to servers
              },
              icon: const Icon(
                EvaIcons.chevronRight,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
