import 'package:flutter/material.dart';
import 'package:zapp_vpn/src/utils/zapp_enums.dart';

class ZappNetworkStrengthIconWidget extends StatelessWidget {
  final VPNServerNetworkStrength networkStrength;
  const ZappNetworkStrengthIconWidget({
    required this.networkStrength,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: 8,
          width: 6,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 125, 211, 27),
          ),
        ),
        const SizedBox(width: 3.5),
        Container(
          height: 16,
          width: 6,
          decoration: BoxDecoration(
            color: (networkStrength == VPNServerNetworkStrength.normal ||
                    networkStrength == VPNServerNetworkStrength.strong)
                ? const Color.fromARGB(255, 125, 211, 27)
                : Colors.transparent,
            border: (networkStrength == VPNServerNetworkStrength.normal ||
                    networkStrength == VPNServerNetworkStrength.strong)
                ? null
                : Border.all(width: 0.3, color: Colors.black),
          ),
        ),
        const SizedBox(width: 3.5),
        Container(
          height: 24,
          width: 6,
          decoration: BoxDecoration(
            border: (networkStrength == VPNServerNetworkStrength.strong)
                ? null
                : Border.all(width: 0.3, color: Colors.black),
            color: (networkStrength == VPNServerNetworkStrength.strong)
                ? const Color.fromARGB(255, 125, 211, 27)
                : Colors.transparent,
          ),
        ),
      ],
    );
  }
}
