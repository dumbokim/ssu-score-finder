import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ssu/main_controller.dart';
import 'package:ssu/web_page.dart';

class MainPage extends GetView<MainController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('SSU 성적 확인')),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  TextField(
                    onChanged: (value) {
                      controller.id(value);
                      print(controller.id.value);
                    },
                  ),
                  TextField(
                    onChanged: (value) {
                      controller.pwd(value);
                      print(controller.pwd.value);
                    },
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(() => WebPage());
                      },
                      child: Text('로그인'),
                      style: ButtonStyle(
                          // backgroundColor: ,
                          ))
                ]))));
  }
}
