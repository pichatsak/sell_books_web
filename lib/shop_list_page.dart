// ignore_for_file: camel_case_types, depend_on_referenced_packages, prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sell_books_web/check_out_page.dart';
import 'package:sell_books_web/widget/nav_widget/drawers.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';

class Shop_List_Page extends StatefulWidget {
  Shop_List_Page({Key? key}) : super(key: key);
  static const String route = '/cart';

  @override
  State<Shop_List_Page> createState() => _Shop_List_PageState();
}

class _Shop_List_PageState extends State<Shop_List_Page> {
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
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 55, right: 20, bottom: 0),
                  child: BootstrapRow(children: <BootstrapCol>[
                    BootstrapCol(
                        sizes: 'col-12',
                        child: Container(
                          child: Container(
                            child: Row(
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 101, 188, 231),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                AutoSizeText(
                                  'สินค้าในตะกร้า',
                                  style: TextStyle(
                                      fontSize: 23,
                                      fontWeight: FontWeight.bold),
                                  minFontSize: 20,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ))
                  ]),
                ),
              ]),
          BootstrapContainer(
              fluid: false,
              decoration: BoxDecoration(color: Colors.white),
              children: <Widget>[
                BootstrapRow(
                  children: <BootstrapCol>[
                    BootstrapCol(
                        sizes: 'col-12 col-sm-12 col-md-12 col-lg-8',
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 0, right: 20, bottom: 40),
                          child: Column(
                            children: [
                              //สินค้าในตะกร้า

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
                              //หมวดหมู่
                              BootstrapRow(
                                children: <BootstrapCol>[
                                  BootstrapCol(
                                      invisibleForSizes: "sm xs",
                                      // ignore: prefer_const_literals_to_create_immutables
                                      sizes: 'col-4',
                                      child: Container()),
                                  BootstrapCol(
                                      invisibleForSizes: "sm xs",
                                      sizes: 'col-8',
                                      child:
                                          BootstrapRow(children: <BootstrapCol>[
                                        BootstrapCol(
                                            sizes: 'col-12 col-md-8',
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Container(
                                                child: AutoSizeText(
                                                  'รายการ',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color.fromARGB(
                                                        255, 104, 104, 104),
                                                  ),
                                                  minFontSize: 14,
                                                ),
                                              ),
                                            )),
                                        BootstrapCol(
                                            sizes: 'col-12 col-md-4',
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Container(
                                                child: AutoSizeText(
                                                  'ราคา',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color.fromARGB(
                                                        255, 104, 104, 104),
                                                  ),
                                                  minFontSize: 14,
                                                ),
                                              ),
                                            )),
                                      ])),
                                ],
                              ),

                              //รายการ1

                              Padding(
                                padding: const EdgeInsets.only(top: 35),
                                child: BootstrapRow(
                                  children: <BootstrapCol>[
                                    BootstrapCol(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      sizes: ' col-4',
                                      child: Center(
                                        child: Container(
                                            color: Colors.blue,
                                            child: Image.asset(
                                                "images/book.jpg",
                                                fit: BoxFit.cover,
                                                width: 130,
                                                height: 180)),
                                      ),
                                    ),
                                    BootstrapCol(
                                        sizes: 'col-8',
                                        child: BootstrapRow(children: <
                                            BootstrapCol>[
                                          BootstrapCol(
                                            sizes:
                                                'col-12 col-xs-12 col-sm-12 col-md-8',
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      child: SizedBox(
                                                    width: double.infinity,
                                                    child: AutoSizeText(
                                                      'การออกแบบระบบไฟฟ้า : Electrical System Design',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black),
                                                      minFontSize: 14,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  )),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 30,
                                                            bottom: 20),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          // ignore: prefer_const_literals_to_create_immutables
                                                          children: [
                                                            //จำนวน
                                                            SizedBox(
                                                              child:
                                                                  AutoSizeText(
                                                                'จำนวน :',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .black),
                                                                minFontSize: 14,
                                                              ),
                                                            ),
                                                            //ลบ
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 20,
                                                                right: 10,
                                                              ),
                                                              child: InkWell(
                                                                onTap: () {},
                                                                child:
                                                                    Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.blue,
                                                                          borderRadius:
                                                                              BorderRadius.circular(50),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(4.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.remove,
                                                                            size:
                                                                                17,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        )),
                                                              ),
                                                            ),
                                                            //ช่องกรอก

                                                            Container(
                                                              width: 40,
                                                              child: Text(
                                                                "1",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),

                                                            //บวก
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 10,
                                                                right: 20,
                                                              ),
                                                              child: InkWell(
                                                                onTap: () {},
                                                                child:
                                                                    Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.blue,
                                                                          borderRadius:
                                                                              BorderRadius.circular(50),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(4.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.add,
                                                                            size:
                                                                                17,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        )),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          BootstrapCol(
                                            sizes:
                                                'col-12 col-xs-12 col-sm-12 col-md-4',
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Column(
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: AutoSizeText(
                                                      '900.00 บาท',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      minFontSize: 14,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          // ignore: prefer_const_literals_to_create_immutables
                                                          children: [
                                                            Icon(
                                                              Icons.delete,
                                                              color: Colors.red,
                                                            ),
                                                            AutoSizeText(
                                                              'ลบรายการ',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                              minFontSize: 14,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ])),
                                  ],
                                ),
                              ),
                              //เส้น
                              //หมวดหมู่2
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 30, 0, 20),
                                child: SizedBox(
                                  height: 1,
                                  width: double.infinity,
                                  child: ColoredBox(color: Colors.black12),
                                ),
                              ),
                              BootstrapRow(
                                children: <BootstrapCol>[
                                  BootstrapCol(
                                      invisibleForSizes: "sm xs",
                                      // ignore: prefer_const_literals_to_create_immutables
                                      sizes: 'col-4',
                                      child: Container()),
                                  BootstrapCol(
                                      invisibleForSizes: "sm xs",
                                      sizes: 'col-8',
                                      child:
                                          BootstrapRow(children: <BootstrapCol>[
                                        BootstrapCol(
                                            sizes: 'col-12 col-md-8',
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Container(
                                                child: AutoSizeText(
                                                  'รายการ',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color.fromARGB(
                                                        255, 104, 104, 104),
                                                  ),
                                                  minFontSize: 14,
                                                ),
                                              ),
                                            )),
                                        BootstrapCol(
                                            sizes: 'col-12 col-md-4',
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Container(
                                                child: AutoSizeText(
                                                  'ราคา',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Color.fromARGB(
                                                        255, 104, 104, 104),
                                                  ),
                                                  minFontSize: 14,
                                                ),
                                              ),
                                            )),
                                      ])),
                                ],
                              ),

                              //รายการ2

                              Padding(
                                padding: const EdgeInsets.only(top: 35),
                                child: BootstrapRow(
                                  children: <BootstrapCol>[
                                    BootstrapCol(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      sizes: ' col-4',
                                      child: Center(
                                        child: Container(
                                            color: Colors.blue,
                                            child: Image.asset(
                                                "images/book1.jpg",
                                                fit: BoxFit.cover,
                                                width: 130,
                                                height: 180)),
                                      ),
                                    ),
                                    BootstrapCol(
                                        sizes: 'col-8',
                                        child: BootstrapRow(children: <
                                            BootstrapCol>[
                                          BootstrapCol(
                                            sizes:
                                                'col-12 col-xs-12 col-sm-12 col-md-8',
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Column(
                                                children: [
                                                  Container(
                                                      child: SizedBox(
                                                    width: double.infinity,
                                                    child: AutoSizeText(
                                                      'การออกแบบระบบไฟฟ้า (ปวส.ปวช.) ฉบับที่2',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black),
                                                      minFontSize: 14,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  )),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 30,
                                                            bottom: 20),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          // ignore: prefer_const_literals_to_create_immutables
                                                          children: [
                                                            //จำนวน
                                                            SizedBox(
                                                              child:
                                                                  AutoSizeText(
                                                                'จำนวน :',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    color: Colors
                                                                        .black),
                                                                minFontSize: 14,
                                                              ),
                                                            ),
                                                            //ลบ
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 20,
                                                                right: 10,
                                                              ),
                                                              child: InkWell(
                                                                onTap: () {},
                                                                child:
                                                                    Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.blue,
                                                                          borderRadius:
                                                                              BorderRadius.circular(50),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(4.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.remove,
                                                                            size:
                                                                                17,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        )),
                                                              ),
                                                            ),
                                                            //ช่องกรอก

                                                            Container(
                                                              width: 40,
                                                              child: Text(
                                                                "1",
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ),
                                                            //บวก
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                left: 10,
                                                                right: 20,
                                                              ),
                                                              child: InkWell(
                                                                onTap: () {},
                                                                child:
                                                                    Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.blue,
                                                                          borderRadius:
                                                                              BorderRadius.circular(50),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              const EdgeInsets.all(4.0),
                                                                          child:
                                                                              Icon(
                                                                            Icons.add,
                                                                            size:
                                                                                17,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        )),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          BootstrapCol(
                                            sizes:
                                                'col-12 col-xs-12 col-sm-12 col-md-4',
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              child: Column(
                                                // ignore: prefer_const_literals_to_create_immutables
                                                children: [
                                                  SizedBox(
                                                    width: double.infinity,
                                                    child: AutoSizeText(
                                                      '900.00 บาท',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                      minFontSize: 14,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 20),
                                                    child: InkWell(
                                                      onTap: () {},
                                                      child: Container(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          // ignore: prefer_const_literals_to_create_immutables
                                                          children: [
                                                            Icon(
                                                              Icons.delete,
                                                              color: Colors.red,
                                                            ),
                                                            AutoSizeText(
                                                              'ลบรายการ',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                              minFontSize: 14,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ])),
                                  ],
                                ),
                              ),
                              //เส้น
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 30, 0, 20),
                                child: SizedBox(
                                  height: 1,
                                  width: double.infinity,
                                  child: ColoredBox(color: Colors.black12),
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      size: 15,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        child: AutoSizeText(
                                          'เลือกดูสินค้าต่อ',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.blue,
                                          ),
                                          minFontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                    BootstrapCol(
                        //  invisibleForSizes: "sm xs md ",
                        sizes: 'col-12   col-sm-12 col-md-12 col-lg-4',
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 20, bottom: 80),
                            child: Center(
                              child: Container(
                                  height: 400,
                                  width: 375,
                                  //  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 101, 188, 231),
                                      borderRadius: BorderRadius.circular(32),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 5,
                                            color:
                                                Color.fromARGB(255, 29, 29, 29)
                                                    .withOpacity(.30),
                                            offset: Offset(-10, 20))
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 380,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              boxShadow: [
                                                BoxShadow(
                                                    blurRadius: 5,
                                                    color: Color.fromARGB(
                                                            255, 29, 29, 29)
                                                        .withOpacity(.3),
                                                    offset: Offset(0, 0))
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0,
                                                          right: 0,
                                                          left: 0),
                                                  child: BootstrapRow(
                                                      children: <BootstrapCol>[
                                                        BootstrapCol(
                                                          sizes: 'col-12 ',
                                                          child: Container(
                                                            child: Row(
                                                              // ignore: prefer_const_literals_to_create_immutables
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          10),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color.fromARGB(
                                                                          255,
                                                                          101,
                                                                          188,
                                                                          231),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .receipt_long,
                                                                        color: Colors
                                                                            .white,
                                                                        size:
                                                                            18,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                AutoSizeText(
                                                                  'สรุปยอด',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          22,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                  minFontSize:
                                                                      21,
                                                                  maxLines: 1,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ]),
                                                ),

                                                //เส้น
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 20, 0, 10),
                                                  child: SizedBox(
                                                    height: 1,
                                                    width: double.infinity,
                                                    child: ColoredBox(
                                                        color: Colors.black12),
                                                  ),
                                                ),

                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20),
                                                  child: Container(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 0),
                                                              child:
                                                                  AutoSizeText(
                                                                'รายการทั้งหมด',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                                minFontSize: 14,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 0),
                                                              child:
                                                                  AutoSizeText(
                                                                '2',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                                minFontSize: 14,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15),
                                                  child: Container(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      left: 0),
                                                              child:
                                                                  AutoSizeText(
                                                                'ยอดรวม',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                                minFontSize: 14,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      right: 0),
                                                              child:
                                                                  AutoSizeText(
                                                                '1,800.00',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                                minFontSize: 14,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                // Padding(
                                                //   padding:
                                                //       const EdgeInsets.only(top: 15),
                                                //   child: Container(
                                                //     decoration: BoxDecoration(
                                                //         color: Colors.white,
                                                //         borderRadius:
                                                //             BorderRadius.circular(5),
                                                //         boxShadow: [
                                                //           BoxShadow(
                                                //               blurRadius: 5,
                                                //               color: Color.fromARGB(
                                                //                       255, 29, 29, 29)
                                                //                   .withOpacity(.30),
                                                //               offset: Offset(-10, 10))
                                                //         ]),
                                                //     child: Padding(
                                                //       padding:
                                                //           const EdgeInsets.all(10.0),
                                                //       child: Row(
                                                //         mainAxisAlignment:
                                                //             MainAxisAlignment
                                                //                 .spaceBetween,
                                                //         children: [
                                                //           Container(
                                                //             child: Padding(
                                                //               padding:
                                                //                   const EdgeInsets.only(
                                                //                       left: 10),
                                                //               child: AutoSizeText(
                                                //                 'ยอดสุทธิ',
                                                //                 style: TextStyle(
                                                //                   fontSize: 18,
                                                //                   color: Colors.black,
                                                //                 ),
                                                //                 minFontSize: 14,
                                                //               ),
                                                //             ),
                                                //           ),
                                                //           Container(
                                                //             child: Padding(
                                                //               padding:
                                                //                   const EdgeInsets.only(
                                                //                       right: 10),
                                                //               child: AutoSizeText(
                                                //                 '1800.00',
                                                //                 style: TextStyle(
                                                //                   fontSize: 18,
                                                //                   color: Colors.black,
                                                //                 ),
                                                //                 minFontSize: 14,
                                                //               ),
                                                //             ),
                                                //           ),
                                                //         ],
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 120),
                                                  child: InkWell(
                                                    onTap: () {
                                                      Navigator.of(context)
                                                          .pushNamed(
                                                              Check_Out_Page
                                                                  .route);
                                                    },
                                                    child: Card(
                                                      shadowColor: Colors.black,
                                                      elevation: 2,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                      clipBehavior:
                                                          Clip.antiAlias,
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
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 0),
                                                                  child:
                                                                      AutoSizeText(
                                                                    'สั่งซื้อสินค้า',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        color: Colors
                                                                            .white),
                                                                    minFontSize:
                                                                        14,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                child: Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            10),
                                                                    child: Icon(
                                                                      Icons
                                                                          .arrow_forward,
                                                                      color: Colors
                                                                          .white,
                                                                    )),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ))),
                  ],
                ),
              ])
        ]),
      ),
    );
  }
}
