import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:pager/pager.dart';
import 'package:sell_books_web/account.dart';
import 'package:sell_books_web/reset_passowrd.dart';
import 'package:sell_books_web/widget/nav_widget/drawers.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';

class StoryShop extends StatefulWidget {
  const StoryShop({Key? key}) : super(key: key);
  static const String route = '/history';

  @override
  State<StoryShop> createState() => _StoryShopState();
}

class _StoryShopState extends State<StoryShop> {
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
                                            onTap: (() {
                                              Navigator.of(context)
                                                  .pushNamed(Account.route);
                                            }),
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
                                            onTap: (() {}),
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
                                            onTap: (() {}),
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
                        invisibleForSizes: 'xm xs',
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
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(Account.route);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 20,
                                        top: 10,
                                        bottom: 10),
                                    child: Row(children: const [
                                      Icon(
                                        Icons.folder,
                                        color:
                                            Color.fromARGB(255, 141, 140, 140),
                                      ),
                                    ]),
                                  ),
                                ),
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
                                          Icons.history,
                                          color: Colors.white,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 5),
                                          child: Text(
                                            "ประวัติการสั่งซื้อ",
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
                              left: 10, top: 30, right: 10, bottom: 40),
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
                                            Icons.history,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const AutoSizeText(
                                      'ประวัติการสั่งซื้อ',
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

                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Container(
                                  color:
                                      const Color.fromARGB(255, 101, 188, 231),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child:
                                        BootstrapRow(children: <BootstrapCol>[
                                      BootstrapCol(
                                        sizes: 'col-md-1',
                                        child: Column(
                                          children: const [
                                            Text(
                                              "หมายเลข",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w100,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "สั่งซื้อ",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w100,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                      BootstrapCol(
                                        sizes: 'col-md-2',
                                        child: const Padding(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Text(
                                            "เมื่อ",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w100,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      BootstrapCol(
                                        sizes: 'col-md-3',
                                        child: const Text(
                                          "รายละเอียด",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w100,
                                              color: Colors.white),
                                        ),
                                      ),
                                      BootstrapCol(
                                        sizes: 'col-md-2',
                                        child: const Text(
                                          "ยอดรวม",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w100,
                                              color: Colors.white),
                                        ),
                                      ),
                                      BootstrapCol(
                                        sizes: 'col-md-3',
                                        child: const Text(
                                          "ที่อยู่จัดส่ง",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w100,
                                              color: Colors.white),
                                        ),
                                      ),
                                      BootstrapCol(
                                        sizes: 'col-md-1',
                                        child: Column(
                                          children: const [
                                            Text(
                                              "สถานะ",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w100,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "การสั่งซื้อ",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w100,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ),
                                ),
                              ),

                              //1
                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: BootstrapRow(children: <BootstrapCol>[
                                    BootstrapCol(
                                      sizes: 'col-md-1',
                                      child: const Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            "000001",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w100,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    BootstrapCol(
                                      sizes: 'col-md-2',
                                      child: const Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            "18/7/65 เวลา 18.00 น.",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w100,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    BootstrapCol(
                                      sizes: 'col-md-3',
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Column(
                                          children: const [
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                "การออกแบบระบบไฟฟ้า : Electrical System Design x1 ",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w100,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                "การออกแบบระบบไฟฟ้า (ปวช. , ปวส.) ฉบับที่2 x1",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w100,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    BootstrapCol(
                                      sizes: 'col-md-2',
                                      child: const Padding(
                                        padding: EdgeInsets.only(right: 5),
                                        child: SizedBox(
                                          width: double.infinity,
                                          child: Text(
                                            "1,800.00",
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w100,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                    ),
                                    BootstrapCol(
                                      sizes: 'col-md-3',
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Column(
                                          children: const [
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                "ชื่อ : นายพิเชฐศักดิ์ ดุเหว่า",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w100,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                "เบอร์ : 0932430369",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w100,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                "ที่อยู่ : 205 ม.15 บ้านร้องสีเสียด",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w100,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                "ต. ดงเจน",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w100,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                "อ. ภูกามยาว",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w100,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                "จ. พะเยา 56000",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w100,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    BootstrapCol(
                                      sizes: 'col-md-1',
                                      child: const Text(
                                        "ได้รับสินค้าแล้ว",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w100,
                                            color: Colors.green),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),

                              //2

                              Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child: Container(
                                  color:
                                      const Color.fromARGB(255, 224, 244, 253),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child:
                                        BootstrapRow(children: <BootstrapCol>[
                                      BootstrapCol(
                                        sizes: 'col-md-1',
                                        child: const Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              "000002",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w100,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      BootstrapCol(
                                        sizes: 'col-md-2',
                                        child: const Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              "20/8/65 เวลา 19.00 น.",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w100,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      BootstrapCol(
                                        sizes: 'col-md-3',
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: Column(
                                            children: const [
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  "การออกแบบระบบไฟฟ้า : Electrical System Design x1 ",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  "การออกแบบระบบไฟฟ้า (ปวช. , ปวส.) ฉบับที่2 x1",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      BootstrapCol(
                                        sizes: 'col-md-2',
                                        child: const Padding(
                                          padding: EdgeInsets.only(right: 5),
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Text(
                                              "2,000.00",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w100,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                      BootstrapCol(
                                        sizes: 'col-md-3',
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: Column(
                                            children: const [
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  "ชื่อ : นายพิเชฐศักดิ์ ดุเหว่า",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  "เบอร์ : 0932430369",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  "ที่อยู่ : 205 ม.15 บ้านร้องสีเสียด",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  "ต. ดงเจน",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  "อ. ภูกามยาว",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      color: Colors.black),
                                                ),
                                              ),
                                              SizedBox(
                                                width: double.infinity,
                                                child: Text(
                                                  "จ. พะเยา 56000",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      color: Colors.black),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      BootstrapCol(
                                        sizes: 'col-md-1',
                                        child: const Text(
                                          "กำลังจัดส่ง",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w100,
                                              color: Color.fromARGB(
                                                  255, 243, 142, 11)),
                                        ),
                                      ),
                                    ]),
                                  ),
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

                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
