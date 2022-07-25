// ignore_for_file: unnecessary_const, deprecated_member_use, unused_local_variable, avoid_unnecessary_containers, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:pager/pager.dart';
import 'package:sell_books_web/button_dropdown/category_mobile.dart';
import 'package:sell_books_web/click_list_page.dart';
import 'package:sell_books_web/reset_passowrd.dart';
import 'package:sell_books_web/widget/nav_widget/drawers.dart';
import 'package:sell_books_web/widget/nav_widget/nav_desktop.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';
import 'package:sell_books_web/widget/nav_widget/nav_minimal_desktop.dart';
import 'package:sell_books_web/widget/nav_widget/nav_mobile.dart';
import 'button_dropdown/button_dropdown.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  static const String route = '/';
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String namemenu1 = "วิทยาศาตร์";
  int posView = 1;
  var color = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);

    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        // ignore: avoid_unnecessary_containers
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  //NAV_START
                  NavMainScreen(),
                  //NAV_END
                  //BODY_START
                  BootstrapContainer(
                      fluid: false,
                      decoration: BoxDecoration(color: Colors.white),
                      children: <Widget>[
                        BootstrapRow(children: <BootstrapCol>[
                          BootstrapCol(
                              invisibleForSizes: "sm xs ",
                              sizes: 'col-3',
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 15, 0, 7),
                                // ignore: avoid_unnecessary_containers
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 101, 188, 231),
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
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Icon(
                                                Icons.category,
                                                color: Colors.white,
                                              ),
                                            ),
                                            // ignore: prefer_const_constructors
                                            Container(
                                              child: Text(
                                                "หมวดหมู่",
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
                                                Container(
                                                    height: 55,
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        // ignore: prefer_const_literals_to_create_immutables
                                                        children: [
                                                          // ignore: prefer_const_constructors

                                                          ListTile(
                                                            title: InkWell(
                                                              onTap: () {},
                                                              child: Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                'ออกแบบระบบไฟฟ้า',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                softWrap: true,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ),
                                                          ),
                                                        ])),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          15, 0, 15, 0),
                                                  child: Container(
                                                    height: 1,
                                                    color: Colors.black12,
                                                  ),
                                                ),
                                                Container(
                                                    height: 55,
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        // ignore: prefer_const_literals_to_create_immutables
                                                        children: [
                                                          // ignore: prefer_const_constructors

                                                          ListTile(
                                                            title: InkWell(
                                                              onTap: () {},
                                                              child: Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                'ดาราศาสตร์',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                softWrap: true,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ),
                                                          ),
                                                        ])),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          15, 0, 15, 0),
                                                  child: Container(
                                                    height: 1,
                                                    color: Colors.black12,
                                                  ),
                                                ),
                                                Container(
                                                    height: 55,
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        // ignore: prefer_const_literals_to_create_immutables
                                                        children: [
                                                          // ignore: prefer_const_constructors

                                                          ListTile(
                                                            title: InkWell(
                                                              onTap: () {},
                                                              child: Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                'วิทยาศาสตร์',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                softWrap: true,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ),
                                                          ),
                                                        ])),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          15, 0, 15, 0),
                                                  child: Container(
                                                    height: 1,
                                                    color: Colors.black12,
                                                  ),
                                                ),
                                                Container(
                                                    height: 55,
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        // ignore: prefer_const_literals_to_create_immutables
                                                        children: [
                                                          // ignore: prefer_const_constructors

                                                          ListTile(
                                                            title: InkWell(
                                                              onTap: () {},
                                                              child: Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                'สิ่งแวดล้อม',
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                softWrap: true,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        14),
                                                              ),
                                                            ),
                                                          ),
                                                        ])),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          BootstrapCol(
                            sizes: 'col-12 col-sm-12 col-md-9',
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(27.5, 15, 27.5, 0),
                              child: Container(
                                child: Center(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                31, 161, 161, 161),
                                            borderRadius:
                                                BorderRadius.circular(32),
                                          ),
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                20, 0, 0, 0),
                                            child: TextFormField(
                                              cursorColor: Colors.black,
                                              style: TextStyle(
                                                  color: Colors.black),
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                hintText:
                                                    "ค้นหาสินค้าที่ต้องการ",

                                                hintStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w100),
                                                // fillColor: Color.fromARGB(31, 161, 161, 161),
                                                // filled: true,
                                                suffixIcon: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0, 0, 10, 0),
                                                  child: IconButton(
                                                    onPressed: () {},
                                                    highlightColor: color,
                                                    splashColor: color,
                                                    hoverColor: color,
                                                    icon: Icon(
                                                      Icons.search,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                ),
                                                // focusedBorder: UnderlineInputBorder(
                                                //   borderSide: const BorderSide( width: 0),
                                                //   borderRadius: BorderRadius.circular(30.0),
                                                // ),
                                                // enabledBorder: UnderlineInputBorder(
                                                //   borderSide: BorderSide( width: 0),
                                                //   borderRadius: BorderRadius.circular(30),
                                                // ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      BootstrapRow(children: <BootstrapCol>[
                                        BootstrapCol(
                                          invisibleForSizes: "md lg xl",
                                          sizes: 'col-12',
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 0),
                                            child: Container(
                                              width: double.infinity,
                                              // ignore: prefer_const_literals_to_create_immutables
                                              child: Column(children: <Widget>[
                                                Card(
                                                  shadowColor: Colors.black,
                                                  elevation: 2,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  clipBehavior: Clip.antiAlias,
                                                  margin: EdgeInsets.zero,
                                                  child: Theme(
                                                    data: Theme.of(context)
                                                        .copyWith(
                                                            dividerColor: Colors
                                                                .transparent),
                                                    child: const ExpansionTile(
                                                      leading: Icon(
                                                        Icons.category,
                                                        size: 20,
                                                        color: Colors.white,
                                                      ),
                                                      iconColor: Colors.white,
                                                      backgroundColor:
                                                          Color.fromARGB(255,
                                                              101, 188, 231),
                                                      maintainState: true,
                                                      title: Text(
                                                        'หมวดหมู่',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Colors.white),
                                                      ),

                                                      collapsedIconColor:
                                                          Colors.white,
                                                      collapsedBackgroundColor:
                                                          Color.fromARGB(255,
                                                              101, 188, 231),

                                                      // subtitle: Text(
                                                      //     'Trailing expansion arrow icon'),
                                                      children: <Widget>[
                                                        ListTile(
                                                          title: Text(
                                                            'ออกแบบระบบไฟฟ้า',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                        ListTile(
                                                            title: Text(
                                                          'ดาราศาสตร์',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )),
                                                        ListTile(
                                                            title: Text(
                                                          'วิทยาศาสตร์',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )),
                                                        ListTile(
                                                            title: Text(
                                                          'สิ่งแวดล้อม',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                            ),
                                          ),
                                        )
                                      ]),

                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Container(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: 115,
                                                  child: button_dropdown(),
                                                ),
                                                Container(
                                                  child: Row(children: [
                                                    Container(
                                                      height: 40,
                                                      decoration: posView == 0
                                                          ? BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      31,
                                                                      122,
                                                                      122,
                                                                      122),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          32),
                                                            )
                                                          : null,
                                                      child: IconButton(
                                                        onPressed: (() {
                                                          setState(() {
                                                            posView = 0;
                                                          });
                                                        }),
                                                        highlightColor: color,
                                                        splashColor: color,
                                                        hoverColor: color,
                                                        icon: Icon(Icons
                                                            .apps_outlined),
                                                        color: Color.fromRGBO(
                                                            65, 176, 231, 1),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 25,
                                                      width: 1,
                                                      color: Colors.grey,
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              10, 0, 10, 0),
                                                    ),
                                                    Container(
                                                      height: 40,
                                                      decoration: posView == 1
                                                          ? BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      31,
                                                                      122,
                                                                      122,
                                                                      122),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          32),
                                                            )
                                                          : null,
                                                      child: IconButton(
                                                        onPressed: (() {
                                                          setState(() {
                                                            posView = 1;
                                                          });
                                                        }),
                                                        highlightColor: color,
                                                        splashColor: color,
                                                        hoverColor: color,
                                                        icon: Icon(Icons.menu),
                                                        color: Color.fromRGBO(
                                                            65, 176, 231, 1),
                                                      ),
                                                    ),
                                                  ]),
                                                ),
                                              ]),
                                        ),
                                      ),
                                      posView == 1
                                          ? getListData()
                                          : getGroupData()
                                      //ในกรอบข้อมูล
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ])
                      ]),
                  //BODY_END
                  //FOOTING_START
                  // ignore: prefer_const_constructors

                  //FOOTING_END
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getGroupData() {
    return Column(
      children: [
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ///บรรทัด1
        BootstrapRow(children: <BootstrapCol>[
          BootstrapCol(
              sizes: 'col-6 col-sm-6 col-md-4',
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Container(
                          child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Click_List_Page.route);
                        },
                        child: Image.asset("images/book.jpg",
                            fit: BoxFit.cover, width: 200, height: 280),
                      )),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Click_List_Page.route);
                        },
                        child: AutoSizeText(
                          'การออกแบบระบบไฟฟ้า : Electrical System Design',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w600),
                          minFontSize: 18,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: AutoSizeText(
                            'มีเนื้อหาครบถ้วนตามหลักสูตรของวิชา Electrical System Design ของสภาวิศวกร ซึ่งจะใช้ในการสอบเพื่อขอใบอนุญาตประกอบวิชาชีพไฟฟ้ากำลังชั้นภาคี ตั้งแต่ปี พ.ศ. 2552',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 104, 104, 104),
                                fontWeight: FontWeight.w100),
                            minFontSize: 14,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: AutoSizeText(
                          'ผู้เขียน ประสิทธิ์ พิทยพัฒน์',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                          minFontSize: 14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: AutoSizeText(
                        '475.00 บาท',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        minFontSize: 14,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart),
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            "เพิ่มลงตะกร้า",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
                          ),
                        )),
                  )
                ],
              )),
          BootstrapCol(
              sizes: 'col-6 col-sm-6 col-md-4',
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Container(
                          child: Image.asset("images/book1.jpg",
                              fit: BoxFit.cover, width: 200, height: 280)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Click_List_Page.route);
                        },
                        child: AutoSizeText(
                          'การออกแบบระบบไฟฟ้า : Electrical System Design',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w600),
                          minFontSize: 18,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: AutoSizeText(
                            'มีเนื้อหาครบถ้วนตามหลักสูตรของวิชา Electrical System Design ของสภาวิศวกร ซึ่งจะใช้ในการสอบเพื่อขอใบอนุญาตประกอบวิชาชีพไฟฟ้ากำลังชั้นภาคี ตั้งแต่ปี พ.ศ. 2552',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 104, 104, 104),
                                fontWeight: FontWeight.w100),
                            minFontSize: 14,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: AutoSizeText(
                          'ผู้เขียน ประสิทธิ์ พิทยพัฒน์',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                          minFontSize: 14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: AutoSizeText(
                        '475.00 บาท',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        minFontSize: 14,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart),
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            "เพิ่มลงตะกร้า",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
                          ),
                        )),
                  )
                ],
              )),
          BootstrapCol(
              sizes: 'col-6 col-sm-6 col-md-4',
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Container(
                          child: Image.asset("images/book2.jpg",
                              fit: BoxFit.cover, width: 200, height: 280)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Click_List_Page.route);
                        },
                        child: AutoSizeText(
                          'การออกแบบระบบไฟฟ้า : Electrical System Design',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w600),
                          minFontSize: 18,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: AutoSizeText(
                            'มีเนื้อหาครบถ้วนตามหลักสูตรของวิชา Electrical System Design ของสภาวิศวกร ซึ่งจะใช้ในการสอบเพื่อขอใบอนุญาตประกอบวิชาชีพไฟฟ้ากำลังชั้นภาคี ตั้งแต่ปี พ.ศ. 2552',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 104, 104, 104),
                                fontWeight: FontWeight.w100),
                            minFontSize: 14,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: AutoSizeText(
                          'ผู้เขียน ประสิทธิ์ พิทยพัฒน์',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                          minFontSize: 14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: AutoSizeText(
                        '475.00 บาท',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        minFontSize: 14,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart),
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            "เพิ่มลงตะกร้า",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
                          ),
                        )),
                  )
                ],
              )),
          BootstrapCol(
              sizes: 'col-6 col-sm-6 col-md-4',
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Container(
                          child: Image.asset("images/book3.jpg",
                              fit: BoxFit.cover, width: 200, height: 280)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Click_List_Page.route);
                        },
                        child: AutoSizeText(
                          'การออกแบบระบบไฟฟ้า : Electrical System Design',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w600),
                          minFontSize: 18,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: AutoSizeText(
                            'มีเนื้อหาครบถ้วนตามหลักสูตรของวิชา Electrical System Design ของสภาวิศวกร ซึ่งจะใช้ในการสอบเพื่อขอใบอนุญาตประกอบวิชาชีพไฟฟ้ากำลังชั้นภาคี ตั้งแต่ปี พ.ศ. 2552',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 104, 104, 104),
                                fontWeight: FontWeight.w100),
                            minFontSize: 14,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: AutoSizeText(
                          'ผู้เขียน ประสิทธิ์ พิทยพัฒน์',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                          minFontSize: 14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: AutoSizeText(
                        '475.00 บาท',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        minFontSize: 14,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart),
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            "เพิ่มลงตะกร้า",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
                          ),
                        )),
                  )
                ],
              )),
          BootstrapCol(
              sizes: 'col-6 col-sm-6 col-md-4',
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Container(
                          child: Image.asset("images/book4.jpg",
                              fit: BoxFit.cover, width: 200, height: 280)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Click_List_Page.route);
                        },
                        child: AutoSizeText(
                          'การออกแบบระบบไฟฟ้า : Electrical System Design',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w600),
                          minFontSize: 18,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: AutoSizeText(
                            'มีเนื้อหาครบถ้วนตามหลักสูตรของวิชา Electrical System Design ของสภาวิศวกร ซึ่งจะใช้ในการสอบเพื่อขอใบอนุญาตประกอบวิชาชีพไฟฟ้ากำลังชั้นภาคี ตั้งแต่ปี พ.ศ. 2552',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 104, 104, 104),
                                fontWeight: FontWeight.w100),
                            minFontSize: 14,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: AutoSizeText(
                          'ผู้เขียน ประสิทธิ์ พิทยพัฒน์',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                          minFontSize: 14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: AutoSizeText(
                        '475.00 บาท',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        minFontSize: 14,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart),
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            "เพิ่มลงตะกร้า",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
                          ),
                        )),
                  )
                ],
              )),
          BootstrapCol(
              sizes: 'col-6 col-sm-6 col-md-4',
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Container(
                          child: Image.asset("images/book5.jpg",
                              fit: BoxFit.cover, width: 200, height: 280)),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Click_List_Page.route);
                        },
                        child: AutoSizeText(
                          'การออกแบบระบบไฟฟ้า : Electrical System Design',
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w600),
                          minFontSize: 18,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: AutoSizeText(
                            'มีเนื้อหาครบถ้วนตามหลักสูตรของวิชา Electrical System Design ของสภาวิศวกร ซึ่งจะใช้ในการสอบเพื่อขอใบอนุญาตประกอบวิชาชีพไฟฟ้ากำลังชั้นภาคี ตั้งแต่ปี พ.ศ. 2552',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 104, 104, 104),
                                fontWeight: FontWeight.w100),
                            minFontSize: 14,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: AutoSizeText(
                          'ผู้เขียน ประสิทธิ์ พิทยพัฒน์',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                          minFontSize: 14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: AutoSizeText(
                        '475.00 บาท',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        minFontSize: 14,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart),
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            "เพิ่มลงตะกร้า",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
                          ),
                        )),
                  )
                ],
              )),
        ]),

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        SizedBox(
          height: 50,
        ),

        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 0.5),
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),

        Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Pager(
                currentPage: 1,
                totalPages: 3,
                onPageChanged: (page) {},
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }

  Widget getListData() {
    return Column(
      children: [
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ///บรรทัด1
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: BootstrapRow(
            children: <BootstrapCol>[
              BootstrapCol(
                  sizes: 'col-4 ',
                  child: Column(
                    children: [
                      BootstrapRow(children: <BootstrapCol>[
                        BootstrapCol(
                          invisibleForSizes: " lg xl ",
                          sizes: 'col-12',
                          child: Center(
                            child: Container(

                                // color:
                                //     Color.fromARGB(31, 117, 117, 117),

                                child: InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Click_List_Page.route);
                              },
                              child: Image.asset("images/book.jpg",
                                  fit: BoxFit.cover, width: 200, height: 210),
                            )),
                          ),
                        )
                      ]),
                      BootstrapRow(children: <BootstrapCol>[
                        BootstrapCol(
                          invisibleForSizes: " md sm xs",
                          sizes: 'col-12',
                          child: Center(
                            child: Container(

                                // color:
                                //     Color.fromARGB(31, 117, 117, 117),

                                child: InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(Click_List_Page.route);
                              },
                              child: Image.asset("images/book.jpg",
                                  fit: BoxFit.cover, width: 200, height: 280),
                            )),
                          ),
                        )
                      ]),
                    ],
                  )),
              BootstrapCol(
                  sizes: 'col-8',
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(Click_List_Page.route);
                            },
                            child: AutoSizeText(
                              'การออกแบบระบบไฟฟ้า : Electrical System Design',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600),
                              minFontSize: 18,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: AutoSizeText(
                                  'มีเนื้อหาครบถ้วนตามหลักสูตรของวิชา Electrical System Design ของสภาวิศวกร ซึ่งจะใช้ในการสอบเพื่อขอใบอนุญาตประกอบวิชาชีพไฟฟ้ากำลังชั้นภาคี ตั้งแต่ปี พ.ศ. 2552',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 104, 104, 104),
                                      fontWeight: FontWeight.w100),
                                  minFontSize: 14,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: AutoSizeText(
                                'ผู้เขียน ประสิทธิ์ พิทยพัฒน์',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                                minFontSize: 14,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: AutoSizeText(
                                '475.00 บาท',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                                minFontSize: 14,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: Icon(Icons.shopping_cart),
                                    label: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 10),
                                      child: Text(
                                        "เพิ่มลงตะกร้า",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w100),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ///บรรทัด2
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: BootstrapRow(
            children: <BootstrapCol>[
              BootstrapCol(
                  sizes: 'col-4 ',
                  child: Column(
                    children: [
                      BootstrapRow(children: <BootstrapCol>[
                        BootstrapCol(
                          invisibleForSizes: " lg xl ",
                          sizes: 'col-12',
                          child: Center(
                            child: Container(
                                color: Colors.blue,

                                // color:
                                //     Color.fromARGB(31, 117, 117, 117),

                                child: Image.asset("images/book1.jpg",
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 210)),
                          ),
                        )
                      ]),
                      BootstrapRow(children: <BootstrapCol>[
                        BootstrapCol(
                          invisibleForSizes: " md sm xs",
                          sizes: 'col-12',
                          child: Center(
                            child: Container(
                                color: Colors.blue,

                                // color:
                                //     Color.fromARGB(31, 117, 117, 117),

                                child: Image.asset("images/book1.jpg",
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 280)),
                          ),
                        )
                      ]),
                    ],
                  )),
              BootstrapCol(
                  sizes: 'col-8',
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(Click_List_Page.route);
                            },
                            child: AutoSizeText(
                              'การออกแบบระบบไฟฟ้า : Electrical System Design',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600),
                              minFontSize: 18,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: AutoSizeText(
                                  'มีเนื้อหาครบถ้วนตามหลักสูตรของวิชา Electrical System Design ของสภาวิศวกร ซึ่งจะใช้ในการสอบเพื่อขอใบอนุญาตประกอบวิชาชีพไฟฟ้ากำลังชั้นภาคี ตั้งแต่ปี พ.ศ. 2552',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 104, 104, 104),
                                      fontWeight: FontWeight.w100),
                                  minFontSize: 14,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: AutoSizeText(
                                'ผู้เขียน ประสิทธิ์ พิทยพัฒน์',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                                minFontSize: 14,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: AutoSizeText(
                                '475.00 บาท',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                                minFontSize: 14,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.shopping_cart),
                                  label: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Text(
                                      "เพิ่มลงตะกร้า",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ///บรรทัด3
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: BootstrapRow(
            children: <BootstrapCol>[
              BootstrapCol(
                  sizes: 'col-4 ',
                  child: Column(
                    children: [
                      BootstrapRow(children: <BootstrapCol>[
                        BootstrapCol(
                          invisibleForSizes: " lg xl ",
                          sizes: 'col-12',
                          child: Center(
                            child: Container(
                                color: Colors.blue,

                                // color:
                                //     Color.fromARGB(31, 117, 117, 117),

                                child: Image.asset("images/book2.jpg",
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 210)),
                          ),
                        )
                      ]),
                      BootstrapRow(children: <BootstrapCol>[
                        BootstrapCol(
                          invisibleForSizes: " md sm xs",
                          sizes: 'col-12',
                          child: Center(
                            child: Container(
                                color: Colors.blue,

                                // color:
                                //     Color.fromARGB(31, 117, 117, 117),

                                child: Image.asset("images/book2.jpg",
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 280)),
                          ),
                        )
                      ]),
                    ],
                  )),
              BootstrapCol(
                  sizes: 'col-8',
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(Click_List_Page.route);
                            },
                            child: AutoSizeText(
                              'การออกแบบระบบไฟฟ้า : Electrical System Design',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600),
                              minFontSize: 18,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: AutoSizeText(
                                  'มีเนื้อหาครบถ้วนตามหลักสูตรของวิชา Electrical System Design ของสภาวิศวกร ซึ่งจะใช้ในการสอบเพื่อขอใบอนุญาตประกอบวิชาชีพไฟฟ้ากำลังชั้นภาคี ตั้งแต่ปี พ.ศ. 2552',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 104, 104, 104),
                                      fontWeight: FontWeight.w100),
                                  minFontSize: 14,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: AutoSizeText(
                                'ผู้เขียน ประสิทธิ์ พิทยพัฒน์',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                                minFontSize: 14,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: AutoSizeText(
                                '475.00 บาท',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                                minFontSize: 14,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.shopping_cart),
                                  label: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Text(
                                      "เพิ่มลงตะกร้า",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ///บรรทัด4
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: BootstrapRow(
            children: <BootstrapCol>[
              BootstrapCol(
                  sizes: 'col-4 ',
                  child: Column(
                    children: [
                      BootstrapRow(children: <BootstrapCol>[
                        BootstrapCol(
                          invisibleForSizes: " lg xl ",
                          sizes: 'col-12',
                          child: Center(
                            child: Container(
                                color: Colors.blue,

                                // color:
                                //     Color.fromARGB(31, 117, 117, 117),

                                child: Image.asset("images/book3.jpg",
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 210)),
                          ),
                        )
                      ]),
                      BootstrapRow(children: <BootstrapCol>[
                        BootstrapCol(
                          invisibleForSizes: " md sm xs",
                          sizes: 'col-12',
                          child: Center(
                            child: Container(
                                color: Colors.blue,

                                // color:
                                //     Color.fromARGB(31, 117, 117, 117),

                                child: Image.asset("images/book3.jpg",
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 280)),
                          ),
                        )
                      ]),
                    ],
                  )),
              BootstrapCol(
                  sizes: 'col-8',
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(Click_List_Page.route);
                            },
                            child: AutoSizeText(
                              'การออกแบบระบบไฟฟ้า : Electrical System Design',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600),
                              minFontSize: 18,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: AutoSizeText(
                                  'มีเนื้อหาครบถ้วนตามหลักสูตรของวิชา Electrical System Design ของสภาวิศวกร ซึ่งจะใช้ในการสอบเพื่อขอใบอนุญาตประกอบวิชาชีพไฟฟ้ากำลังชั้นภาคี ตั้งแต่ปี พ.ศ. 2552',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 104, 104, 104),
                                      fontWeight: FontWeight.w100),
                                  minFontSize: 14,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: AutoSizeText(
                                'ผู้เขียน ประสิทธิ์ พิทยพัฒน์',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                                minFontSize: 14,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: AutoSizeText(
                                '475.00 บาท',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                                minFontSize: 14,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.shopping_cart),
                                  label: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Text(
                                      "เพิ่มลงตะกร้า",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ///บรรทัด5
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: BootstrapRow(
            children: <BootstrapCol>[
              BootstrapCol(
                  sizes: 'col-4 ',
                  child: Column(
                    children: [
                      BootstrapRow(children: <BootstrapCol>[
                        BootstrapCol(
                          invisibleForSizes: " lg xl ",
                          sizes: 'col-12',
                          child: Center(
                            child: Container(
                                color: Colors.blue,

                                // color:
                                //     Color.fromARGB(31, 117, 117, 117),

                                child: Image.asset("images/book4.jpg",
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 210)),
                          ),
                        )
                      ]),
                      BootstrapRow(children: <BootstrapCol>[
                        BootstrapCol(
                          invisibleForSizes: " md sm xs",
                          sizes: 'col-12',
                          child: Center(
                            child: Container(
                                color: Colors.blue,

                                // color:
                                //     Color.fromARGB(31, 117, 117, 117),

                                child: Image.asset("images/book4.jpg",
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 280)),
                          ),
                        )
                      ]),
                    ],
                  )),
              BootstrapCol(
                  sizes: 'col-8',
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(Click_List_Page.route);
                            },
                            child: AutoSizeText(
                              'การออกแบบระบบไฟฟ้า : Electrical System Design',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600),
                              minFontSize: 18,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: AutoSizeText(
                                  'มีเนื้อหาครบถ้วนตามหลักสูตรของวิชา Electrical System Design ของสภาวิศวกร ซึ่งจะใช้ในการสอบเพื่อขอใบอนุญาตประกอบวิชาชีพไฟฟ้ากำลังชั้นภาคี ตั้งแต่ปี พ.ศ. 2552',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 104, 104, 104),
                                      fontWeight: FontWeight.w100),
                                  minFontSize: 14,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: AutoSizeText(
                                'ผู้เขียน ประสิทธิ์ พิทยพัฒน์',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                                minFontSize: 14,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: AutoSizeText(
                                '475.00 บาท',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                                minFontSize: 14,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.shopping_cart),
                                  label: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Text(
                                      "เพิ่มลงตะกร้า",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ///บรรทัด6
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: BootstrapRow(
            children: <BootstrapCol>[
              BootstrapCol(
                  sizes: 'col-4 ',
                  child: Column(
                    children: [
                      BootstrapRow(children: <BootstrapCol>[
                        BootstrapCol(
                          invisibleForSizes: " lg xl ",
                          sizes: 'col-12',
                          child: Center(
                            child: Container(
                                color: Colors.blue,

                                // color:
                                //     Color.fromARGB(31, 117, 117, 117),

                                child: Image.asset("images/book5.jpg",
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 210)),
                          ),
                        )
                      ]),
                      BootstrapRow(children: <BootstrapCol>[
                        BootstrapCol(
                          invisibleForSizes: " md sm xs",
                          sizes: 'col-12',
                          child: Center(
                            child: Container(
                                color: Colors.blue,

                                // color:
                                //     Color.fromARGB(31, 117, 117, 117),

                                child: Image.asset("images/book5.jpg",
                                    fit: BoxFit.cover,
                                    width: 200,
                                    height: 280)),
                          ),
                        )
                      ]),
                    ],
                  )),
              BootstrapCol(
                  sizes: 'col-8',
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(Click_List_Page.route);
                            },
                            child: AutoSizeText(
                              'การออกแบบระบบไฟฟ้า : Electrical System Design',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.w600),
                              minFontSize: 18,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: SizedBox(
                              width: double.infinity,
                              child: Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: AutoSizeText(
                                  'มีเนื้อหาครบถ้วนตามหลักสูตรของวิชา Electrical System Design ของสภาวิศวกร ซึ่งจะใช้ในการสอบเพื่อขอใบอนุญาตประกอบวิชาชีพไฟฟ้ากำลังชั้นภาคี ตั้งแต่ปี พ.ศ. 2552',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 104, 104, 104),
                                      fontWeight: FontWeight.w100),
                                  minFontSize: 14,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            )),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: AutoSizeText(
                                'ผู้เขียน ประสิทธิ์ พิทยพัฒน์',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                                minFontSize: 14,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: AutoSizeText(
                                '475.00 บาท',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                                minFontSize: 14,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.shopping_cart),
                                  label: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Text(
                                      "เพิ่มลงตะกร้า",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

        SizedBox(
          height: 50,
        ),

        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 0.5),
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),

        Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Pager(
                currentPage: 1,
                totalPages: 3,
                onPageChanged: (page) {},
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
