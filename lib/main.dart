import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get_storage/get_storage.dart';

import 'route/fluro_router.dart';

Future<void> main() async {
  setUrlStrategy(PathUrlStrategy());
  FluroRouters.setupRouter();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  void checkLogin() {
    final box = GetStorage();
    bool loginGet = box.read('login') ?? false;
    box.write("login", loginGet);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'KsuBookStore',
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
