// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sell_books_web/global.dart';
import 'package:http/http.dart' as http;

class NavMainScreen extends StatefulWidget {
  const NavMainScreen({Key? key}) : super(key: key);

  @override
  State<NavMainScreen> createState() => _NavMainScreenState();
}

class _NavMainScreenState extends State<NavMainScreen> {
  var box = GetStorage();
  bool isLoginGet = false;
  String nameUser = "";
  var formatter = NumberFormat('#,###,##0.00');
  int numCart = 0;
  int totalCart = 0;
  @override
  void initState() {
    setState(() {
      isLoginGet = box.read("login");
    });
    setShowLogin();
    getCartData();
    super.initState();
  }

  void setShowLogin() {
    if (isLoginGet) {
      nameUser = box.read("user_name");
    } else {}
  }

  void goToCart() {
    if (box.read("login")) {
      Navigator.pushNamed(context, "/cart");
    } else {
      _onErrorLogin(context);
    }
  }

  void goToAc() {
    if (box.read("login")) {
      Navigator.pushNamed(context, "/account");
    } else {
      _onErrorLogin(context);
    }
  }

  void getCartData() async {
    if (box.read("login")) {
      var url =
          "${Global.hostName}/cart_get.php?user_id=${box.read("user_id")}";
      var res = await http.get(Uri.parse(url));
      var getData = json.decode(res.body);
      setState(() {
        totalCart = getData['total_cart'];
        numCart = getData['num'];
      });
    }
  }

  @override
  void didUpdateWidget(covariant NavMainScreen oldWidget) {
    getCartData();
    super.didUpdateWidget(oldWidget);
  }

