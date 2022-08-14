import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sell_books_web/widget/nav_widget/drawers.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';

class ContactUS extends StatefulWidget {
  const ContactUS({Key? key}) : super(key: key);
  static const String route = '/contact_us';

  @override
  State<ContactUS> createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {
  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
          child: Column(children: [
        // ignore: prefer_const_constructors
        NavMainScreen(),
        BootstrapContainer(
            fluid: false,
            decoration: const BoxDecoration(color: Colors.white),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, top: 55, right: 40, bottom: 0),
                child: BootstrapRow(children: <BootstrapCol>[
                  BootstrapCol(
                      sizes: 'col-12',
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 101, 188, 231),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Icon(
                                  Icons.workspaces_outline,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const AutoSizeText(
                            'ติดต่อเรา',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                            minFontSize: 20,
                            maxLines: 1,
                          ),
                        ],
                      )),
                ]),
              )
            ]),
        BootstrapContainer(
            fluid: false,
            decoration: const BoxDecoration(color: Colors.white),
            children: <Widget>[
              BootstrapRow(
                height: MediaQuery.of(context).size.height,
                children: <BootstrapCol>[
                  BootstrapCol(
                      sizes: 'col-12',
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                        child: SizedBox(
                          height: 1,
                          width: double.infinity,
                          child: ColoredBox(color: Colors.black12),
                        ),
                      )),
                  BootstrapCol(
                      sizes: 'col-12 col-md-6 col-sm-12',
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 60, top: 30, right: 60, bottom: 40),
                        child: Column(
                          children: [
                            Row(
                              children: const [
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
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
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
                                children: const [
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
                                children: const [
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
                          ],
                        ),
                      )),
                  BootstrapCol(
                      sizes: 'col-12 col-md-6 col-sm-12',
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 60, top: 30, right: 60, bottom: 40),
                        child: Column(children: [
                          Row(
                            children: const [
                              AutoSizeText(
                                'ติดต่อเจ้าหน้าที่',
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                                minFontSize: 18,
                                maxLines: 1,
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
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
                            child: TextFormField(
                              cursorColor: Colors.black,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                isDense: true,
                                contentPadding: const EdgeInsets.fromLTRB(
                                    15.0, 18.0, 0.0, 10.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black12, width: 1),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black12, width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
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
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Colors.black,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                isDense: true,
                                contentPadding: const EdgeInsets.fromLTRB(
                                    15.0, 18.0, 0.0, 10.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black12, width: 1),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black12, width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
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
                            child: TextFormField(
                              cursorColor: Colors.black,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                isDense: true,
                                contentPadding: const EdgeInsets.fromLTRB(
                                    15.0, 18.0, 0.0, 10.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black12, width: 1),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black12, width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
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
                            child: TextFormField(
                              cursorColor: Colors.black,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                isDense: true,
                                contentPadding: const EdgeInsets.fromLTRB(
                                    15.0, 70.0, 0.0, 10.0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black12, width: 1),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black12, width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 40, left: 15, right: 15, bottom: 30),
                            child: InkWell(
                              onTap: () {},
                              child: SizedBox(
                                width: 200,
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
                                            padding: EdgeInsets.only(left: 0),
                                            child: AutoSizeText(
                                              'ส่ง',
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
                                                Icons.send,
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
                        ]),
                      )),
                ],
              ),
            ]),
      ])),
    );
  }
}
