// ignore: depend_on_referenced_packages
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sell_books_web/widget/nav_widget/drawers.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';

// ignore: camel_case_types
class Contact_US extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Contact_US({Key? key}) : super(key: key);
  static const String route = '/contact_us';

  @override
  State<Contact_US> createState() => _Contact_USState();
}

// ignore: camel_case_types
class _Contact_USState extends State<Contact_US> {
  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);
    return Scaffold(
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(children: [
        NavMainScreen(),
        BootstrapContainer(
            fluid: false,
            decoration: BoxDecoration(color: Colors.white),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, top: 55, right: 40, bottom: 0),
                child: BootstrapRow(children: <BootstrapCol>[
                  BootstrapCol(
                      sizes: 'col-12',
                      child: Container(
                        child: Container(
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 101, 188, 231),
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Icon(
                                      Icons.workspaces_outline,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              AutoSizeText(
                                'ติดต่อเรา',
                                style: TextStyle(
                                    fontSize: 23, fontWeight: FontWeight.bold),
                                minFontSize: 20,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                      )),
                ]),
              )
            ]),
        BootstrapContainer(
            fluid: false,
            decoration: BoxDecoration(color: Colors.white),
            children: <Widget>[
              BootstrapRow(
                children: <BootstrapCol>[
                  BootstrapCol(
                      sizes: 'col-12',
                      child: Container(
                        child: //เส้น
                            Padding(
                          padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                          child: SizedBox(
                            height: 1,
                            width: double.infinity,
                            child: ColoredBox(color: Colors.black12),
                          ),
                        ),
                      )),
                  BootstrapCol(
                      sizes: 'col-12 col-md-6 col-sm-12',
                      child: Container(
                          child: Padding(
                        padding: const EdgeInsets.only(
                            left: 60, top: 30, right: 60, bottom: 40),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                AutoSizeText(
                                  'ช่องทางการติดต่อ',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                  minFontSize: 18,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                child: AutoSizeText(
                                  '8 ซอย 48 แยก 13 ถนนเพชรเกษม แขวงบางด้วน เขตภาษีเจริญ กรุงเทพมหานคร 10160',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  minFontSize: 15,
                                ),
                              ),
                            ),
                            // Row(
                            //   // ignore: prefer_const_literals_to_create_immutables
                            //   children: [
                            //     AutoSizeText(
                            //       'เขตภาษีเจริญ กรุงเทพมหานคร 10160',
                            //       style: TextStyle(
                            //         fontSize: 16,
                            //       ),
                            //       minFontSize: 15,
                            //       maxLines: 1,
                            //     ),
                            //   ],
                            // ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  AutoSizeText(
                                    'เบอร์โทรศัพท์ : 099-999-9999',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                    minFontSize: 15,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Row(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  AutoSizeText(
                                    'ช่องทางการติดตาม',
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                    minFontSize: 18,
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Container(
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {},
                                      child: SvgPicture.asset(
                                        "images/line.svg",
                                        width: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, right: 12),
                                      child: InkWell(
                                        onTap: () {},
                                        child: SvgPicture.asset(
                                          "images/facebook.svg",
                                          width: 30,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: SvgPicture.asset(
                                        "images/instagram.svg",
                                        width: 30,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: InkWell(
                                        onTap: () {},
                                        child: SvgPicture.asset(
                                          "images/twitter.svg",
                                          width: 30,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))),
                  BootstrapCol(
                      sizes: 'col-12 col-md-6 col-sm-12',
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 60, top: 30, right: 60, bottom: 40),
                          child: Column(children: [
                            Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                AutoSizeText(
                                  'ติดต่อเจ้าหน้าที่',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                  minFontSize: 18,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                width: double.infinity,
                                child: AutoSizeText(
                                  'ชื่อ - นามสกุล',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  minFontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                              ),
                              child: Container(
                                child: Container(
                                  child: TextFormField(
                                    controller: TextEditingController()
                                      ..text = 'พิเชฐศักดิ์ ดุเหว่า',
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      // focusedBorder: InputBorder.none,
                                      // enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          15.0, 18.0, 0.0, 10.0),

                                      // fillColor: Color.fromARGB(31, 161, 161, 161),
                                      // filled: true,

                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black12, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 1),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                width: double.infinity,
                                child: AutoSizeText(
                                  'อีเมล',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  minFontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                              ),
                              child: Container(
                                child: Container(
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: TextEditingController()
                                      ..text = 'sookma28@gmail.com',
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      // focusedBorder: InputBorder.none,
                                      // enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          15.0, 18.0, 0.0, 10.0),

                                      // fillColor: Color.fromARGB(31, 161, 161, 161),
                                      // filled: true,

                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black12, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 1),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                width: double.infinity,
                                child: AutoSizeText(
                                  'เบอร์โทรศัพท์',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  minFontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                              ),
                              child: Container(
                                child: Container(
                                  child: TextFormField(
                                    controller: TextEditingController()
                                      ..text = '0932430369',
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      // focusedBorder: InputBorder.none,
                                      // enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          15.0, 18.0, 0.0, 10.0),

                                      // fillColor: Color.fromARGB(31, 161, 161, 161),
                                      // filled: true,

                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black12, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 1),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SizedBox(
                                width: double.infinity,
                                child: AutoSizeText(
                                  'รายละเอียด',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  minFontSize: 14,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 5,
                              ),
                              child: Container(
                                child: Container(
                                  child: TextFormField(
                                    cursorColor: Colors.black,
                                    style: TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      // focusedBorder: InputBorder.none,
                                      // enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.fromLTRB(
                                          15.0, 70.0, 0.0, 10.0),

                                      // fillColor: Color.fromARGB(31, 161, 161, 161),
                                      // filled: true,

                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.black12, width: 1),
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black12, width: 1),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 40, left: 15, right: 15, bottom: 30),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 200,
                                  child: Card(
                                    shadowColor: Colors.black,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    clipBehavior: Clip.antiAlias,
                                    child: Container(
                                      // decoration: BoxDecoration(
                                      color: Colors.blue,
                                      //     borderRadius:
                                      //         BorderRadius.circular(32),
                                      //     boxShadow: [
                                      //       BoxShadow(
                                      //           blurRadius: 0,
                                      //           color: Color.fromARGB(
                                      //                   255, 29, 29, 29)
                                      //               .withOpacity(.0),
                                      //           offset: Offset(0, 0))
                                      //     ]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(13.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 0),
                                                child: AutoSizeText(
                                                  'ส่ง',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                  minFontSize: 14,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Icon(
                                                    Iconsax.message,
                                                    color: Colors.white,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]),
                        ),
                      )),
                ],
              ),
            ]),
      ])),
    );
  }
}
