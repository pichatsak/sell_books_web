// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, unnecessary_new

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sell_books_web/widget/nav_widget/drawers.dart';
import 'package:sell_books_web/widget/nav_widget/nav_desktop.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';
import 'package:sell_books_web/widget/nav_widget/nav_minimal_desktop.dart';
import 'package:sell_books_web/widget/nav_widget/nav_mobile.dart';

class Registor_Page extends StatefulWidget {
  const Registor_Page({Key? key}) : super(key: key);
  static const String route = '/registor';
  @override
  State<Registor_Page> createState() => _Registor_PageState();
}

class _Registor_PageState extends State<Registor_Page> {
  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);
    var color = Colors.transparent;

    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              //NAV_START
              NavMainScreen(),
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
                      height: 740,
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
                            //     'ดูก่อนนอน',
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
                                  'สมัครสมาชิก',
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
                                      hintText: "ชื่อ - สกุล",

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
                                          Iconsax.user,
                                          color: Colors.black,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black12, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 1),
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
                                    keyboardType: TextInputType.emailAddress,
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
                                          color:
                                              Color.fromARGB(221, 22, 22, 22),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black12, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 1),
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
                                      hintText: "เบอร์โทร",
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
                                          Icons.phone,
                                          color:
                                              Color.fromARGB(221, 22, 22, 22),
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black12, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 1),
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
                                    obscureText: true,
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
                                            color: Colors.black12, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 1),
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
                                    obscureText: true,
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      // focusedBorder: InputBorder.none,
                                      // enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      hintText: "ยืนยันรหัสผ่าน",
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
                                            color: Colors.black12, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 1),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, left: 40, right: 40),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  child: Text('ยืนยันการสมัคร'),
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
