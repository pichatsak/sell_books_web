import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get_storage/get_storage.dart';

import 'route/fluro_router.dart';

Future<void> main() async {
  setUrlStrategy(PathUrlStrategy());
  FluroRouters.setupRouter();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
        onGenerateRoute: FluroRouters.router.generator);
  }
}
