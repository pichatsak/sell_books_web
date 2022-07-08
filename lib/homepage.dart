// ignore_for_file: unnecessary_const, deprecated_member_use, unused_local_variable, avoid_unnecessary_containers, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:pager/pager.dart';
import 'package:sell_books_web/click_list_page.dart';
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
  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);
    var color = Colors.transparent;

    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      body: SingleChildScrollView(
        // ignore: avoid_unnecessary_containers
        child: Container(
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
                          invisibleForSizes: "sm xs",
                          sizes: 'col-3',
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 15, 0, 7),
                            // ignore: avoid_unnecessary_containers
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 82, 180, 230),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5),
                                          topLeft: Radius.circular(5)),
                                    ),
                                    height: 50,
                                    width: double.infinity,
                                    // ignore: prefer_const_constructors
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        // ignore: prefer_const_constructors
                                        Text(
                                          "หมวดหมู่",
                                          // ignore: prefer_const_constructors
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w100,
                                              fontSize: 16),
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
                                      child: Column(
                                        children: [
                                          FlatButton(
                                            onPressed: (() {}),
                                            // ignore: sized_box_for_whitespace
                                            child: Container(
                                                height: 55,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        // ignore: prefer_const_literals_to_create_immutables
                                                        children: [
                                                          // ignore: prefer_const_constructors
                                                          Text(
                                                            "หมวดหมู่ที่ 1",
                                                            // ignore: prefer_const_constructors
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100),
                                                          ),
                                                        ],
                                                      )
                                                    ])),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 0, 15, 0),
                                            child: Container(
                                              height: 1,
                                              color: Colors.black12,
                                            ),
                                          ),
                                          FlatButton(
                                            onPressed: (() {}),
                                            // ignore: sized_box_for_whitespace
                                            child: Container(
                                                height: 55,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        // ignore: prefer_const_literals_to_create_immutables
                                                        children: [
                                                          // ignore: prefer_const_constructors
                                                          Text(
                                                            "หมวดหมู่ที่ 2",
                                                            // ignore: prefer_const_constructors
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100),
                                                          ),
                                                        ],
                                                      )
                                                    ])),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 0, 15, 0),
                                            child: Container(
                                              height: 1,
                                              color: Colors.black12,
                                            ),
                                          ),
                                          FlatButton(
                                            onPressed: (() {}),
                                            // ignore: sized_box_for_whitespace
                                            child: Container(
                                                height: 55,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        // ignore: prefer_const_literals_to_create_immutables
                                                        children: [
                                                          // ignore: prefer_const_constructors
                                                          Text(
                                                            "หมวดหมู่ที่ 3",
                                                            // ignore: prefer_const_constructors
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100),
                                                          ),
                                                        ],
                                                      )
                                                    ])),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 0, 15, 0),
                                            child: Container(
                                              height: 1,
                                              color: Colors.black12,
                                            ),
                                          ),
                                          FlatButton(
                                            onPressed: (() {}),
                                            // ignore: sized_box_for_whitespace
                                            child: Container(
                                                height: 55,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        // ignore: prefer_const_literals_to_create_immutables
                                                        children: [
                                                          // ignore: prefer_const_constructors
                                                          Text(
                                                            "หมวดหมู่ที่ 4",
                                                            // ignore: prefer_const_constructors
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w100),
                                                          ),
                                                        ],
                                                      )
                                                    ])),
                                          ),
                                        ],
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
                          padding: const EdgeInsets.fromLTRB(27.5, 15, 27.5, 0),
                          child: Container(
                            child: Center(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(31, 161, 161, 161),
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                      child: TextFormField(
                                        cursorColor: Colors.black,
                                        style: TextStyle(color: Colors.black),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          hintText: "ค้นหาสินค้าที่ต้องการ",

                                          hintStyle: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w100),
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

                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                  child: IconButton(
                                                    onPressed: (() {}),
                                                    highlightColor: color,
                                                    splashColor: color,
                                                    hoverColor: color,
                                                    icon: Icon(
                                                        Icons.apps_outlined),
                                                    color: Color.fromRGBO(
                                                        65, 176, 231, 1),
                                                  ),
                                                ),
                                                Container(
                                                  height: 25,
                                                  width: 1,
                                                  color: Colors.grey,
                                                  margin: EdgeInsets.fromLTRB(
                                                      10, 0, 10, 0),
                                                ),
                                                Container(
                                                  height: 40,
                                                  color: Color.fromARGB(
                                                      31, 122, 122, 122),
                                                  child: IconButton(
                                                    onPressed: (() {}),
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

                                  //ในกรอบข้อมูล
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Column(
                                      children: [
                                        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                        Container(
                                          //บรรทัด1
                                          //Row ใส้นอก
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: BootstrapRow(
                                            children: <BootstrapCol>[
                                              BootstrapCol(
                                                  //col ใส้นอก 1
                                                  sizes: 'col-6 col-md-12',
                                                  child: Container(
                                                    //Row ใส้ใน
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 20, 0, 0),
                                                      child: BootstrapRow(
                                                        children: <
                                                            BootstrapCol>[
                                                          BootstrapCol(
                                                              //col ใส้ใน
                                                              sizes:
                                                                  'col-12 col-md-4',
                                                              child: Container(
                                                                  height: 300,

                                                                  // color:
                                                                  //     Color.fromARGB(31, 117, 117, 117),

                                                                  child: Image
                                                                      .asset(
                                                                    "images/book.jpg",
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ))),
                                                          BootstrapCol(
                                                              //col ใส้ใน
                                                              sizes:
                                                                  'col-12 col-md-8',
                                                              child: Container(
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              35,
                                                                              0,
                                                                              0),
                                                                      child: FlatButton(
                                                                          onPressed: () {
                                                                            Navigator.of(context).pushNamed(Click_List_Page.route);
                                                                          },
                                                                          highlightColor: color,
                                                                          splashColor: color,
                                                                          hoverColor: color,
                                                                          child: SizedBox(
                                                                            width:
                                                                                double.infinity,
                                                                            child:
                                                                                AutoSizeText(
                                                                              'การออกแบบระบบไฟฟ้า : Electrical System Design',
                                                                              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                                                                              minFontSize: 18,
                                                                              maxLines: 1,
                                                                              overflow: TextOverflow.ellipsis,
                                                                            ),
                                                                          )),
                                                                    ),
                                                                    Container(
                                                                        margin: EdgeInsets.fromLTRB(
                                                                            10,
                                                                            15,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              double.infinity,
                                                                          child:
                                                                              Container(
                                                                            margin: EdgeInsets.fromLTRB(
                                                                                8,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                AutoSizeText(
                                                                              'มีเนื้อหาครบถ้วนตามหลักสูตรของวิชา Electrical System Design ของสภาวิศวกร ซึ่งจะใช้ในการสอบเพื่อขอใบอนุญาตประกอบวิชาชีพไฟฟ้ากำลังชั้นภาคี ตั้งแต่ปี พ.ศ. 2552',
                                                                              style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 104, 104, 104), fontWeight: FontWeight.w100),
                                                                              minFontSize: 14,
                                                                              maxLines: 2,
                                                                              overflow: TextOverflow.ellipsis,
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            Container(
                                                                          margin: EdgeInsets.fromLTRB(
                                                                              8,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            'ผู้เขียน ประสิทธิ์ พิทยพัฒน์',
                                                                            style:
                                                                                TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                                                            minFontSize:
                                                                                14,
                                                                            maxLines:
                                                                                1,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            Container(
                                                                          margin: EdgeInsets.fromLTRB(
                                                                              8,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              AutoSizeText(
                                                                            '475.00 บาท',
                                                                            style:
                                                                                TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                                                                            minFontSize:
                                                                                14,
                                                                            maxLines:
                                                                                1,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              18,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          ElevatedButton.icon(
                                                                              onPressed: () {},
                                                                              icon: Icon(Icons.shopping_cart),
                                                                              label: Padding(
                                                                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                                                                child: Text(
                                                                                  "เพิ่มลงตะกร้า",
                                                                                  style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w100),
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
                                                  )),
                                              //col ใส้นอก 2

                                              BootstrapCol(
                                                  sizes: 'col-6  col-md-12',
                                                  child: Container(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 20, 0, 0),
                                                      child: BootstrapRow(
                                                        children: <
                                                            BootstrapCol>[
                                                          BootstrapCol(
                                                              //col ใส้ใน
                                                              sizes:
                                                                  'col-12 col-md-4',
                                                              child: Container(
                                                                  height: 300,

                                                                  // color:
                                                                  //     Color.fromARGB(31, 117, 117, 117),

                                                                  child: Image
                                                                      .asset(
                                                                    "images/book1.jpg",
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ))),
                                                          BootstrapCol(
                                                              //col ใส้ใน
                                                              sizes:
                                                                  'col-12 col-md-8',
                                                              ////////////font
                                                              child: Container(
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              35,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            AutoSizeText(
                                                                          'การออกแบบระบบไฟฟ้า (ปวส.) (รหัสวิชา 30104-2002)',
                                                                          style: TextStyle(
                                                                              fontSize: 19,
                                                                              fontWeight: FontWeight.w600),
                                                                          minFontSize:
                                                                              18,
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        margin: EdgeInsets.fromLTRB(
                                                                            10,
                                                                            15,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              double.infinity,
                                                                          child:
                                                                              AutoSizeText(
                                                                            'หนังสือเล่มนี้เรียบเรียงตามจุดประสงค์รายวิชา สมรรถนะรายวิชา เเละคำอธิบายรายวิชาหลักสูตรประกาศนียบัตรวิชาชาชีพชั้นนสูง (ปวส.) พุทธศักราช 2563 ของสำนักงานคณะกรรมการการอาชีวศึกษากระทรวงศึกษาธิการ',
                                                                            style: TextStyle(
                                                                                fontSize: 15,
                                                                                color: Color.fromARGB(255, 104, 104, 104),
                                                                                fontWeight: FontWeight.w100),
                                                                            minFontSize:
                                                                                14,
                                                                            maxLines:
                                                                                2,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            AutoSizeText(
                                                                          'ผู้เขียน สุนทร ดอนชัย',
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w600),
                                                                          minFontSize:
                                                                              14,
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            AutoSizeText(
                                                                          '250.00 บาท',
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w600),
                                                                          minFontSize:
                                                                              14,
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          ElevatedButton.icon(
                                                                              onPressed: () {},
                                                                              icon: Icon(Icons.shopping_cart),
                                                                              label: Padding(
                                                                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                                                                child: Text(
                                                                                  "เพิ่มลงตะกร้า",
                                                                                  style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w100),
                                                                                ),
                                                                              )),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              )), ////////////////font
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),

                                        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                        //บรรทัด2
                                        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                        Container(
                                          //Row ใส้นอก
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: BootstrapRow(
                                            children: <BootstrapCol>[
                                              BootstrapCol(
                                                  //col ใส้นอก 1
                                                  sizes: 'col-6 col-md-12',
                                                  child: Container(
                                                    //Row ใส้ใน
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 20, 0, 0),
                                                      child: BootstrapRow(
                                                        children: <
                                                            BootstrapCol>[
                                                          BootstrapCol(
                                                              //col ใส้ใน
                                                              sizes:
                                                                  'col-12 col-md-4',
                                                              child: Container(
                                                                  height: 300,

                                                                  // color:
                                                                  //     Color.fromARGB(31, 117, 117, 117),

                                                                  child: Image
                                                                      .asset(
                                                                    "images/book5.jpg",
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ))),
                                                          BootstrapCol(
                                                              //col ใส้ใน
                                                              sizes:
                                                                  'col-12 col-md-8',
                                                              child: Container(
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              35,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            AutoSizeText(
                                                                          'การออกแบบระบบไฟฟ้า : Electrical System Design',
                                                                          style: TextStyle(
                                                                              fontSize: 19,
                                                                              fontWeight: FontWeight.w600),
                                                                          minFontSize:
                                                                              18,
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        margin: EdgeInsets.fromLTRB(
                                                                            10,
                                                                            15,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              double.infinity,
                                                                          child:
                                                                              AutoSizeText(
                                                                            'มีเนื้อหาครบถ้วนตามหลักสูตรของวิชา Electrical System Design ของสภาวิศวกร ซึ่งจะใช้ในการสอบเพื่อขอใบอนุญาตประกอบวิชาชีพไฟฟ้ากำลังชั้นภาคี ตั้งแต่ปี พ.ศ. 2552',
                                                                            style: TextStyle(
                                                                                fontSize: 15,
                                                                                color: Color.fromARGB(255, 104, 104, 104),
                                                                                fontWeight: FontWeight.w100),
                                                                            minFontSize:
                                                                                14,
                                                                            maxLines:
                                                                                2,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            AutoSizeText(
                                                                          'ผู้เขียน ประสิทธิ์ พิทยพัฒน์',
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w600),
                                                                          minFontSize:
                                                                              14,
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            AutoSizeText(
                                                                          '475.00 บาท',
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w600),
                                                                          minFontSize:
                                                                              14,
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          ElevatedButton.icon(
                                                                              onPressed: () {},
                                                                              icon: Icon(Icons.shopping_cart),
                                                                              label: Padding(
                                                                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                                                                child: Text(
                                                                                  "เพิ่มลงตะกร้า",
                                                                                  style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w100),
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
                                                  )),
                                              //col ใส้นอก 2

                                              BootstrapCol(
                                                  sizes: 'col-6  col-md-12',
                                                  child: Container(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 20, 0, 0),
                                                      child: BootstrapRow(
                                                        children: <
                                                            BootstrapCol>[
                                                          BootstrapCol(
                                                              //col ใส้ใน
                                                              sizes:
                                                                  'col-12 col-md-4',
                                                              child: Container(
                                                                  height: 300,

                                                                  // color:
                                                                  //     Color.fromARGB(31, 117, 117, 117),

                                                                  child: Image
                                                                      .asset(
                                                                    "images/book4.jpg",
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ))),
                                                          BootstrapCol(
                                                              //col ใส้ใน
                                                              sizes:
                                                                  'col-12 col-md-8',
                                                              ////////////font
                                                              child: Container(
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              35,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            AutoSizeText(
                                                                          'การออกแบบระบบไฟฟ้า (ปวส.) (รหัสวิชา 30104-2002)',
                                                                          style: TextStyle(
                                                                              fontSize: 19,
                                                                              fontWeight: FontWeight.w600),
                                                                          minFontSize:
                                                                              18,
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        margin: EdgeInsets.fromLTRB(
                                                                            10,
                                                                            15,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              double.infinity,
                                                                          child:
                                                                              AutoSizeText(
                                                                            'หนังสือเล่มนี้เรียบเรียงตามจุดประสงค์รายวิชา สมรรถนะรายวิชา เเละคำอธิบายรายวิชาหลักสูตรประกาศนียบัตรวิชาชาชีพชั้นนสูง (ปวส.) พุทธศักราช 2563 ของสำนักงานคณะกรรมการการอาชีวศึกษากระทรวงศึกษาธิการ',
                                                                            style: TextStyle(
                                                                                fontSize: 15,
                                                                                color: Color.fromARGB(255, 104, 104, 104),
                                                                                fontWeight: FontWeight.w100),
                                                                            minFontSize:
                                                                                14,
                                                                            maxLines:
                                                                                2,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            AutoSizeText(
                                                                          'ผู้เขียน สุนทร ดอนชัย',
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w600),
                                                                          minFontSize:
                                                                              14,
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            AutoSizeText(
                                                                          '250.00 บาท',
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w600),
                                                                          minFontSize:
                                                                              14,
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          ElevatedButton.icon(
                                                                              onPressed: () {},
                                                                              icon: Icon(Icons.shopping_cart),
                                                                              label: Padding(
                                                                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                                                                child: Text(
                                                                                  "เพิ่มลงตะกร้า",
                                                                                  style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w100),
                                                                                ),
                                                                              )),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              )), ////////////////font
                                                        ],
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),

                                        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

                                        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
                                        Container(
                                          //บรรทัด3
                                          //Row ใส้นอก
                                          margin:
                                              EdgeInsets.fromLTRB(0, 0, 0, 0),
                                          child: BootstrapRow(
                                            children: <BootstrapCol>[
                                              BootstrapCol(
                                                  //col ใส้นอก 1
                                                  sizes: 'col-6 col-md-12',
                                                  child: Container(
                                                    //Row ใส้ใน
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 20, 0, 0),
                                                      child: BootstrapRow(
                                                        children: <
                                                            BootstrapCol>[
                                                          BootstrapCol(
                                                              //col ใส้ใน
                                                              sizes:
                                                                  'col-12 col-md-4',
                                                              child: Container(
                                                                  height: 300,

                                                                  // color:
                                                                  //     Color.fromARGB(31, 117, 117, 117),

                                                                  child: Image
                                                                      .asset(
                                                                    "images/book2.jpg",
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ))),
                                                          BootstrapCol(
                                                              //col ใส้ใน
                                                              sizes:
                                                                  'col-12 col-md-8',
                                                              child: Container(
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              35,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            AutoSizeText(
                                                                          'การออกแบบระบบไฟฟ้า : Electrical System Design',
                                                                          style: TextStyle(
                                                                              fontSize: 19,
                                                                              fontWeight: FontWeight.w600),
                                                                          minFontSize:
                                                                              18,
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        margin: EdgeInsets.fromLTRB(
                                                                            10,
                                                                            15,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              double.infinity,
                                                                          child:
                                                                              AutoSizeText(
                                                                            'มีเนื้อหาครบถ้วนตามหลักสูตรของวิชา Electrical System Design ของสภาวิศวกร ซึ่งจะใช้ในการสอบเพื่อขอใบอนุญาตประกอบวิชาชีพไฟฟ้ากำลังชั้นภาคี ตั้งแต่ปี พ.ศ. 2552',
                                                                            style: TextStyle(
                                                                                fontSize: 15,
                                                                                color: Color.fromARGB(255, 104, 104, 104),
                                                                                fontWeight: FontWeight.w100),
                                                                            minFontSize:
                                                                                14,
                                                                            maxLines:
                                                                                2,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            AutoSizeText(
                                                                          'ผู้เขียน ประสิทธิ์ พิทยพัฒน์',
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w600),
                                                                          minFontSize:
                                                                              14,
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            AutoSizeText(
                                                                          '475.00 บาท',
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w600),
                                                                          minFontSize:
                                                                              14,
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          ElevatedButton.icon(
                                                                              onPressed: () {},
                                                                              icon: Icon(Icons.shopping_cart),
                                                                              label: Padding(
                                                                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                                                                child: Text(
                                                                                  "เพิ่มลงตะกร้า",
                                                                                  style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w100),
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
                                                  )),
                                              //col ใส้นอก 2

                                              BootstrapCol(
                                                  sizes: 'col-6  col-md-12',
                                                  child: Container(
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          0, 20, 0, 0),
                                                      child: BootstrapRow(
                                                        children: <
                                                            BootstrapCol>[
                                                          BootstrapCol(
                                                              //col ใส้ใน
                                                              sizes:
                                                                  'col-12 col-md-4',
                                                              child: Container(
                                                                  height: 300,

                                                                  // color:
                                                                  //     Color.fromARGB(31, 117, 117, 117),

                                                                  child: Image
                                                                      .asset(
                                                                    "images/book3.jpg",
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ))),
                                                          BootstrapCol(
                                                              //col ใส้ใน
                                                              sizes:
                                                                  'col-12 col-md-8',
                                                              ////////////font
                                                              child: Container(
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              35,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            AutoSizeText(
                                                                          'การออกแบบระบบไฟฟ้า (ปวส.) (รหัสวิชา 30104-2002)',
                                                                          style: TextStyle(
                                                                              fontSize: 19,
                                                                              fontWeight: FontWeight.w600),
                                                                          minFontSize:
                                                                              18,
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        margin: EdgeInsets.fromLTRB(
                                                                            10,
                                                                            15,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              double.infinity,
                                                                          child:
                                                                              AutoSizeText(
                                                                            'หนังสือเล่มนี้เรียบเรียงตามจุดประสงค์รายวิชา สมรรถนะรายวิชา เเละคำอธิบายรายวิชาหลักสูตรประกาศนียบัตรวิชาชาชีพชั้นนสูง (ปวส.) พุทธศักราช 2563 ของสำนักงานคณะกรรมการการอาชีวศึกษากระทรวงศึกษาธิการ',
                                                                            style: TextStyle(
                                                                                fontSize: 15,
                                                                                color: Color.fromARGB(255, 104, 104, 104),
                                                                                fontWeight: FontWeight.w100),
                                                                            minFontSize:
                                                                                14,
                                                                            maxLines:
                                                                                2,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                          ),
                                                                        )),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              10,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            AutoSizeText(
                                                                          'ผู้เขียน สุนทร ดอนชัย',
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w600),
                                                                          minFontSize:
                                                                              14,
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          SizedBox(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            AutoSizeText(
                                                                          '250.00 บาท',
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              fontWeight: FontWeight.w600),
                                                                          minFontSize:
                                                                              14,
                                                                          maxLines:
                                                                              1,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      margin: EdgeInsets
                                                                          .fromLTRB(
                                                                              10,
                                                                              20,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          ElevatedButton.icon(
                                                                              onPressed: () {},
                                                                              icon: Icon(Icons.shopping_cart),
                                                                              label: Padding(
                                                                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                                                                child: Text(
                                                                                  "เพิ่มลงตะกร้า",
                                                                                  style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w100),
                                                                                ),
                                                                              )),
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              )), ////////////////font
                                                        ],
                                                      ),
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
                                            border: Border.all(
                                                color: Colors.black12,
                                                width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(0.0),
                                          ),
                                        ),

                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(0, 20, 0, 0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Pager(
                                                currentPage: 1,
                                                totalPages: 3,
                                                onPageChanged: (page) {},
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
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
              SizedBox(
                height: 100,
              ),
              //FOOTING_END
            ],
          ),
        ),
      ),
    );
  }
}
