import 'package:flutter/material.dart';
import 'package:zapp_vpn/src/ui/common/zapp_string_constants.dart';
import 'package:zapp_vpn/src/ui/common/zapp_text_styles.dart';
import 'package:zapp_vpn/src/ui/pages/splash_page/splash_page_data.dart';

class SplashPage extends StatefulWidget {
  final int index;
  const SplashPage({required this.index, super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      body: Center(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    'https://picsum.photos/500',
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'ZAPP VPN ${ZappStringConstants.thunder}',
                  style: ZappFontStyles.bodyBoldL(color: theme.primaryColor),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100.0),
                  child: Text(
                    'World\'s fastest VPN tunnel to hide your IP & surf safely!',
                    textAlign: TextAlign.center,
                    style: ZappFontStyles.bodyRegularXs(
                      color: theme.secondaryHeaderColor,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 20,
              right: 20,
              child: Container(
                height: 230,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      splashData[widget.index]['heading']!,
                      style: ZappFontStyles.bodyMediumM(
                        color: theme.backgroundColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        splashData[widget.index]['subheading']!,
                        textAlign: TextAlign.center,
                        style: ZappFontStyles.bodyRegularXs(
                          color: theme.backgroundColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    Text(
                      '${ZappStringConstants.copyright} 2023 Cipher RJ',
                      textAlign: TextAlign.center,
                      style: ZappFontStyles.bodyRegularXs(
                        color: theme.secondaryHeaderColor,
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
