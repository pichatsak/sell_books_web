// ignore_for_file: camel_case_types, prefer_const_constructors, implementation_imports, unnecessary_import, duplicate_ignore, avoid_unnecessary_containers

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:sell_books_web/widget/nav_widget/nav_desktop.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';
import 'package:sell_books_web/widget/nav_widget/nav_minimal_desktop.dart';
import 'package:sell_books_web/widget/nav_widget/nav_mobile.dart';

class Click_List_Page extends StatefulWidget {
  const Click_List_Page({Key? key}) : super(key: key);
  static const String route = '/product';

  @override
  State<Click_List_Page> createState() => _Click_List_PageState();
}

class _Click_List_PageState extends State<Click_List_Page> {
  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);
    var color = Colors.transparent;
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      body: SingleChildScrollView(
          child: Container(
              child: Column(children: [
        //NAV_START
        NavMainScreen(),
        //NAV_END
        //BODY_START
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: BootstrapContainer(
            decoration: BoxDecoration(color: Colors.white),
            fluid: false,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 30, right: 30),
                child: BootstrapRow(
                  children: <BootstrapCol>[
                    BootstrapCol(
                      sizes: 'col-12  col-md-12 col-lg-4',
                      child: Center(
                        child: Container(
                          height: 300,
                          child: Image.asset(
                            "images/book.jpg",
                            fit: BoxFit.cover,width: 220,height: 230,
                          ),
                        ),
                      ),
                    ),
                    BootstrapCol(
                        sizes: 'col-12 col-md-12 col-lg-8',
                        child: Container(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(18, 35, 0, 0),
                                  // ignore: deprecated_member_use
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: AutoSizeText(
                                      'การออกแบบระบบไฟฟ้า : Electrical System Design',
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600),
                                      minFontSize: 18,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                        child: AutoSizeText(
                                          'มีเนื้อหาครบถ้วนตามหลักสูตรของวิชา Electrical System Design ของสภาวิศวกร ซึ่งจะใช้ในการสอบเพื่อขอใบอนุญาตประกอบวิชาชีพไฟฟ้ากำลังชั้นภาคี ตั้งแต่ปี พ.ศ. 2552',
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 104, 104, 104),
                                              fontWeight: FontWeight.w100),
                                          minFontSize: 14,
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: AutoSizeText(
                                        'ผู้เขียน ประสิทธิ์ พิทยพัฒน์',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                        minFontSize: 14,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: AutoSizeText(
                                        '475.00 บาท',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                        minFontSize: 14,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Container(
                                      margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                      child: AutoSizeText(
                                        'คงเหลือ : 10 เล่ม',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100,
                                          color: Color.fromARGB(
                                              255, 104, 104, 104),
                                        ),
                                        minFontSize: 14,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(18, 20, 0, 0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ElevatedButton.icon(
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
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
                child: SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: ColoredBox(color: Colors.black12),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
                child: Container(
                  child: BootstrapRow(height: 60, children: <BootstrapCol>[
                    BootstrapCol(
                        sizes: 'col-12',
                        child: Container(
                          child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: AutoSizeText(
                                  'คำนำ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                  minFontSize: 17,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: AutoSizeText(
                                    '       หนังสือ "การออกแบบระบบไฟฟ้า (ปวส.) (รหัสวิชา 30104-2002)" เล่มนี้ เรียบเรียงขึ้นตรงตามจุดประสงค์รายวิชา สมรรถนะรายวิชาและคำอธิบายรายวิชา ตามหลักสูตรประกาศนียบัตรวิชาชีพชั้นสูง พุทธศักราช 2563 ประเภทวิชาอุตสาหกรรม สาขาวิชาไฟฟ้า สาขางานไฟฟ้า สาขาไฟฟ้ากำลัง ของสำนักงานคณะกรรมการการอาชีวศึกษา กระทรวงศึกษาธิการ โดยยึดข้อกำหนดตามมาตรฐานการติดตั้งทางไฟฟ้าสำหรับประเทศไทย พ.ศ. 2564 ของวิศวกรรมสถานแห่งประเทศไทยในพระบรมราชูปถัมท์ทุกประการ เหมาะสำหรับนักเรียน นักศึกษาและผู้สนใจทั่วไป',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                    minFontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: AutoSizeText(
                                    '       เนื้อหาภายในเล่มผู้เขียนได้เรีบเรียงให้อ่านเข้าใจง่าย ประกอบด้วย กฏมาตรฐานทางไฟฟ้า บริภัณฑ์ไฟฟ้า แผงสวิตช์และการติดตั้งระยะห่าง สายไฟฟ้าและการใช้งาน การต่อลงดิน การเดินสายและอุปกรณ์ประกอบ มอเตอร์ไฟฟ้า การออกแบบระบบไฟฟ้าในอาคาร เครื่องเชื่อมไฟฟ้า เครื่องกำเนิดไฟฟ้าสำรอง การปรับปรุงตัวประกอบกำลังไฟฟ้า การออกแบบระบบไฟฟ้าภายในโรงงาน การป้องกันฟ้าผ่าระบบไฟฟ้าและสิ่งปลูกสร้าง โดยทุกบทเรียนเน้นตัวอย่างและคำถามที่เกิดจากประสบการณ์จริง มีตารางคำนวณสำเร็จในภาคผนวกให้เลือกใช้งานครบ เพื่อความสะดวกในการคำนวณออกแบบและได้อ้างอิงมาตรฐานสายไฟฟ้าทองแดงหุ้มฉนวนพีวีซีฉบับล่าสุด มอก.11 เล่ม 101-2559 ไว้ด้วย',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                    minFontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ]),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: ColoredBox(color: Colors.black12),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
                child: Container(
                  child: BootstrapRow(height: 60, children: <BootstrapCol>[
                    BootstrapCol(
                        sizes: 'col-12',
                        child: Container(
                          child: Column(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: AutoSizeText(
                                  'สารบัญ',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                  minFontSize: 17,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: AutoSizeText(
                                    'บทที่ 1 กฎมาตรฐานทางไฟฟ้า',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                    minFontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: AutoSizeText(
                                    'บทที่ 2 บริภัณฑ์ไฟฟ้า',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                    minFontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: AutoSizeText(
                                    'บทที่ 3 แผงสวิตช์และการตั้งระยะห่าง',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                    minFontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: AutoSizeText(
                                    'บทที่ 4 สายไฟฟ้าและการใช้งาน',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                    minFontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: AutoSizeText(
                                    'บทที่ 5 การต่อลงดิน',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                    minFontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: AutoSizeText(
                                    'บทที่ 6 การเดินสายและอุปกรณ์ประกอบ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                    minFontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: AutoSizeText(
                                    'บทที่ 7 มอเตอร์ไฟฟ้า',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                    minFontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: AutoSizeText(
                                    'บทที่ 8 หม้อแปลงไฟฟ้า',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                    minFontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: AutoSizeText(
                                    'บทที่ 9 การออกแบบระบบไฟฟ้าในอาคาร',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                    minFontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: AutoSizeText(
                                    'บทที่ 10 เครื่องเชื่อมไฟฟ้า',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                    minFontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: AutoSizeText(
                                    'บทที่ 11 เครื่องกำเนิดไฟฟ้าสำรอง',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                    minFontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: AutoSizeText(
                                    'บทที่ 12 การปรับปรุงตัวประกอบกำลังไฟฟ้า',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                    minFontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: AutoSizeText(
                                    'บทที่ 13 การออกแบบระบบไฟฟ้าในโรงงาน',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                    minFontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: AutoSizeText(
                                    'บทที่ 14 การป้องกันฟ้าผ่าระบบฟ้าและสิ่งปลูกสร้าง',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                    minFontSize: 15,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 40, 0, 20),
                                child: SizedBox(
                                  height: 1,
                                  width: double.infinity,
                                  child: ColoredBox(color: Colors.black12),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 10, 0, 20),
                                child: Container(
                                  child: BootstrapRow(height: 60, children: <
                                      BootstrapCol>[
                                    BootstrapCol(
                                        sizes: 'col-12',
                                        child: Container(
                                          child: Column(
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              SizedBox(
                                                width: double.infinity,
                                                child: AutoSizeText(
                                                  'รายละเอียดหนังสือ',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                  minFontSize: 17,
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 10, 0, 0),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Row(
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      SizedBox(
                                                        width: 100,
                                                        child: AutoSizeText(
                                                          'ISBN',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                          minFontSize: 15,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10, 0, 0, 0),
                                                        child: AutoSizeText(
                                                          ':  9786160845323 (ปกอ่อน) 480 หน้า',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                          minFontSize: 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Row(
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      SizedBox(
                                                        width: 100,
                                                        child: AutoSizeText(
                                                          'ขนาดรูปเล่ม',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                          minFontSize: 15,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10, 0, 0, 0),
                                                        child: AutoSizeText(
                                                          ':  170 x 240 x 18 มม.',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                          minFontSize: 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Row(
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      SizedBox(
                                                        width: 100,
                                                        child: AutoSizeText(
                                                          'น้ำหนัก',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                          minFontSize: 15,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10, 0, 0, 0),
                                                        child: AutoSizeText(
                                                          ':  580 กรัม',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                          minFontSize: 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Row(
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      SizedBox(
                                                        width: 100,
                                                        child: AutoSizeText(
                                                          'เนื้อในพิมพ์',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                          minFontSize: 15,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10, 0, 0, 0),
                                                        child: AutoSizeText(
                                                          ':  ขาวดำ',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                          minFontSize: 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Row(
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      SizedBox(
                                                        width: 100,
                                                        child: AutoSizeText(
                                                          'ชนิดกระดาษ',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                          minFontSize: 15,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10, 0, 0, 0),
                                                        child: AutoSizeText(
                                                          ':  กระดาษปอนด์',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                          minFontSize: 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Row(
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      SizedBox(
                                                        width: 100,
                                                        child: AutoSizeText(
                                                          'สำนักพิมพ์',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                          minFontSize: 15,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10, 0, 0, 0),
                                                        child: AutoSizeText(
                                                          ':  ซีเอ็ดยูเคชั่น, บมจ.',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                          minFontSize: 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 5, 0, 0),
                                                child: SizedBox(
                                                  width: double.infinity,
                                                  child: Row(
                                                    // ignore: prefer_const_literals_to_create_immutables
                                                    children: [
                                                      SizedBox(
                                                        width: 100,
                                                        child: AutoSizeText(
                                                          'เดือนปีที่พิมพ์',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                          minFontSize: 15,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10, 0, 0, 0),
                                                        child: AutoSizeText(
                                                          ':  2022',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w100),
                                                          minFontSize: 15,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 40, 0, 20),
                                                child: SizedBox(
                                                  height: 1,
                                                  width: double.infinity,
                                                  child: ColoredBox(
                                                      color: Colors.black12),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 200,
                                              ),
                                            ],
                                          ),
                                        )),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ]),
                ),
              ),

              //BODY_END
              //FOOTING_START
              // ignore: prefer_const_constructors

              //FOOTING_END
            ],
          ),
        ),
      ]))),
    );
  }
}
