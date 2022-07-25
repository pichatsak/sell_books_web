// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:iconsax/iconsax.dart';
import 'package:sell_books_web/reset_passowrd.dart';
import 'package:sell_books_web/story_shop.dart';
import 'package:sell_books_web/widget/nav_widget/drawers.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';

class Account extends StatefulWidget {
  Account({Key? key}) : super(key: key);
  static const String route = '/account';

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
          child: Column(children: [
        NavMainScreen(),
        BootstrapContainer(
            fluid: false,
            decoration: BoxDecoration(color: Colors.white),
            children: <Widget>[
              BootstrapRow(
                children: <BootstrapCol>[
                  BootstrapCol(
                      //  invisibleForSizes: "sm xs md ",
                      sizes: 'col-12   col-sm-12 col-md-12 col-lg-4',
                      invisibleForSizes: "sm xs md ",
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 40, bottom: 40),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            // ignore: avoid_unnecessary_containers
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 101, 188, 231),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20)),
                                    ),
                                    height: 50,
                                    width: double.infinity,
                                    // ignore: prefer_const_constructors
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: Icon(
                                            Icons.account_circle_sharp,
                                            color: Colors.white,
                                            size: 32,
                                          ),
                                        ),
                                        // ignore: prefer_const_constructors
                                        Container(
                                          child: Text(
                                            "บัญชีของฉัน",
                                            // ignore: prefer_const_constructors
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w100,
                                                fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black12, width: 1),
                                      borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(5),
                                          bottomLeft: Radius.circular(5)),
                                    ),
                                    // ignore: avoid_unnecessary_containers
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, right: 10),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20, bottom: 20),
                                              child: InkWell(
                                                onTap: (() {}),

                                                // ignore: sized_box_for_whitespace
                                                child: Container(
                                                    child:
                                                        Text("ข้อมูลของฉัน")),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      15, 0, 15, 0),
                                              child: Container(
                                                height: 1,
                                                color: Colors.black12,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20, bottom: 20),
                                              child: InkWell(
                                                onTap: (() {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          Story_Shop.route);
                                                }),

                                                // ignore: sized_box_for_whitespace
                                                child: Container(
                                                    child: Text(
                                                        "ประวัติการสั่งซื้อ")),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      15, 0, 15, 0),
                                              child: Container(
                                                height: 1,
                                                color: Colors.black12,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20, bottom: 20),
                                              child: InkWell(
                                                onTap: (() {
                                                  Navigator.of(context)
                                                      .pushNamed(
                                                          Reset_Password.route);
                                                }),

                                                // ignore: sized_box_for_whitespace
                                                child: Container(
                                                    child: Text(
                                                        "ตั้งค่ารหัสผ่าน")),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      15, 0, 15, 0),
                                              child: Container(
                                                height: 1,
                                                color: Colors.black12,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 20, bottom: 20),
                                              child: InkWell(
                                                onTap: (() {}),

                                                // ignore: sized_box_for_whitespace
                                                child: Container(
                                                    child: Text(
                                                  "ออกจากระบบ",
                                                  style: TextStyle(
                                                      color: Colors.redAccent),
                                                )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )))),
                  BootstrapCol(
                    sizes: 'col-12 col-sm-12 col-md-12 col-lg-8',
                    child: BootstrapRow(children: <BootstrapCol>[
                      BootstrapCol(
                        invisibleForSizes: 'sm xs',
                        sizes: 'col 12',
                        child: Container(height: 20),
                      ),
                      BootstrapCol(
                        invisibleForSizes: ' lg xl',
                        sizes: 'col 12',
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 30, left: 50, right: 50),
                          child: Container(
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 71, 181, 236),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 13,
                                              right: 13,
                                              top: 10,
                                              bottom: 10),
                                          child: Row(children: [
                                            Icon(
                                              Icons.folder,
                                              color: Colors.white,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 5),
                                              child: Container(
                                                child: Text(
                                                  "ข้อมูลของฉัน",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            )
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed(Story_Shop.route);
                                      },
                                      child: Container(
                                        // decoration: BoxDecoration(
                                        //   borderRadius: BorderRadius.circular(20),
                                        //   border: Border.all(
                                        //       color: Colors.grey, width: 1),
                                        // ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          // ignore: prefer_const_literals_to_create_immutables
                                          child: Row(children: [
                                            Icon(
                                              Icons.history,
                                              color: Color.fromARGB(
                                                  255, 141, 140, 140),
                                            ),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed(Reset_Password.route);
                                      },
                                      child: Container(
                                        // decoration: BoxDecoration(
                                        //   borderRadius: BorderRadius.circular(20),
                                        //   border: Border.all(
                                        //       color: Colors.grey, width: 1),
                                        // ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          // ignore: prefer_const_literals_to_create_immutables
                                          child: Row(children: [
                                            Icon(
                                              Icons.key,
                                              color: Color.fromARGB(
                                                  255, 141, 140, 140),
                                            ),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        // decoration: BoxDecoration(
                                        //   borderRadius: BorderRadius.circular(20),
                                        //   border: Border.all(
                                        //       color: Colors.grey, width: 1),
                                        // ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                              top: 10,
                                              bottom: 10),
                                          // ignore: prefer_const_literals_to_create_immutables
                                          child: Row(children: [
                                            Icon(
                                              Icons.logout,
                                              color: Colors.redAccent,
                                            ),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                        ),
                      ),
                      BootstrapCol(
                        sizes: 'col 12 ',
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 30, right: 20, bottom: 40),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Container(
                                  child: Row(
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 101, 188, 231),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: Icon(
                                              Icons.folder,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                      AutoSizeText(
                                        'ข้อมูลของฉัน',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                        minFontSize: 17,
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              //เส้น
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: SizedBox(
                                  height: 1,
                                  width: double.infinity,
                                  child: ColoredBox(color: Colors.black12),
                                ),
                              ),

                              //รายการ1

                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: BootstrapRow(
                                  children: <BootstrapCol>[
                                    BootstrapCol(
                                        sizes: 'col-12 col-md-6',
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 20),
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: AutoSizeText(
                                                    'ชื่อ - นามสกุล',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                    minFontSize: 14,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 5,
                                                  ),
                                                  child: Container(
                                                    child: Container(
                                                      child: TextFormField(
                                                        controller:
                                                            TextEditingController()
                                                              ..text =
                                                                  'พิเชฐศักดิ์ ดุเหว่า',
                                                        cursorColor:
                                                            Colors.black,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          // focusedBorder: InputBorder.none,
                                                          // enabledBorder: InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          disabledBorder:
                                                              InputBorder.none,
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      15.0,
                                                                      18.0,
                                                                      0.0,
                                                                      10.0),

                                                          // fillColor: Color.fromARGB(31, 161, 161, 161),
                                                          // filled: true,

                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: BootstrapRow(
                                  children: <BootstrapCol>[
                                    BootstrapCol(
                                        sizes: 'col-12 col-md-6',
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 20),
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: AutoSizeText(
                                                    'เบอร์โทรศัพท์',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                    minFontSize: 14,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 5,
                                                  ),
                                                  child: Container(
                                                    child: Container(
                                                      child: TextFormField(
                                                        controller:
                                                            TextEditingController()
                                                              ..text =
                                                                  '0932430369',
                                                        cursorColor:
                                                            Colors.black,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          // focusedBorder: InputBorder.none,
                                                          // enabledBorder: InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          disabledBorder:
                                                              InputBorder.none,
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      15.0,
                                                                      18.0,
                                                                      0.0,
                                                                      10.0),

                                                          // fillColor: Color.fromARGB(31, 161, 161, 161),
                                                          // filled: true,

                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: BootstrapRow(
                                  children: <BootstrapCol>[
                                    BootstrapCol(
                                        sizes: 'col-12 col-md-6',
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 20),
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: AutoSizeText(
                                                    'อีเมล',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                    minFontSize: 14,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 5,
                                                  ),
                                                  child: Container(
                                                    child: Container(
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType
                                                                .emailAddress,
                                                        controller:
                                                            TextEditingController()
                                                              ..text =
                                                                  'sookma28@gmail.com',
                                                        cursorColor:
                                                            Colors.black,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          // focusedBorder: InputBorder.none,
                                                          // enabledBorder: InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          disabledBorder:
                                                              InputBorder.none,
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      15.0,
                                                                      18.0,
                                                                      0.0,
                                                                      10.0),

                                                          // fillColor: Color.fromARGB(31, 161, 161, 161),
                                                          // filled: true,

                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 40, left: 15, right: 15, bottom: 30),
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 260,
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 0),
                                                  child: AutoSizeText(
                                                    'บันทึกข้อมูล',
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
                                                      Icons.save_rounded,
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
                            ],
                          ),
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ])
      ])),
    );
  }
}
