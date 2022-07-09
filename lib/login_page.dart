// ignore_for_file: avoid_unnecessary_containers, unused_local_variable, camel_case_types, implementation_imports, unnecessary_import, prefer_const_constructors, sort_child_properties_last, unnecessary_new

import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sell_books_web/widget/nav_widget/nav_desktop.dart';
import 'package:sell_books_web/widget/nav_widget/nav_minimal_desktop.dart';
import 'package:sell_books_web/widget/nav_widget/nav_mobile.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({Key? key}) : super(key: key);
  static const String route = '/login';
  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);
    var color = Colors.transparent;
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //NAV_START
              LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth > 1150) {
                  return desktopView(context);
                } else if (constraints.maxWidth >= 780 &&
                    constraints.maxWidth <= 1150) {
                  return minimal_desktop(context);
                } else {
                  return mobileView(context);
                }
              }),
              //NAV_END
              //BODY_START
              Container(
                transform: Matrix4.translationValues(0.0, -40.0, 0.0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 450,
                      height: 650,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xFFF7F7F7),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1,
                                color: Color.fromARGB(255, 29, 29, 29)
                                    .withOpacity(.30),
                                offset: Offset(.0, 0))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/logo.png", width: 230),
                            // SizedBox(
                            //   child: AutoSizeText(
                            //     'Ksu store',
                            //     style: TextStyle(
                            //         fontSize: 26, fontWeight: FontWeight.w600),
                            //     minFontSize: 25,
                            //     maxLines: 1,
                            //   ),
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: SizedBox(
                                child: AutoSizeText(
                                  'ลงชื่อเพื่อเข้าใช้',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  minFontSize: 15,
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, left: 40, right: 40),
                              child: Container(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: TextFormField(
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      // focusedBorder: InputBorder.none,
                                      // enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: "อีเมล",

                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w100),
                                      // fillColor: Color.fromARGB(31, 161, 161, 161),
                                      // filled: true,
                                      prefixIcon: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(20, 0, 15, 0),
                                        child: Icon(
                                          Icons.alternate_email,
                                          color: Color.fromARGB(221, 22, 22, 22),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black26, width: 0),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 0),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 40, right: 40),
                              child: Container(
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: TextFormField(
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      // focusedBorder: InputBorder.none,
                                      // enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: "รหัสผ่าน",
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w100),
                                      // fillColor: Color.fromARGB(31, 161, 161, 161),
                                      // filled: true,
                                      prefixIcon: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(20, 0, 15, 0),
                                        child: Icon(
                                          Iconsax.key_square,
                                          color: Colors.black,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black26, width: 0),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black26, width: 0),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 13, left: 40, right: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  SizedBox(
                                    child: AutoSizeText(
                                      'ลืมรหัสผ่าน?',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                      minFontSize: 14,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, left: 40, right: 40),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  child: Text('เข้าสู่ระบบ'),
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 60, vertical: 25),
                                    textStyle: TextStyle(
                                      fontSize: 16,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(30.0),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //BODY_END

              //FOOTING_START

              //FOOTING_END
            ],
          ),
        ),
      ),
    );
  }
}
