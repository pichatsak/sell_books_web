import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sell_books_web/account.dart';
import 'package:sell_books_web/global.dart';
import 'package:sell_books_web/shop_list_page.dart';
import 'package:sell_books_web/widget/nav_widget/nav_minimal_desktop.dart';
import 'package:http/http.dart' as http;

class NavMainScreen extends StatefulWidget {
  NavMainScreen({Key? key}) : super(key: key);

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
      style: AlertStyle(
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
          child: Text(
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
        return minimal_desktopView(context);
      } else {
        return mobileContentView(context);
      }
    });
  }

  int getCart() {
    return numCart++;
  }

  Widget minimal_desktopView(BuildContext context) {
    var color = Colors.transparent;
    return SingleChildScrollView(
        // ignore: duplicate_ignore
        child: BootstrapContainer(
            fluid: true,
            // ignore: prefer_const_constructors
            padding: const EdgeInsets.only(top: 0),
            children: <Widget>[
          Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(65, 176, 231, 1),
              ),
              child: BootstrapRow(
                height: 0,
                children: <BootstrapCol>[
                  BootstrapCol(
                    sizes: 'col-3 ',
                    // ignore: prefer_const_constructors
                    child: Container(
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Container(
                                // ignore: deprecated_member_use
                                child: InkWell(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              child: Icon(
                                Icons.menu,
                                size: 35,
                                color: Colors.white,
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BootstrapCol(
                    sizes: 'col-9',
                    // ignore: prefer_const_constructors
                    child:
                        // ignore: sized_box_for_whitespace
                        Container(
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              // ignore: deprecated_member_use
                              child: // ignore: deprecated_member_use
                                  // ignore: sort_child_properties_last, prefer_const_constructors
                                  Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      goToAc();
                                    },
                                    child: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(0, 0, 10, 0),
                                        // ignore: prefer_const_constructors
                                        child: Icon(
                                          Icons.account_circle_sharp,
                                          size: 55,
                                          color: Colors.white,
                                        )),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      // ignore: prefer_const_constructors
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: Text(
                                          "ยินดีต้อนรับ",
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                      // ignore: prefer_const_constructors, avoid_unnecessary_containers
                                      Row(
                                        children: [
                                          Container(
                                              // ignore: prefer_const_constructors
                                              // ignore: prefer_const_constructors, deprecated_member_use
                                              child: InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, "/login");
                                            },
                                            highlightColor: color,
                                            splashColor: color,
                                            hoverColor: color,
                                            child: Text(
                                              "เข้าสู่ระบบ",
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w100),
                                            ),
                                          )),
                                          Container(
                                            // ignore: prefer_const_constructors
                                            // ignore: prefer_const_constructors
                                            child: Text(
                                              " / ",
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w100),
                                            ),
                                          ),
                                          Container(
                                              // ignore: prefer_const_constructors
                                              // ignore: prefer_const_constructors, deprecated_member_use
                                              child: InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, "/register");
                                            },
                                            highlightColor: color,
                                            splashColor: color,
                                            hoverColor: color,
                                            child: Text(
                                              "สมัครสมาชิก",
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w100),
                                            ),
                                          )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      // ignore: prefer_const_constructors
                                      Text(
                                        "ยอดชำระ",
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                      // ignore: prefer_const_constructors, avoid_unnecessary_containers
                                      Container(
                                        // ignore: prefer_const_constructors
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        // ignore: prefer_const_constructors
                                        child: Text(
                                          formatter.format(totalCart),
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
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
                              margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
                              // ignore: deprecated_member_use
                              child: FlatButton(
                                onPressed: () {
                                  goToCart();
                                },
                                highlightColor: color,
                                splashColor: color,
                                hoverColor: color,

                                // ignore: prefer_const_constructors
                                // ignore: unnecessary_new
                                child: new Stack(children: <Widget>[
                                  Icon(
                                    Icons.shopping_cart,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                  // ignore: unnecessary_new
                                  new Positioned(
                                      top: -1,
                                      right: -1,
                                      // ignore: unnecessary_new
                                      child: new Stack(children: <Widget>[
                                        // ignore: unnecessary_new
                                        new Icon(
                                          Icons.brightness_1,
                                          size: 20.0,
                                          color: Colors.red,
                                        ),
                                        // ignore: unnecessary_new
                                        new Positioned(
                                            // ignore: unnecessary_new
                                            child: new Center(
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                new Text(
                                                  numCart.toString(),
                                                  style: new TextStyle(
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
        // ignore: prefer_const_constructors
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
                      // ignore: prefer_const_constructors
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
                    // ignore: sized_box_for_whitespace
                    child: (Container(
                      height: 80,
                      child: Row(children: [
                        // ignore: deprecated_member_use
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
                        // ignore: deprecated_member_use
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
                        // ignore: deprecated_member_use
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
                        // ignore: deprecated_member_use
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
                    // ignore: prefer_const_constructors
                    child:
                        // ignore: sized_box_for_whitespace
                        Container(
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
                                      // ignore: prefer_const_constructors
                                      child: Icon(
                                        Icons.account_circle_sharp,
                                        size: 55,
                                        color: Colors.white,
                                      )),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    // ignore: prefer_const_constructors
                                    Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: const Text(
                                        "ยินดีต้อนรับ",
                                        // ignore: prefer_const_constructors
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
                                                  // ignore: prefer_const_constructors
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w100),
                                                ),
                                              ),
                                              const Text(
                                                " / ",
                                                // ignore: prefer_const_constructors
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
                                                  // ignore: prefer_const_constructors
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
                                              // ignore: prefer_const_constructors
                                              style: TextStyle(
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
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      // ignore: prefer_const_constructors
                                      Text(
                                        "ยอดชำระ",
                                        // ignore: prefer_const_constructors
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                      // ignore: prefer_const_constructors, avoid_unnecessary_containers
                                      Container(
                                        // ignore: prefer_const_constructors
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        // ignore: prefer_const_constructors
                                        child: Text(
                                          formatter.format(totalCart),
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
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
                              // ignore: deprecated_member_use
                              child: FlatButton(
                                onPressed: () {
                                  goToCart();
                                },
                                highlightColor: color,
                                splashColor: color,
                                hoverColor: color,

                                // ignore: prefer_const_constructors
                                // ignore: unnecessary_new
                                child: Stack(children: <Widget>[
                                  const Icon(
                                    Icons.shopping_cart,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                  // ignore: unnecessary_new
                                  Positioned(
                                      top: -1,
                                      right: -1,
                                      // ignore: unnecessary_new
                                      child: Stack(children: <Widget>[
                                        // ignore: unnecessary_new
                                        const Icon(
                                          Icons.brightness_1,
                                          size: 20.0,
                                          color: Colors.red,
                                        ),
                                        // ignore: unnecessary_new
                                        Positioned(
                                            // ignore: unnecessary_new
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
                                                // ignore: unnecessary_new
                                                Text(
                                                  numCart.toString(),
                                                  // ignore: unnecessary_new
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
            // ignore: prefer_const_constructors
            padding: const EdgeInsets.only(top: 0),
            children: <Widget>[
          Container(
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                // ignore: prefer_const_constructors
                color: Color.fromRGBO(65, 176, 231, 1),
              ),
              child: BootstrapRow(
                children: <BootstrapCol>[
                  BootstrapCol(
                    sizes: 'col-3 ',
                    // ignore: prefer_const_constructors, sized_box_for_whitespace
                    child: Container(
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            // ignore: avoid_unnecessary_containers
                            Container(
                                // ignore: deprecated_member_use
                                child: InkWell(
                              onTap: () {
                                Scaffold.of(context).openDrawer();
                              },
                              // ignore: prefer_const_constructors
                              child: Icon(
                                Icons.menu,
                                size: 35,
                                color: Colors.white,
                              ),
                            )),
                          ],
                        ),
                      ),
                    ),
                  ),
                  BootstrapCol(
                      sizes: 'col-9',
                      // ignore: prefer_const_constructors
                      child: Container(
                          height: 80,
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      // ignore: deprecated_member_use
                                      child: FlatButton(
                                        onPressed: () {
                                          goToAc();
                                        },
                                        highlightColor: color,
                                        splashColor: color,
                                        hoverColor: color,

                                        // ignore: sort_child_properties_last, prefer_const_constructors
                                        child: Row(
                                          children: [
                                            Container(
                                                // ignore: prefer_const_constructors
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 0, 0, 0),
                                                // ignore: prefer_const_constructors
                                                child: Icon(
                                                  Icons.account_circle_sharp,
                                                  size: 55,
                                                  color: Colors.white,
                                                )),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                // ignore: prefer_const_constructors
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    // ignore: sized_box_for_whitespace
                                    Container(
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
                                              // ignore: prefer_const_constructors
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 0, 0, 0),
                                              child: Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      // ignore: prefer_const_constructors
                                                      Text(
                                                        "ยอดชำระ",
                                                        // ignore: prefer_const_constructors
                                                        style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      // ignore: prefer_const_constructors, avoid_unnecessary_containers
                                                      Container(
                                                        // ignore: prefer_const_constructors
                                                        margin:
                                                            // ignore: prefer_const_constructors
                                                            EdgeInsets.fromLTRB(
                                                                0, 0, 0, 0),
                                                        // ignore: prefer_const_constructors
                                                        child: Text(
                                                          formatter.format(
                                                              totalCart),
                                                          // ignore: prefer_const_constructors
                                                          style: TextStyle(
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
                                              // ignore: prefer_const_constructors
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 20, 0),
                                              // ignore: deprecated_member_use
                                              child: FlatButton(
                                                onPressed: () {
                                                  goToCart();
                                                },
                                                highlightColor: color,
                                                splashColor: color,
                                                hoverColor: color,

                                                // ignore: prefer_const_constructors
                                                // ignore: unnecessary_new
                                                child: new Stack(
                                                    children: <Widget>[
                                                      // ignore: prefer_const_constructors
                                                      Icon(
                                                        Icons.shopping_cart,
                                                        size: 40,
                                                        color: Colors.white,
                                                      ),
                                                      // ignore: unnecessary_new
                                                      new Positioned(
                                                          top: -1,
                                                          right: -1,
                                                          // ignore: unnecessary_new
                                                          child: new Stack(
                                                              children: <
                                                                  Widget>[
                                                                // ignore: prefer_const_constructors
                                                                // ignore: unnecessary_new
                                                                // ignore: prefer_const_constructors
                                                                // ignore: unnecessary_new
                                                                // ignore: prefer_const_constructors
                                                                // ignore: unnecessary_new
                                                                // ignore: prefer_const_constructors
                                                                // ignore: unnecessary_new
                                                                new Icon(
                                                                  Icons
                                                                      .brightness_1,
                                                                  size: 20.0,
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                                // ignore: unnecessary_new
                                                                new Positioned(
                                                                    // ignore: unnecessary_new
                                                                    child:
                                                                        // ignore: unnecessary_new
                                                                        new Center(
                                                                  child:
                                                                      Container(
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
                                                                        // ignore: unnecessary_new
                                                                        new Text(
                                                                          numCart
                                                                              .toString(),
                                                                          // ignore: prefer_const_constructors
                                                                          // ignore: unnecessary_new
                                                                          // ignore: prefer_const_constructors
                                                                          // ignore: unnecessary_new
                                                                          // ignore: prefer_const_constructors
                                                                          style: new TextStyle(
                                                                              color: Colors.white,
                                                                              fontSize: 11,
                                                                              fontWeight: FontWeight.w500),
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
