import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:sell_books_web/click_list_page.dart';
import 'package:sell_books_web/homepage.dart';
import 'package:sell_books_web/login_page.dart';

class FluroRouters {
  static final FluroRouter router = FluroRouter();
  TransitionType transitionType = TransitionType.fadeIn;
  static Handler homeHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => Homepage());
  static Handler loginHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => Login_Page());
  // static Handler productHandler = Handler(
  //     handlerFunc: (context, Map<String, dynamic> params) => Click_List_Page());
  static Handler productHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    var id = params['id']?.first;
    return Click_List_Page(
      idGet: id,
    );
  });

  static void setupRouter() {
    router.define('/',
        handler: homeHandler, transitionType: TransitionType.native);
    router.define('/login',
        handler: loginHandler, transitionType: TransitionType.native);
    router.define('/product',
        handler: productHandler, transitionType: TransitionType.native);
  }
}
