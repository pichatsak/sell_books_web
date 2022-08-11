import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:sell_books_web/account.dart';
import 'package:sell_books_web/login_page.dart';
import 'package:sell_books_web/registor_page.dart';
import 'package:sell_books_web/shop_list_page.dart';

Widget minimalDesktop(BuildContext context) {
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
                                  Navigator.of(context)
                                      .pushNamed(Account.route);
                                },
                                child: Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 0, 10, 0),
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
                                          Navigator.of(context)
                                              .pushNamed(LoginPage.route);
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
                                          Navigator.of(context)
                                              .pushNamed(RegistorPage.route);
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
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: const Text(
                                        "2000.00",
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
                            margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(Shop_List_Page.route);
                              },
                              // highlightColor: color,
                              // splashColor: color,
                              // hoverColor: color,
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
                                            children: const [
                                              Text(
                                                "12",
                                                style: TextStyle(
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
