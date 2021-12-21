import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:get/get.dart';
import 'package:ssu/main_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends GetView {
  final controller = Get.put(MainController());
  Completer webController = Completer();

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();

    return Scaffold(
        body: WebView(
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (_controller) async {
        print(await _controller.currentUrl());
        webController.complete(_controller);
        // _controller.runJavascript(javaScriptString)
        // _controller.runJavascriptReturningResult(javaScriptString)
      },
      initialUrl:
          'https://smartid.ssu.ac.kr/Symtra_sso/smln.asp?apiReturnUrl=https%3A%2F%2Fsaint.ssu.ac.kr%2FwebSSO%2Fsso.jsp',
      onPageFinished: (url) async {
        if (url.contains('Symtra_sso/smln')) {
          webController.future.then((value) async {
            await value.runJavascript(
                "document.getElementById('userid').value='${controller.id.value}';");
            await value.runJavascript(
                "document.getElementById('pwd').value='${controller.pwd.value}';");
            await value.runJavascript("LoginInfoSend('LoginInfo');");
          });
        }

        if (url.contains('irj/portal')) {
          // webController.future.then((value) async {
          //   var string = await value.runJavascriptReturningResult('document.title');
          //   print(string);
          // });
          webController.future.then((value) async {
            var saint = await value.runJavascript(
                'document.getElementsByClassName("mob_gnb_list")[0].click();');

            // var saint2 = await value.runJavascript(
            //     'document.getElementsByClassName("c_m_nodeA")[43].click();');
            Future.delayed(Duration(milliseconds: 300), () async {
              await value
                  .runJavascriptReturningResult(
                      'document.getElementsByClassName("c_m_nodeA")[43].click();')
                  .then((value2) async {
                var string =
                    await value.runJavascriptReturningResult('document.title');
                print(string);
              }).then((value3) async {
                print(await value.runJavascriptReturningResult('document.getElementsByClassName("urNoUserSelect")[0].innerHTML'));
              });
            });
            // .then((value2) async {

            // });
            // return value;
            // }).then((value) => null);
            // print('string : $string');
          });
          // .then((value) async {
          //   await value.runJavascript(
          //       'document.getElementsByClassName("c_m_nodeA")[43].click();');
          //   return value;
          // }).then((value) async {
          //   await value.runJavascript(
          //       'document.getElementByName("WD0192-caption").click();');
          //   return value;
          // });
        }

        if (url.contains('irj/portal')) {
          // var string = await webController!.runJavascriptReturningResult(
          //     "document.documentElements.innerHTML");
          // print('it is : $string');
        }

        // print('url : $url');
        // console.log

        // print('it is : $string');
      },
      navigationDelegate: (navigation) {
        // print(navigation.url);
        print('url : ${navigation.url}');

        return NavigationDecision.navigate;
      },
      // ignoreSSLErrors: true,
    ));
  }
}