  _onErrorLogin(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      style: const AlertStyle(
        overlayColor: Color.fromARGB(113, 0, 0, 0),
      ),
      title: "ไม่สำเร็จ",
      desc: "กรุณาเข้าสู่ระบบก่อน.",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/login");
          },
          width: 120,
          child: const Text(
            "ตกลง",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1150) {
        return desktopViewGet(context);
      } else if (constraints.maxWidth >= 780 && constraints.maxWidth <= 1150) {
        return minimalDesktopView(context);
      } else {
        return mobileContentView(context);
      }
    });
  }

  int getCart() {
    return numCart++;
  }

  Widget minimalDesktopView(BuildContext context) {
    var color = Colors.transparent;
    return SingleChildScrollView(
        child: BootstrapContainer(
            fluid: true,
            padding: const EdgeInsets.only(top: 0),
            children: <Widget>[
          Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(65, 176, 231, 1),
              ),
              child: BootstrapRow(
                height: 0,
                children: <BootstrapCol>[
                  BootstrapCol(
                    sizes: 'col-3 ',
                    child: SizedBox(
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: const Icon(
                                Icons.menu,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BootstrapCol(
                    sizes: 'col-9',
                    child: SizedBox(
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    goToAc();
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 10, 0),
                                      child: const Icon(
                                        Icons.account_circle_sharp,
                                        size: 55,
                                        color: Colors.white,
                                      )),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: const Text(
                                        "ยินดีต้อนรับ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, "/login");
                                          },
                                          highlightColor: color,
                                          splashColor: color,
                                          hoverColor: color,
                                          child: const Text(
                                            "เข้าสู่ระบบ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w100),
                                          ),
                                        ),
                                        const Text(
                                          " / ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w100),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, "/register");
                                          },
                                          highlightColor: color,
                                          splashColor: color,
                                          hoverColor: color,
                                          child: const Text(
                                            "สมัครสมาชิก",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w100),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "ยอดชำระ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        child: Text(
                                          formatter.format(totalCart),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 40,
                              margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                              child: FlatButton(
                                onPressed: () {
                                  goToCart();
                                },
                                highlightColor: color,
                                splashColor: color,
                                hoverColor: color,
                                child: Stack(children: <Widget>[
                                  const Icon(
                                    Icons.shopping_cart,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                  Positioned(
                                      top: -1,
                                      right: -1,
                                      child: Stack(children: <Widget>[
                                        const Icon(
                                          Icons.brightness_1,
                                          size: 20.0,
                                          color: Colors.red,
                                        ),
                                        Positioned(
                                            child: Center(
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  numCart.toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ))
                                      ]))
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ]));
  }

  Widget desktopViewGet(BuildContext context) {
    var color = Colors.transparent;

    return BootstrapContainer(
        fluid: true,
        padding: const EdgeInsets.only(top: 0),
        children: <Widget>[
          Container(
              decoration:
                  const BoxDecoration(color: Color.fromRGBO(65, 176, 231, 1)),
              child: BootstrapRow(
                height: 0,
                children: <BootstrapCol>[
                  BootstrapCol(
                      sizes: 'col-3 ',
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 40),
                                child: SizedBox(
                                  height: 80,
                                  child: Image.asset(
                                    "images/logo1.png",
                                    width: 70,
                                    height: 50,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  BootstrapCol(
                    sizes: 'col-5 ',
                    child: (SizedBox(
                      height: 80,
                      child: Row(children: [
                        FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/");
                            },
                            highlightColor: color,
                            splashColor: color,
                            hoverColor: color,
                            child: const AutoSizeText(
                              'หน้าแรก',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100),
                              minFontSize: 15,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/how_to_buy");
                            },
                            highlightColor: color,
                            splashColor: color,
                            hoverColor: color,
                            child: const AutoSizeText(
                              'วิธีการสั่งซื้อ',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100),
                              minFontSize: 15,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/contact_us");
                            },
                            highlightColor: color,
                            splashColor: color,
                            hoverColor: color,
                            child: const AutoSizeText(
                              'ติดต่อเรา',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100),
                              minFontSize: 15,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/policy");
                            },
                            highlightColor: color,
                            splashColor: color,
                            hoverColor: color,
                            child: const AutoSizeText(
                              'นโยบายการคืนสินค้า',
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w100),
                              minFontSize: 15,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ]),
                    )),
                  ),
                  BootstrapCol(
                    sizes: 'col-4',
                    child: SizedBox(
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    goToAc();
                                  },
                                  child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0, 10, 0),
                                      child: const Icon(
                                        Icons.account_circle_sharp,
                                        size: 55,
                                        color: Colors.white,
                                      )),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: const Text(
                                        "ยินดีต้อนรับ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                    !isLoginGet
                                        ? Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context, "/login");
                                                },
                                                highlightColor: color,
                                                splashColor: color,
                                                hoverColor: color,
                                                child: const Text(
                                                  "เข้าสู่ระบบ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w100),
                                                ),
                                              ),
                                              const Text(
                                                " / ",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w100),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context, "/registor");
                                                },
                                                highlightColor: color,
                                                splashColor: color,
                                                hoverColor: color,
                                                child: const Text(
                                                  "สมัครสมาชิก",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w100),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(children: [
                                            Text(
                                              nameUser,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w100),
                                            )
                                          ]),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(40, 0, 0, 0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "ยอดชำระ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        child: Text(
                                          formatter.format(totalCart),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 60,
                              height: 40,
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: FlatButton(
                                onPressed: () {
                                  goToCart();
                                },
                                highlightColor: color,
                                splashColor: color,
                                hoverColor: color,
                                child: Stack(children: <Widget>[
                                  const Icon(
                                    Icons.shopping_cart,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                  Positioned(
                                      top: -1,
                                      right: -1,
                                      child: Stack(children: <Widget>[
                                        const Icon(
                                          Icons.brightness_1,
                                          size: 20.0,
                                          color: Colors.red,
                                        ),
                                        Positioned(
                                            child: Center(
                                          child: SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text(
                                                  numCart.toString(),
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 11,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ))
                                      ]))
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ]);
  }

  Widget mobileContentView(BuildContext context) {
    var color = Colors.transparent;

    return SingleChildScrollView(
        child: BootstrapContainer(
            fluid: true,
            padding: const EdgeInsets.only(top: 0),
            children: <Widget>[
          Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(65, 176, 231, 1),
              ),
              child: BootstrapRow(
                children: <BootstrapCol>[
                  BootstrapCol(
                    sizes: 'col-3 ',
                    child: SizedBox(
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: const Icon(
                                Icons.menu,
                                size: 35,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BootstrapCol(
                      sizes: 'col-9',
                      child: SizedBox(
                          height: 80,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FlatButton(
                                      onPressed: () {
                                        goToAc();
                                      },
                                      highlightColor: color,
                                      splashColor: color,
                                      hoverColor: color,
                                      child: Row(
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 0, 0),
                                              child: const Icon(
                                                Icons.account_circle_sharp,
                                                size: 55,
                                                color: Colors.white,
                                              )),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 80,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 0, 0, 0),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.fromLTRB(
                                                  10, 0, 0, 0),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Text(
                                                        "ยอดชำระ",
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .fromLTRB(
                                                            0, 0, 0, 0),
                                                        child: Text(
                                                          formatter.format(
                                                              totalCart),
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: 60,
                                              height: 40,
                                              margin: const EdgeInsets.fromLTRB(
                                                  0, 0, 20, 0),
                                              child: FlatButton(
                                                onPressed: () {
                                                  goToCart();
                                                },
                                                highlightColor: color,
                                                splashColor: color,
                                                hoverColor: color,
                                                child: Stack(children: <Widget>[
                                                  const Icon(
                                                    Icons.shopping_cart,
                                                    size: 40,
                                                    color: Colors.white,
                                                  ),
                                                  Positioned(
                                                      top: -1,
                                                      right: -1,
                                                      child: Stack(
                                                          children: <Widget>[
                                                            const Icon(
                                                              Icons
                                                                  .brightness_1,
                                                              size: 20.0,
                                                              color: Colors.red,
                                                            ),
                                                            Positioned(
                                                                child: Center(
                                                              child: SizedBox(
                                                                height: 20,
                                                                width: 20,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Text(
                                                                      numCart
                                                                          .toString(),
                                                                      style: const TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              11,
                                                                          fontWeight:
                                                                              FontWeight.w500),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ))
                                                          ]))
                                                ]),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ])))),
                ],
              )),
        ]));
  }
}
