import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get_storage/get_storage.dart';

import 'package:sell_books_web/global.dart';
import 'package:sell_books_web/reset_passowrd.dart';
import 'package:sell_books_web/story_shop.dart';
import 'package:sell_books_web/widget/nav_widget/drawers.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';
import 'package:http/http.dart' as http;

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);
  static const String route = '/account';

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final box = GetStorage();
  String nameuser = "";
  String emailuser = "";
  String phoneuser = "";
  @override
  void initState() {
    getUserProfile();
    super.initState();
  }

  void getUserProfile() async {
    var url =
        "${Global.hostName}/user_by_id.php?user_id=${box.read("user_id")}";
    var res = await http.get(Uri.parse(url));
    await json.decode(res.body)['data'].map((data) {
      nameuser = data["user_name"];
      emailuser = data["user_email"];
      phoneuser = data["user_phone"];
    }).toList();
    setState(() {});
  }

  void goLogOut() {
    box.write("login", false);

    Navigator.pushNamed(context, "/");
  }

  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
          child: Column(children: [
        const NavMainScreen(),
        BootstrapContainer(
            fluid: false,
            decoration: const BoxDecoration(color: Colors.white),
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
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 101, 188, 231),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(20),
                                        topLeft: Radius.circular(20)),
                                  ),
                                  height: 50,
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.account_circle_sharp,
                                          color: Colors.white,
                                          size: 32,
                                        ),
                                      ),
                                      Text(
                                        "บัญชีของฉัน",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100,
                                            fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black12, width: 1),
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(5),
                                        bottomLeft: Radius.circular(5)),
                                  ),
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
                                            child: const Text("ข้อมูลของฉัน"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
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
                                                  .pushNamed(StoryShop.route);
                                            }),
                                            child: const Text(
                                                "ประวัติการสั่งซื้อ"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
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
                                              Navigator.of(context).pushNamed(
                                                  ResetPassword.route);
                                            }),
                                            child:
                                                const Text("ตั้งค่ารหัสผ่าน"),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
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
                                            onTap: () {
                                              goLogOut();
                                            },
                                            child: const Text(
                                              "ออกจากระบบ",
                                              style: TextStyle(
                                                  color: Colors.redAccent),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
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
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 71, 181, 236),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 13,
                                          right: 13,
                                          top: 10,
                                          bottom: 10),
                                      child: Row(children: const [
                                        Icon(
                                          Icons.folder,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 5),
                                          child: Text(
                                            "ข้อมูลของฉัน",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white),
                                          ),
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(StoryShop.route);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    child: Row(children: const [
                                      Icon(
                                        Icons.history,
                                        color:
                                            Color.fromARGB(255, 141, 140, 140),
                                      ),
                                    ]),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(ResetPassword.route);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    child: Row(children: const [
                                      Icon(
                                        Icons.key,
                                        color:
                                            Color.fromARGB(255, 141, 140, 140),
                                      ),
                                    ]),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    child: Row(children: const [
                                      Icon(
                                        Icons.logout,
                                        color: Colors.redAccent,
                                      ),
                                    ]),
                                  ),
                                )
                              ]),
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
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 101, 188, 231),
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.all(7.0),
                                          child: Icon(
                                            Icons.folder,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const AutoSizeText(
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

                              //เส้น
                              const Padding(
                                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, bottom: 20),
                                          child: Column(
                                            children: [
                                              const SizedBox(
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
                                                padding: const EdgeInsets.only(
                                                  top: 5,
                                                ),
                                                child: TextFormField(
                                                  controller:
                                                      TextEditingController()
                                                        ..text = nameuser,
                                                  cursorColor: Colors.black,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    isDense: true,
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .fromLTRB(15.0,
                                                            18.0, 0.0, 10.0),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .black12,
                                                              width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .black12,
                                                              width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
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
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, bottom: 20),
                                          child: Column(
                                            children: [
                                              const SizedBox(
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
                                                padding: const EdgeInsets.only(
                                                  top: 5,
                                                ),
                                                child: TextFormField(
                                                  controller:
                                                      TextEditingController()
                                                        ..text = phoneuser,
                                                  cursorColor: Colors.black,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    isDense: true,
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .fromLTRB(15.0,
                                                            18.0, 0.0, 10.0),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .black12,
                                                              width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .black12,
                                                              width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
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
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, bottom: 20),
                                          child: Column(
                                            children: [
                                              const SizedBox(
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
                                                padding: const EdgeInsets.only(
                                                  top: 5,
                                                ),
                                                child: TextFormField(
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  controller:
                                                      TextEditingController()
                                                        ..text = emailuser,
                                                  cursorColor: Colors.black,
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    isDense: true,
                                                    contentPadding:
                                                        const EdgeInsets
                                                                .fromLTRB(15.0,
                                                            18.0, 0.0, 10.0),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .black12,
                                                              width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Colors
                                                                  .black12,
                                                              width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
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
                                  child: SizedBox(
                                    width: 260,
                                    child: Card(
                                      shadowColor: Colors.black,
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child: Container(
                                        color: Colors.blue,
                                        child: Padding(
                                          padding: const EdgeInsets.all(13.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 0),
                                                child: AutoSizeText(
                                                  'บันทึกข้อมูล',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                  minFontSize: 14,
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 10),
                                                  child: Icon(
                                                    Icons.save_rounded,
                                                    color: Colors.white,
                                                  )),
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
