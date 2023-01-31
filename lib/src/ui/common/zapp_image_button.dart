import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ZappImageButton extends StatelessWidget {
  final String path;
  final double size;
  final Function? onPressed;
  const ZappImageButton({
    required this.path,
    this.onPressed,
    this.size = 14,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed?.call(),
      child: path.contains('.svg')
          ? SvgPicture.asset(
              path,
              height: size,
              width: size,
            )
          : Image.asset(
              path,
              height: size,
              width: size,
            ),
    );
  }
}
