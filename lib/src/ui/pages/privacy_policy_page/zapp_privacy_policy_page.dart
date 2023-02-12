import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:zapp_vpn/src/ui/common/zapp_text_styles.dart';

class ZappPrivacyPolicyPage extends StatefulWidget {
  const ZappPrivacyPolicyPage({super.key});

  @override
  State<ZappPrivacyPolicyPage> createState() => _ZappPrivacyPolicyPageState();
}

class _ZappPrivacyPolicyPageState extends State<ZappPrivacyPolicyPage> {
  late final WebViewController _controller;
  bool loadComplete = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
    _controller.setNavigationDelegate(NavigationDelegate(
      onPageStarted: (url) {
        setState(() {
          loadComplete = false;
        });
      },
      onPageFinished: (url) {
        setState(() {
          loadComplete = true;
        });
      },
    ));
    _controller.loadRequest(
      Uri.parse('https://flutter.dev'),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'ZAPP VPN Privacy & Policies',
        style: ZappFontStyles.bodyMediumM(),
      )),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (!loadComplete)
            Center(
                child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            )),
        ],
      ),
    );
  }
}
