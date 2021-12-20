import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends GetView {
  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

    return Scaffold(
        body: WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl:
          'https://smartid.ssu.ac.kr/Symtra_sso/smln.asp?apiReturnUrl=https%3A%2F%2Fsaint.ssu.ac.kr%2FwebSSO%2Fsso.jsp',
      // ignoreSSLErrors: true,
    ));
  }
}
