import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'route/fluro_router.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  FluroRouters.setupRouter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Flutter Demo',
  //     debugShowCheckedModeBanner: false,
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: const Homepage(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Prompt',
        ),
        initialRoute: '/',
        onGenerateRoute: FluroRouters.router.generator
        // onGenerateRoute: (settings) => NavigatorRoute.route("/"),
        // routes: {
        //   Homepage.route: (context) => Homepage(),
        //   Click_List_Page.route: (context) => Click_List_Page(),
        //   Login_Page.route: (context) => Login_Page(),
        //   Registor_Page.route: (context) => Registor_Page(),
        //   Shop_List_Page.route: (context) => Shop_List_Page(),
        //   Check_Out_Page.route: (context) => Check_Out_Page(),
        //   Thankyou_Shop.route: (context) => Thankyou_Shop(),
        //   Account.route: (context) => Account(),
        //   Reset_Password.route: (context) => Reset_Password(),
        //   Story_Shop.route: (context) => Story_Shop(),
        //   Contact_US.route: (context) => Contact_US(),
        // },
        );
  }
}
