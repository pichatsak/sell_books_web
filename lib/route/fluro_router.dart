import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:sell_books_web/account.dart';
import 'package:sell_books_web/check_out_page.dart';
import 'package:sell_books_web/click_list_page.dart';
import 'package:sell_books_web/contact_us.dart';
import 'package:sell_books_web/homepage.dart';
import 'package:sell_books_web/login_page.dart';
import 'package:sell_books_web/registor_page.dart';
import 'package:sell_books_web/shop_list_page.dart';
import 'package:sell_books_web/thank_shop.dart';

class FluroRouters {
  static final FluroRouter router = FluroRouter();
  TransitionType transitionType = TransitionType.fadeIn;
  static Handler homeHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => Homepage());
  static Handler loginHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => Login_Page());
  static Handler productHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) {
    var id = params['id']?.first;
    return Click_List_Page(
      idGet: id,
    );
  });

  static Handler regisHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => Registor_Page());
  static Handler cartHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => Shop_List_Page());
  static Handler checkOutHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => Check_Out_Page());
  static Handler contactHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => Contact_US());
  static Handler acHandler =
      Handler(handlerFunc: (context, Map<String, dynamic> params) => Account());
  static Handler thankyouHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => Thankyou_Shop());
  static Handler storyBuyHandler = Handler(
      handlerFunc: (context, Map<String, dynamic> params) => Thankyou_Shop());

  static void setupRouter() {
    router.define('/',
        handler: homeHandler, transitionType: TransitionType.native);
    router.define('/login',
        handler: loginHandler, transitionType: TransitionType.native);
    router.define('/registor',
        handler: regisHandler, transitionType: TransitionType.native);
    router.define('/cart',
        handler: cartHandler, transitionType: TransitionType.native);
    router.define('/checkout',
        handler: checkOutHandler, transitionType: TransitionType.native);
    router.define('/contact_us',
        handler: contactHandler, transitionType: TransitionType.native);
    router.define('/account',
        handler: acHandler, transitionType: TransitionType.native);
    router.define('/history',
        handler: storyBuyHandler, transitionType: TransitionType.native);
    router.define('/thankyou',
        handler: thankyouHandler, transitionType: TransitionType.native);
    router.define('/product',
        handler: productHandler, transitionType: TransitionType.native);
  }
}
