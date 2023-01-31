import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class ZappThemeModeSwitchWidget extends StatefulWidget {
  final bool isDarkModeEnabled;
  final Function onPressed;
  const ZappThemeModeSwitchWidget({
    required this.isDarkModeEnabled,
    required this.onPressed,
    super.key,
  });

  @override
  State<ZappThemeModeSwitchWidget> createState() =>
      _ZappThemeModeSwitchWidgetState();
}

class _ZappThemeModeSwitchWidgetState extends State<ZappThemeModeSwitchWidget>
    with SingleTickerProviderStateMixin {
  late bool tapped;
  final Duration _animatedDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    tapped = widget.isDarkModeEnabled;
  }

  Widget _toggleTop(ThemeData theme) => AnimatedContainer(
        duration: _animatedDuration,
        width: 22,
        height: 22,
        decoration: BoxDecoration(
          color: tapped
              ? const Color.fromARGB(255, 255, 179, 0)
              : const Color.fromARGB(255, 2, 5, 29),
          borderRadius: BorderRadius.circular(100),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
        onTap: () {
          setState(() {
            tapped = !tapped;
          });
          widget.onPressed.call();
        },
        child: Stack(
          children: [
            AnimatedContainer(
              duration: _animatedDuration,
              width: 42,
              height: 22,
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(color: theme.textTheme.bodyLarge!.color!),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment:
                    tapped ? MainAxisAlignment.start : MainAxisAlignment.end,
                children: [
                  Icon(
                    tapped ? EvaIcons.sun : EvaIcons.moon,
                    color: tapped
                        ? const Color.fromARGB(255, 255, 179, 0)
                        : const Color.fromARGB(255, 2, 5, 29),
                    size: 12,
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: _animatedDuration,
              curve: Curves.fastOutSlowIn,
              right: !tapped ? 20 : 0,
              left: tapped ? 20 : 0,
              child: _toggleTop(theme),
            )
          ],
        ));
  }
}
