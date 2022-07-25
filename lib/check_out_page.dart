// ignore_for_file: camel_case_types, depend_on_referenced_packages, prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:iconsax/iconsax.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sell_books_web/button_dropdown/district_dropdown.dart';
import 'package:sell_books_web/button_dropdown/district_tambon_dropdown.dart';
import 'package:sell_books_web/button_dropdown/province_dropdown.dart';
import 'package:sell_books_web/thank_shop.dart';

import 'package:sell_books_web/widget/nav_widget/drawers.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';

class Check_Out_Page extends StatefulWidget {
  Check_Out_Page({Key? key}) : super(key: key);
  static const String route = '/checkout';
  static const String _title = 'Flutter Code Sample';

  @override
  State<Check_Out_Page> createState() => _Check_Out_PageState();
}

enum SingingCharacter { lafayette, jefferson }

class _Check_Out_PageState extends State<Check_Out_Page> {
  @override
  SingingCharacter? _character = SingingCharacter.lafayette;

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
                                        Icons.location_on,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                AutoSizeText(
                                  'ที่อยู่ในการจัดส่ง',
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

                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 0,
                                  right: 20,
                                  left: 20,
                                ),
                                child: BootstrapRow(children: <BootstrapCol>[
                                  BootstrapCol(
                                    sizes: 'col-12 ',
                                    child: Container(
                                      child: Row(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 101, 188, 231),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(7.0),
                                                child: Icon(
                                                  Icons.house,
                                                  color: Colors.white,
                                                  size: 17,
                                                ),
                                              ),
                                            ),
                                          ),
                                          AutoSizeText(
                                            'ข้อมูลผู้สั่งซื้อ :',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                            minFontSize: 17,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ]),
                              ),

                              //รายการ1

                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: BootstrapRow(
                                  children: <BootstrapCol>[
                                    BootstrapCol(
                                        sizes: 'col-12 col-md-6',
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 20),
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                SizedBox(
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 5,
                                                  ),
                                                  child: Container(
                                                    child: Container(
                                                      child: TextFormField(
                                                        controller:
                                                            TextEditingController()
                                                              ..text =
                                                                  'พิเชฐศักดิ์ ดุเหว่า',
                                                        cursorColor:
                                                            Colors.black,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          // focusedBorder: InputBorder.none,
                                                          // enabledBorder: InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          disabledBorder:
                                                              InputBorder.none,
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      15.0,
                                                                      18.0,
                                                                      0.0,
                                                                      10.0),

                                                          // fillColor: Color.fromARGB(31, 161, 161, 161),
                                                          // filled: true,

                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    BootstrapCol(
                                        sizes: 'col-12 col-md-6',
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 20),
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                SizedBox(
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
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 5,
                                                  ),
                                                  child: Container(
                                                    child: Container(
                                                      child: TextFormField(
                                                        controller:
                                                            TextEditingController()
                                                              ..text =
                                                                  '09324303691',
                                                        cursorColor:
                                                            Colors.black,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          // focusedBorder: InputBorder.none,
                                                          // enabledBorder: InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          disabledBorder:
                                                              InputBorder.none,
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      15.0,
                                                                      18.0,
                                                                      0.0,
                                                                      10.0),

                                                          // fillColor: Color.fromARGB(31, 161, 161, 161),
                                                          // filled: true,

                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    BootstrapCol(
                                        sizes: 'col-12 col-md-6',
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 20),
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: AutoSizeText(
                                                    'จังหวัด',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                    minFontSize: 14,
                                                  ),
                                                ),
                                                // Padding(
                                                //   padding:
                                                //       const EdgeInsets.only(
                                                //     top: 5,
                                                //   ),
                                                //   child: Container(
                                                //     child: Container(
                                                //       child: TextFormField(
                                                //         controller:
                                                //             TextEditingController()
                                                //               ..text = 'พะเยา',
                                                //         cursorColor:
                                                //             Colors.black,
                                                //         style: TextStyle(
                                                //             color:
                                                //                 Colors.black),
                                                //         decoration:
                                                //             InputDecoration(
                                                //           border:
                                                //               InputBorder.none,
                                                //           // focusedBorder: InputBorder.none,
                                                //           // enabledBorder: InputBorder.none,
                                                //           errorBorder:
                                                //               InputBorder.none,
                                                //           disabledBorder:
                                                //               InputBorder.none,
                                                //           isDense: true,
                                                //           contentPadding:
                                                //               EdgeInsets
                                                //                   .fromLTRB(
                                                //                       15.0,
                                                //                       18.0,
                                                //                       0.0,
                                                //                       10.0),

                                                //           // fillColor: Color.fromARGB(31, 161, 161, 161),
                                                //           // filled: true,

                                                //           focusedBorder:
                                                //               OutlineInputBorder(
                                                //             borderSide:
                                                //                 const BorderSide(
                                                //                     color: Colors
                                                //                         .black12,
                                                //                     width: 1),
                                                //             borderRadius:
                                                //                 BorderRadius
                                                //                     .circular(
                                                //                         5.0),
                                                //           ),
                                                //           enabledBorder:
                                                //               OutlineInputBorder(
                                                //             borderSide:
                                                //                 BorderSide(
                                                //                     color: Colors
                                                //                         .black12,
                                                //                     width: 1),
                                                //             borderRadius:
                                                //                 BorderRadius
                                                //                     .circular(
                                                //                         5),
                                                //           ),
                                                //         ),
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),

                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Container(
                                                      height: 40,
                                                      child: Province()),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    BootstrapCol(
                                        sizes: 'col-12 col-md-6',
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 20),
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: AutoSizeText(
                                                    'อำเภอ',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                    minFontSize: 14,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 5,
                                                  ),
                                                  child: Container(
                                                    child: Container(
                                                      // child: TextFormField(
                                                      //   controller:
                                                      //       TextEditingController()
                                                      //         ..text =
                                                      //             'ภูกามยาว',
                                                      //   cursorColor:
                                                      //       Colors.black,
                                                      //   style: TextStyle(
                                                      //       color:
                                                      //           Colors.black),
                                                      //   decoration:
                                                      //       InputDecoration(
                                                      //     border:
                                                      //         InputBorder.none,
                                                      //     // focusedBorder: InputBorder.none,
                                                      //     // enabledBorder: InputBorder.none,
                                                      //     errorBorder:
                                                      //         InputBorder.none,
                                                      //     disabledBorder:
                                                      //         InputBorder.none,
                                                      //     isDense: true,
                                                      //     contentPadding:
                                                      //         EdgeInsets
                                                      //             .fromLTRB(
                                                      //                 15.0,
                                                      //                 18.0,
                                                      //                 0.0,
                                                      //                 10.0),

                                                      //     // fillColor: Color.fromARGB(31, 161, 161, 161),
                                                      //     // filled: true,

                                                      //     focusedBorder:
                                                      //         OutlineInputBorder(
                                                      //       borderSide:
                                                      //           const BorderSide(
                                                      //               color: Colors
                                                      //                   .black12,
                                                      //               width: 1),
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   5.0),
                                                      //     ),
                                                      //     enabledBorder:
                                                      //         OutlineInputBorder(
                                                      //       borderSide:
                                                      //           BorderSide(
                                                      //               color: Colors
                                                      //                   .black12,
                                                      //               width: 1),
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   5),
                                                      //     ),
                                                      //   ),
                                                      // ),

                                                      child: Container(
                                                          height: 40,
                                                          child: District()),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    BootstrapCol(
                                        sizes: 'col-12 col-md-6',
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 20),
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: AutoSizeText(
                                                    'ตำบล',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                    minFontSize: 14,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 5,
                                                  ),
                                                  child: Container(
                                                    child: Container(
                                                      // child: TextFormField(
                                                      //   controller:
                                                      //       TextEditingController()
                                                      //         ..text = 'ดงเจน',
                                                      //   cursorColor:
                                                      //       Colors.black,
                                                      //   style: TextStyle(
                                                      //       color:
                                                      //           Colors.black),
                                                      //   decoration:
                                                      //       InputDecoration(
                                                      //     border:
                                                      //         InputBorder.none,
                                                      //     // focusedBorder: InputBorder.none,
                                                      //     // enabledBorder: InputBorder.none,
                                                      //     errorBorder:
                                                      //         InputBorder.none,
                                                      //     disabledBorder:
                                                      //         InputBorder.none,
                                                      //     isDense: true,
                                                      //     contentPadding:
                                                      //         EdgeInsets
                                                      //             .fromLTRB(
                                                      //                 15.0,
                                                      //                 18.0,
                                                      //                 0.0,
                                                      //                 10.0),

                                                      //     // fillColor: Color.fromARGB(31, 161, 161, 161),
                                                      //     // filled: true,

                                                      //     focusedBorder:
                                                      //         OutlineInputBorder(
                                                      //       borderSide:
                                                      //           const BorderSide(
                                                      //               color: Colors
                                                      //                   .black12,
                                                      //               width: 1),
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   5.0),
                                                      //     ),
                                                      //     enabledBorder:
                                                      //         OutlineInputBorder(
                                                      //       borderSide:
                                                      //           BorderSide(
                                                      //               color: Colors
                                                      //                   .black12,
                                                      //               width: 1),
                                                      //       borderRadius:
                                                      //           BorderRadius
                                                      //               .circular(
                                                      //                   5),
                                                      //     ),
                                                      //   ),
                                                      // ),

                                                      child: Container(
                                                          height: 40,
                                                          child:
                                                              District_Tambon()),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    BootstrapCol(
                                        sizes: 'col-12 col-md-6',
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 20),
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: AutoSizeText(
                                                    'รหัสไปรษณีย์',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                    minFontSize: 14,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 5,
                                                  ),
                                                  child: Container(
                                                    child: Container(
                                                      child: TextFormField(
                                                        controller:
                                                            TextEditingController()
                                                              ..text = '56000',
                                                        cursorColor:
                                                            Colors.black,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          // focusedBorder: InputBorder.none,
                                                          // enabledBorder: InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          disabledBorder:
                                                              InputBorder.none,
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      15.0,
                                                                      18.0,
                                                                      0.0,
                                                                      10.0),

                                                          // fillColor: Color.fromARGB(31, 161, 161, 161),
                                                          // filled: true,

                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 0, right: 20, left: 20, bottom: 20),
                                child: BootstrapRow(children: <BootstrapCol>[
                                  BootstrapCol(
                                      sizes: 'col-12 ',
                                      child: Container(
                                          child: Column(
                                        children: [
                                          SizedBox(
                                            width: double.infinity,
                                            child: AutoSizeText(
                                              'ข้อมูลที่อยู่',
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
                                            child: Container(
                                              child: Container(
                                                child: TextFormField(
                                                  controller:
                                                      TextEditingController()
                                                        ..text = '',
                                                  cursorColor: Colors.black,
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    // focusedBorder: InputBorder.none,
                                                    // enabledBorder: InputBorder.none,
                                                    errorBorder:
                                                        InputBorder.none,
                                                    disabledBorder:
                                                        InputBorder.none,
                                                    isDense: true,
                                                    contentPadding:
                                                        EdgeInsets.fromLTRB(
                                                            15.0,
                                                            50,
                                                            0.0,
                                                            10.0),

                                                    // fillColor: Color.fromARGB(31, 161, 161, 161),
                                                    // filled: true,

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
                                                      borderSide: BorderSide(
                                                          color: Colors.black12,
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )))
                                ]),
                              ),

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

                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 0,
                                  right: 20,
                                  left: 20,
                                ),
                                child: BootstrapRow(children: <BootstrapCol>[
                                  BootstrapCol(
                                    sizes: 'col-12 ',
                                    child: Container(
                                      child: Row(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 101, 188, 231),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(7.0),
                                                child: Icon(
                                                  Iconsax.send_21,
                                                  color: Colors.white,
                                                  size: 17,
                                                ),
                                              ),
                                            ),
                                          ),
                                          AutoSizeText(
                                            'ประเภทการจัดส่ง :',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                            minFontSize: 17,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ]),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: BootstrapRow(
                                  children: <BootstrapCol>[
                                    BootstrapCol(
                                        sizes: 'col-12 col-md-6',
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: AutoSizeText(
                                                    'เลือกประเภทการจัดส่ง',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                    minFontSize: 14,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Container(
                                                    child: Column(
                                                      children: <Widget>[
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            101,
                                                                            188,
                                                                            231),
                                                                  ),
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          231,
                                                                          243,
                                                                          250),
                                                                  //   color: Colors
                                                                  //        .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  // ignore: prefer_const_literals_to_create_immutables
                                                                  boxShadow: [
                                                                // BoxShadow(
                                                                //     blurRadius: 5,
                                                                //     color:
                                                                //         Color.fromARGB(255, 29, 29, 29)
                                                                //             .withOpacity(.3),
                                                                //     offset: Offset(-10, 20))
                                                              ]),
                                                          child: Column(
                                                            children: [
                                                              ListTile(
                                                                title:
                                                                    const Text(
                                                                  'ไปรษณีย์',
                                                                ),
                                                                subtitle: Text(
                                                                  'ราคาจัดส่ง 40 บาท',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          13),
                                                                ),
                                                                leading: Radio<
                                                                    SingingCharacter>(
                                                                  value: SingingCharacter
                                                                      .lafayette,
                                                                  groupValue:
                                                                      _character,
                                                                  onChanged:
                                                                      (SingingCharacter?
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      _character =
                                                                          value;
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 10),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .black12,
                                                                    ),
                                                                    //    color: Color.fromARGB(255, 101, 188, 231),
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    // ignore: prefer_const_literals_to_create_immutables
                                                                    boxShadow: [
                                                                  // BoxShadow(
                                                                  //     blurRadius: 5,
                                                                  //     color:
                                                                  //         Color.fromARGB(255, 29, 29, 29)
                                                                  //             .withOpacity(.3),
                                                                  //     offset: Offset(-10, 20))
                                                                ]),
                                                            child: ListTile(
                                                              title: const Text(
                                                                  'เดลิเวอร์ลี่'),
                                                              subtitle: Text(
                                                                'ราคาจัดส่ง 70 บาท',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                              leading: Radio<
                                                                  SingingCharacter>(
                                                                value: SingingCharacter
                                                                    .jefferson,
                                                                groupValue:
                                                                    _character,
                                                                onChanged:
                                                                    (SingingCharacter?
                                                                        value) {
                                                                  setState(() {
                                                                    _character =
                                                                        value;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ),
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
                                        sizes: 'col-12 col-md-6',
                                        child: Container()),
                                  ],
                                ),
                              ),

                              //เส้น
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
                                padding: const EdgeInsets.only(
                                  top: 0,
                                  right: 20,
                                  left: 20,
                                ),
                                child: BootstrapRow(children: <BootstrapCol>[
                                  BootstrapCol(
                                    sizes: 'col-12 ',
                                    child: Container(
                                      child: Row(
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 101, 188, 231),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(7.0),
                                                child: Icon(
                                                  Icons.attach_money,
                                                  color: Colors.white,
                                                  size: 17,
                                                ),
                                              ),
                                            ),
                                          ),
                                          AutoSizeText(
                                            'วิธีการชำระเงิน :',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w400),
                                            minFontSize: 17,
                                            maxLines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ]),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: BootstrapRow(
                                  children: <BootstrapCol>[
                                    BootstrapCol(
                                        sizes: 'col-12 col-md-6',
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: AutoSizeText(
                                                    'เลือกวิธีการชำระเงิน',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                    minFontSize: 14,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Container(
                                                    child: Column(
                                                      children: <Widget>[
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            101,
                                                                            188,
                                                                            231),
                                                                  ),
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          231,
                                                                          243,
                                                                          250),
                                                                  //   color: Colors
                                                                  //        .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  // ignore: prefer_const_literals_to_create_immutables
                                                                  boxShadow: [
                                                                // BoxShadow(
                                                                //     blurRadius: 5,
                                                                //     color:
                                                                //         Color.fromARGB(255, 29, 29, 29)
                                                                //             .withOpacity(.3),
                                                                //     offset: Offset(-10, 20))
                                                              ]),
                                                          child: Column(
                                                            children: [
                                                              ListTile(
                                                                title:
                                                                    const Text(
                                                                  'พร้อมเพย์',
                                                                ),
                                                                trailing: Icon(
                                                                  Ionicons
                                                                      .qr_code_outline,
                                                                  color: Colors
                                                                      .blue,
                                                                ),
                                                                leading: Radio<
                                                                    SingingCharacter>(
                                                                  value: SingingCharacter
                                                                      .lafayette,
                                                                  groupValue:
                                                                      _character,
                                                                  onChanged:
                                                                      (SingingCharacter?
                                                                          value) {
                                                                    setState(
                                                                        () {
                                                                      _character =
                                                                          value;
                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 10),
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: Colors
                                                                          .black12,
                                                                    ),
                                                                    //    color: Color.fromARGB(255, 101, 188, 231),
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    // ignore: prefer_const_literals_to_create_immutables
                                                                    boxShadow: [
                                                                  // BoxShadow(
                                                                  //     blurRadius: 5,
                                                                  //     color:
                                                                  //         Color.fromARGB(255, 29, 29, 29)
                                                                  //             .withOpacity(.3),
                                                                  //     offset: Offset(-10, 20))
                                                                ]),
                                                            child: ListTile(
                                                              title: const Text(
                                                                  'เครดิต/เดบิต'),
                                                              trailing: Icon(
                                                                  Ionicons
                                                                      .card_outline),
                                                              leading: Radio<
                                                                  SingingCharacter>(
                                                                value: SingingCharacter
                                                                    .jefferson,
                                                                groupValue:
                                                                    _character,
                                                                onChanged:
                                                                    (SingingCharacter?
                                                                        value) {
                                                                  setState(() {
                                                                    _character =
                                                                        value;
                                                                  });
                                                                },
                                                              ),
                                                            ),
                                                          ),
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
                                        sizes: 'col-12 col-md-6',
                                        child: Container()),
                                  ],
                                ),
                              ),

                              //เครดิต/เดบิต
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 40,
                                  right: 20,
                                  left: 20,
                                ),
                                child: BootstrapRow(children: <BootstrapCol>[
                                  BootstrapCol(
                                    sizes: 'col-12 ',
                                    child: Container(
                                      child: AutoSizeText(
                                        'ชำระเงินแบบ : เครดิต/เดบิต',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                        minFontSize: 15,
                                        maxLines: 1,
                                      ),
                                    ),
                                  )
                                ]),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: BootstrapRow(
                                  children: <BootstrapCol>[
                                    BootstrapCol(
                                        sizes: 'col-12 col-md-6 col-sm-12',
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Container(
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .black12),
                                                                  color: Colors
                                                                      .white,
                                                                  //   color: Colors
                                                                  //        .white,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  // ignore: prefer_const_literals_to_create_immutables
                                                                  boxShadow: [
                                                                // BoxShadow(
                                                                //     blurRadius: 5,
                                                                //     color:
                                                                //         Color.fromARGB(255, 29, 29, 29)
                                                                //             .withOpacity(.3),
                                                                //     offset: Offset(-10, 20))
                                                              ]),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            // ignore: prefer_const_literals_to_create_immutables
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            15),
                                                                child:
                                                                    AutoSizeText(
                                                                  'ประเภทบัตร',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .black),
                                                                  minFontSize:
                                                                      14,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            15),
                                                                child:
                                                                    Container(
                                                                  child: Row(
                                                                      children: [
                                                                        SvgPicture
                                                                            .asset(
                                                                          "images/visa.svg",
                                                                          width:
                                                                              45,
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.only(
                                                                              left: 5,
                                                                              right: 5),
                                                                          child:
                                                                              SvgPicture.asset(
                                                                            "images/jcb.svg",
                                                                            width:
                                                                                45,
                                                                          ),
                                                                        ),
                                                                        SvgPicture
                                                                            .asset(
                                                                          "images/mt.svg",
                                                                          width:
                                                                              45,
                                                                        ),
                                                                      ]),
                                                                ),
                                                              )
                                                            ],
                                                          ),
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
                                        sizes: 'col-12 col-md-6',
                                        child: Container()),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: BootstrapRow(
                                  children: <BootstrapCol>[
                                    BootstrapCol(
                                        sizes: 'col-12 col-md-6',
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 20),
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: AutoSizeText(
                                                    'ชื่อที่ปรากฏบนบัตร',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                    minFontSize: 14,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 5,
                                                  ),
                                                  child: Container(
                                                    child: Container(
                                                      child: TextFormField(
                                                        controller:
                                                            TextEditingController()
                                                              ..text =
                                                                  'PICHATSAK DUWAO',
                                                        cursorColor:
                                                            Colors.black,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          // focusedBorder: InputBorder.none,
                                                          // enabledBorder: InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          disabledBorder:
                                                              InputBorder.none,
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      15.0,
                                                                      18.0,
                                                                      0.0,
                                                                      10.0),

                                                          // fillColor: Color.fromARGB(31, 161, 161, 161),
                                                          // filled: true,

                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    BootstrapCol(
                                        sizes: 'col-12 col-md-6',
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 20),
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: AutoSizeText(
                                                    'หมายเลขบัตร',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                    minFontSize: 14,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 5,
                                                  ),
                                                  child: Container(
                                                    child: Container(
                                                      child: TextFormField(
                                                        controller:
                                                            TextEditingController()
                                                              ..text =
                                                                  '99-99-9-9999-99',
                                                        cursorColor:
                                                            Colors.black,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          // focusedBorder: InputBorder.none,
                                                          // enabledBorder: InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          disabledBorder:
                                                              InputBorder.none,
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      15.0,
                                                                      18.0,
                                                                      0.0,
                                                                      10.0),

                                                          // fillColor: Color.fromARGB(31, 161, 161, 161),
                                                          // filled: true,

                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    BootstrapCol(
                                        sizes: 'col-12 col-md-6',
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 20),
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: AutoSizeText(
                                                    'วันหมดอายุ',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                    minFontSize: 14,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 5,
                                                  ),
                                                  child: Container(
                                                    child: Container(
                                                      child: TextFormField(
                                                        controller:
                                                            TextEditingController()
                                                              ..text = '99/99',
                                                        cursorColor:
                                                            Colors.black,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          // focusedBorder: InputBorder.none,
                                                          // enabledBorder: InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          disabledBorder:
                                                              InputBorder.none,
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      15.0,
                                                                      18.0,
                                                                      0.0,
                                                                      10.0),

                                                          // fillColor: Color.fromARGB(31, 161, 161, 161),
                                                          // filled: true,

                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                    BootstrapCol(
                                        sizes: 'col-12 col-md-6',
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                bottom: 20),
                                            child: Column(
                                              // ignore: prefer_const_literals_to_create_immutables
                                              children: [
                                                Row(
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    SizedBox(
                                                      child: AutoSizeText(
                                                        'CVV',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                Colors.black),
                                                        minFontSize: 14,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5),
                                                      child: InkWell(
                                                          onTap: () {},
                                                          child:
                                                              SvgPicture.asset(
                                                            "images/qs.svg",
                                                            color:
                                                                Colors.black54,
                                                            width: 15,
                                                          )),
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 5,
                                                  ),
                                                  child: Container(
                                                    child: Container(
                                                      child: TextFormField(
                                                        controller:
                                                            TextEditingController()
                                                              ..text = '999',
                                                        cursorColor:
                                                            Colors.black,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.black),
                                                        decoration:
                                                            InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          // focusedBorder: InputBorder.none,
                                                          // enabledBorder: InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          disabledBorder:
                                                              InputBorder.none,
                                                          isDense: true,
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .fromLTRB(
                                                                      15.0,
                                                                      18.0,
                                                                      0.0,
                                                                      10.0),

                                                          // fillColor: Color.fromARGB(31, 161, 161, 161),
                                                          // filled: true,

                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .black12,
                                                                    width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                                  ],
                                ),
                              ),

                              //เส้น
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                                child: SizedBox(
                                  height: 1,
                                  width: double.infinity,
                                  child: ColoredBox(color: Colors.black12),
                                ),
                              ),

                              SizedBox(
                                height: 0,
                              )
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
                                  height: 450,
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
                                                    .withOpacity(.3),
                                            offset: Offset(-10, 20))
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 430,
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
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 20,
                                                    right: 15,
                                                    left: 15),
                                                child: BootstrapRow(
                                                    children: <BootstrapCol>[
                                                      BootstrapCol(
                                                        sizes: 'col-12 ',
                                                        child: Container(
                                                          child: Row(
                                                            // ignore: prefer_const_literals_to_create_immutables
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        right:
                                                                            10),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color
                                                                        .fromARGB(
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
                                                                    child: Icon(
                                                                      Icons
                                                                          .receipt,
                                                                      color: Colors
                                                                          .white,
                                                                      size: 18,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              AutoSizeText(
                                                                'บิลของฉัน',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        22,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                                minFontSize: 21,
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
                                                        15, 20, 15, 10),
                                                child: SizedBox(
                                                  height: 1,
                                                  width: double.infinity,
                                                  child: ColoredBox(
                                                      color: Colors.black12),
                                                ),
                                              ),

                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10),
                                                child: Container(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
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
                                                                    left: 10),
                                                            child: AutoSizeText(
                                                              'ยอดรวมสินค้า',
                                                              style: TextStyle(
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
                                                                    right: 10),
                                                            child: AutoSizeText(
                                                              '1,800.00',
                                                              style: TextStyle(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0),
                                                child: Container(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
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
                                                                    left: 10),
                                                            child: AutoSizeText(
                                                              'รวมการจัดส่ง',
                                                              style: TextStyle(
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
                                                                    right: 10),
                                                            child: AutoSizeText(
                                                              '40.00',
                                                              style: TextStyle(
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
                                                padding: const EdgeInsets.only(
                                                    top: 0),
                                                child: Container(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
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
                                                                    left: 10),
                                                            child: AutoSizeText(
                                                              'การชำระเงินทั้งหมด',
                                                              style: TextStyle(
                                                                  fontSize: 18,
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
                                                                    right: 10),
                                                            child: AutoSizeText(
                                                              '1,840.00',
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .redAccent,
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

                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 110,
                                                    left: 15,
                                                    right: 15),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.of(context)
                                                        .pushNamed(Thankyou_Shop
                                                            .route);
                                                  },
                                                  child: Card(
                                                    shadowColor: Colors.black,
                                                    elevation: 2,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
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
                                                                padding:
                                                                    const EdgeInsets
                                                                            .only(
                                                                        left:
                                                                            0),
                                                                child:
                                                                    AutoSizeText(
                                                                  'ยืนยันการสั่งซื้อ',
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
                                                                      left: 10),
                                                                  child: Icon(
                                                                    Icons
                                                                        .shopping_cart,
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
                                        )
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
