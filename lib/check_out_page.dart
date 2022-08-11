// ignore_for_file: camel_case_types, depend_on_referenced_packages, prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:sell_books_web/global.dart';
import 'package:sell_books_web/models/AmphureModel.dart';
import 'package:sell_books_web/models/DeliTypeModel.dart';
import 'package:sell_books_web/models/ProvinceModel.dart';
import 'package:sell_books_web/models/TumbonModel.dart';
import 'package:sell_books_web/tools/text_format_ultil.dart';
import 'package:sell_books_web/dialog/dialog_web.dart';

import 'package:sell_books_web/widget/nav_widget/drawers.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';
import 'package:http/http.dart' as http;
import 'package:sell_books_web/widget/validateBuy.dart';
import 'package:validators/validators.dart';

class Check_Out_Page extends StatefulWidget {
  Check_Out_Page({Key? key}) : super(key: key);
  static const String route = '/checkout';

  @override
  State<Check_Out_Page> createState() => _Check_Out_PageState();
}

enum SingingCharacter { lafayette, jefferson }

InputDecoration styleInput = InputDecoration(
  border: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
  isDense: true,
  contentPadding: EdgeInsets.fromLTRB(15.0, 18.0, 0.0, 10.0),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black12, width: 1),
    borderRadius: BorderRadius.circular(5.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black12, width: 1),
    borderRadius: BorderRadius.circular(5),
  ),
);

InputDecoration styleInputSelect = InputDecoration(
  border: InputBorder.none,
  disabledBorder: InputBorder.none,
  isDense: true,
  contentPadding: EdgeInsets.fromLTRB(15.0, 18.0, 0.0, 10.0),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black12, width: 1),
    borderRadius: BorderRadius.circular(5.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black12, width: 1),
    borderRadius: BorderRadius.circular(5),
  ),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.red, width: 1)),
  focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: Colors.red, width: 1)),
);

class _Check_Out_PageState extends State<Check_Out_Page> {
  var formatter = NumberFormat('#,###,##0.00');
  int? _typePay = 2;
  int? _typePayMb = 1;
  final box = GetStorage();
  int totalAll = 0;
  int numAll = 0;
  List<DeliTypeModel> deliAll = [];
  int groupValue = 1;
  int totalDeli = 0;
  int totalFinal = 0;

  List<ProvinceModel> itemsProv = [];

  List<AmphureModel> itemsAmp = [];

  List<TumbonModel> itemsDict = [];

  String? selectedValueProv;
  String? selectedValueAmp;
  String? selectedValueDict;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController postCode = TextEditingController();
  TextEditingController adr = TextEditingController();

  @override
  void initState() {
    getCartAll();
    getTypeDeli();
    getProvince();
    super.initState();
  }

  Future<void> getProvince() async {
    var url = "${Global.hostName}/province.php";
    var res = await http.get(Uri.parse(url));
    itemsProv = provinceModelFromJson(res.body);
  }

  Future<void> getAmphur(String? provIdGet) async {
    var url = "${Global.hostName}/amphure.php?prov_id=$provIdGet";
    var res = await http.get(Uri.parse(url));
    itemsAmp = amphureModelFromJson(res.body);
    setState(() {});
  }

  Future<void> getDict(String? ampIdGet) async {
    var url = "${Global.hostName}/dictrict.php?amp_id=$ampIdGet";
    var res = await http.get(Uri.parse(url));
    itemsDict = tumbonModelFromJson(res.body);
    setState(() {});
  }

  void getPostCode(String dicId) {
    var count =
        itemsDict.where((c) => c.amphureId == int.parse(dicId)).toList().length;
    postCode.text = itemsDict[count].zipCode.toString();
    setState(() {});
  }

  Future<void> getTypeDeli() async {
    var url = "${Global.hostName}/deli_all.php";
    var res = await http.get(Uri.parse(url));
    deliAll = [];
    await json.decode(res.body)['data'].map((data) {
      deliAll.add(DeliTypeModel(
          deliveryId: data["delivery_id"],
          deliveryName: data["delivery_name"],
          deliveryPrice: data["delivery_price"],
          deliveryCreate: data["delivery_create"],
          deliveryUpdate: data["delivery_update"]));
    }).toList();
    totalDeli = deliAll[0].deliveryPrice;
    totalFinal = totalAll + totalDeli;
    setState(() {});
  }

  Future<void> getCartAll() async {
    var url = "${Global.hostName}/cart_all.php?user_id=${box.read("user_id")}";
    var res = await http.get(Uri.parse(url));
    var getData = json.decode(res.body);
    if (getData["num"] > 0) {
      setState(() {
        totalAll = getData["total_cart"];
        numAll = getData["num"];
      });
    } else {
      setState(() {
        numAll = 0;
        totalAll = 0;
      });
    }
  }

  Future<void> checkStock() async {
    var url =
        "${Global.hostName}/check_stock.php?user_id=${box.read("user_id")}";
    var res = await http.get(Uri.parse(url));
    var getData = json.decode(res.body);
    showDialog(
        context: context,
        builder: (BuildContext context) => dialogErr(context,
            "สินค้าคงเหลือมีการเปลี่ยนแปลง \n กรุณาอัพเดทสินค้าในตะกร้าใหม่"));
    if (getData["status"] == "ok") {
    } else {}
  }

  void goTestPay() {
    checkStock();
    // if (formKey.currentState!.validate()) {
    //   checkStock
    // }
  }

  exampleCreateSource() async {}

  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);

    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        child: Column(children: [
          NavMainScreen(),
          BootstrapContainer(fluid: false, children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  headerView(),
                  BootstrapRow(
                    children: <BootstrapCol>[
                      BootstrapCol(
                        sizes: 'col-12 col-sm-12 col-md-12 col-lg-8',
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 0, right: 20, bottom: 40),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                contAdr(),
                                contDeliChoose(),
                                contPayChoose(),
                                _typePay == 2
                                    ? conFillCredit()
                                    : _typePay == 3
                                        ? conChooseMb()
                                        : Center()
                              ],
                            ),
                          ),
                        ),
                      ),
                      BootstrapCol(
                        //  invisibleForSizes: "sm xs md ",
                        sizes: 'col-12   col-sm-12 col-md-12 col-lg-4',
                        child: contFinal(),
                      ),
                    ],
                  )
                ],
              ),
            )
          ])
        ]),
      ),
    );
  }

  Widget conChooseMb() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
          child: SizedBox(
            height: 1,
            width: double.infinity,
            child: ColoredBox(color: Colors.black12),
          ),
        ),
        BootstrapRow(children: <BootstrapCol>[
          BootstrapCol(
            sizes: 'col-12 col-md-6',
            child: Container(
              margin: const EdgeInsets.only(
                  bottom: 10.0, left: 20, right: 10, top: 0),
              child: Container(
                decoration: _typePayMb == 1
                    ? BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 101, 188, 231),
                        ),
                        color: Color.fromARGB(255, 231, 243, 250),
                        borderRadius: BorderRadius.circular(5),
                      )
                    : BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                child: ListTile(
                  title: const Text(
                    'ธนาคารกสิกรไทย (K PLUS)',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Image.asset("images/kplus_icon.png"),
                  leading: Radio<int>(
                    value: 1,
                    groupValue: _typePayMb,
                    onChanged: (value) {
                      setState(() {
                        _typePayMb = value;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          BootstrapCol(
            sizes: 'col-12 col-md-6',
            child: Container(
              margin: const EdgeInsets.only(
                  bottom: 10.0, left: 20, right: 10, top: 0),
              child: Container(
                decoration: _typePayMb == 2
                    ? BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 101, 188, 231),
                        ),
                        color: Color.fromARGB(255, 231, 243, 250),
                        borderRadius: BorderRadius.circular(5),
                      )
                    : BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                child: ListTile(
                  title: const Text(
                    'ธนาคารไทยพาณิชย์ (SCB Easy)',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Image.asset("images/scb_icon.png"),
                  leading: Radio<int>(
                    value: 2,
                    groupValue: _typePayMb,
                    onChanged: (value) {
                      setState(() {
                        _typePayMb = value;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
          BootstrapCol(
            sizes: 'col-12 col-md-6',
            child: Container(
              margin: const EdgeInsets.only(
                  bottom: 10.0, left: 20, right: 10, top: 0),
              child: Container(
                decoration: _typePayMb == 3
                    ? BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 101, 188, 231),
                        ),
                        color: Color.fromARGB(255, 231, 243, 250),
                        borderRadius: BorderRadius.circular(5),
                      )
                    : BoxDecoration(
                        border: Border.all(
                          color: Colors.black12,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                child: ListTile(
                  title: const Text(
                    'ธนาคารกรุงศรีอยุธยา (KMA)',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Image.asset("images/kma_icon.png"),
                  leading: Radio<int>(
                    value: 3,
                    groupValue: _typePayMb,
                    onChanged: (value) {
                      setState(() {
                        _typePayMb = value;
                      });
                    },
                  ),
                ),
              ),
            ),
          )
        ])
      ],
    );
  }

  Widget conFillCredit() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
          child: SizedBox(
            height: 1,
            width: double.infinity,
            child: ColoredBox(color: Colors.black12),
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
                          left: 20, right: 20, bottom: 20),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: AutoSizeText(
                              'ชื่อที่ปรากฏบนบัตร',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
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
                                  cursorColor: Colors.black,
                                  style: TextStyle(color: Colors.black),
                                  decoration:
                                      ThemeValidCard().textInputDecoration(""),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "กรุณากรอกชื่อที่ปรากฏบนบัตร";
                                    }
                                    return null;
                                  },
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
                          left: 20, right: 20, bottom: 20),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: AutoSizeText(
                              'หมายเลขบัตร',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
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
                                  cursorColor: Colors.black,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(19),
                                    CreditCardFormatter(),
                                  ],
                                  style: TextStyle(color: Colors.black),
                                  decoration: ThemeValidCard()
                                      .textInputDecoration(
                                          "xxxx xxxx xxxx xxxx"),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "กรุณากรอกหมายเลขบัตร";
                                    } else if (val.length < 19) {
                                      return "หมายเลขบัตรไม่ครบ";
                                    }
                                    return null;
                                  },
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
                          left: 20, right: 20, bottom: 20),
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: AutoSizeText(
                              'วันหมดอายุ',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
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
                                  cursorColor: Colors.black,
                                  style: TextStyle(color: Colors.black),
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(7),
                                    ExpireCardFormatter(),
                                    // FilteringTextInputFormatter.deny(
                                    //     RegExp(r'[/]'))
                                  ],
                                  decoration: ThemeValidCard()
                                      .textInputDecoration("MM/YYYY"),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "กรุณากรอกวันหมดอายุ";
                                    } else if (val.length < 7) {
                                      return "วันหมดอายุไม่ถูกต้อง";
                                    }
                                    return null;
                                  },
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
                          left: 20, right: 20, bottom: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                child: AutoSizeText(
                                  'CVV',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  minFontSize: 14,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: InkWell(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      "images/qs.svg",
                                      color: Colors.black54,
                                      width: 15,
                                    )),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                            ),
                            child: Container(
                              child: Container(
                                child: TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(3),
                                    FilteringTextInputFormatter.allow(
                                        RegExp(r'[0-9]')),
                                  ],
                                  cursorColor: Colors.black,
                                  style: TextStyle(color: Colors.black),
                                  decoration: ThemeValidCard()
                                      .textInputDecoration("xxx"),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "กรุณากรอก CVV";
                                    } else if (val.length < 3) {
                                      return "กรุณากรอก CVV ให้ครบ";
                                    }
                                    return null;
                                  },
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
      ],
    );
  }

  Widget contFinal() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 80),
      child: Container(
        height: 450,
        width: 375,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 101, 188, 231),
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  color: Color.fromARGB(255, 29, 29, 29).withOpacity(.3),
                  offset: Offset(-10, 20))
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 430,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          color:
                              Color.fromARGB(255, 29, 29, 29).withOpacity(.3),
                          offset: Offset(0, 0))
                    ]),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, right: 15, left: 15),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 101, 188, 231),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.receipt,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                          AutoSizeText(
                            'บิลของฉัน',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w600),
                            minFontSize: 21,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),

                    //เส้น
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                      child: SizedBox(
                        height: 1,
                        width: double.infinity,
                        child: ColoredBox(color: Colors.black12),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, bottom: 10, right: 10, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: AutoSizeText(
                              'ยอดรวมสินค้า',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              minFontSize: 14,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: AutoSizeText(
                              formatter.format(totalAll),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              minFontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: AutoSizeText(
                              'ค่าจัดส่ง',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              minFontSize: 14,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: AutoSizeText(
                              formatter.format(totalDeli),
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              minFontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: AutoSizeText(
                              'ยอดที่ต้องชำระ',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                              minFontSize: 14,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: AutoSizeText(
                              formatter.format(totalFinal),
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.w600),
                              minFontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 110, left: 15, right: 15),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ))),
                        onPressed: () {
                          // _goPay();
                          goTestPay();
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 0),
                                  child: AutoSizeText(
                                    'ยืนยันการสั่งซื้อ',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                    minFontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget headerView() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 55, right: 20, bottom: 0),
      child: BootstrapRow(children: <BootstrapCol>[
        BootstrapCol(
            sizes: 'col-12',
            child: Container(
              child: Container(
                child: Row(
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
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                      minFontSize: 20,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ))
      ]),
    );
  }

  Widget contProvince() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: DropdownButtonFormField2(
        decoration: styleInputSelect,
        isExpanded: true,
        hint: Row(
          children: const [
            Expanded(
              child: Text(
                'เลือกจังหวัด',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Color.fromARGB(255, 104, 104, 104),
                ),
              ),
            ),
          ],
        ),
        items: itemsProv
            .map((item) => DropdownMenuItem<String>(
                  value: item.id.toString(),
                  child: Text(
                    item.nameTh,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedValueProv,
        onChanged: (value) {
          setState(() {
            selectedValueProv = value as String;
            selectedValueAmp = null;
            itemsAmp = [];
            selectedValueDict = null;
            itemsDict = [];
            getAmphur(selectedValueProv);
          });
        },
        validator: (value) {
          if (value == null) {
            return 'กรุณาเลือกจังหวัด';
          }
          return null;
        },
        onSaved: (value) {
          selectedValueProv = value.toString();
        },
        icon: const Icon(
          Icons.keyboard_arrow_down,
        ),
        buttonHeight: 25,
        buttonWidth: double.infinity,
        buttonPadding: const EdgeInsets.only(left: 0, right: 14),
        buttonDecoration: null,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 200,
        dropdownWidth: null,
        dropdownPadding: null,
        dropdownDecoration: null,
        dropdownElevation: 8,
        scrollbarRadius: const Radius.circular(5),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(0, 0),
      ),
    );
  }

  Widget contAmp() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
      ),
      child: DropdownButtonFormField2(
        decoration: styleInputSelect,
        isExpanded: true,
        hint: Row(
          children: const [
            Expanded(
              child: Text(
                'เลือกอำเภอ',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Color.fromARGB(255, 104, 104, 104),
                ),
              ),
            ),
          ],
        ),
        items: itemsAmp
            .map((item) => DropdownMenuItem<String>(
                  value: item.id.toString(),
                  child: Text(
                    item.nameTh,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedValueAmp,
        onChanged: (value) {
          setState(() {
            selectedValueAmp = value as String;
            selectedValueDict = null;
            itemsDict = [];
            getDict(selectedValueAmp);
          });
        },
        validator: (value) {
          if (value == null) {
            return 'กรุณาเลือกอำเภอ';
          }
          return null;
        },
        onSaved: (value) {
          selectedValueAmp = value.toString();
        },
        icon: const Icon(
          Icons.keyboard_arrow_down,
        ),
        iconEnabledColor: Colors.black,
        iconDisabledColor: Colors.black,
        buttonHeight: 25,
        buttonWidth: double.infinity,
        buttonPadding: const EdgeInsets.only(left: 0, right: 14),
        buttonDecoration: null,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 200,
        dropdownWidth: null,
        dropdownPadding: null,
        dropdownDecoration: null,
        dropdownElevation: 8,
        scrollbarRadius: const Radius.circular(5),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(0, 0),
      ),
    );
  }

  Widget contDict() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
      ),
      child: DropdownButtonFormField2(
        decoration: styleInputSelect,
        isExpanded: true,
        hint: Row(
          children: const [
            Expanded(
              child: Text(
                'เลือกตำบล',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Color.fromARGB(255, 104, 104, 104),
                ),
              ),
            ),
          ],
        ),
        items: itemsDict
            .map((item) => DropdownMenuItem<String>(
                  value: item.id.toString(),
                  child: Text(
                    item.nameTh,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w100,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedValueDict,
        onChanged: (value) {
          selectedValueDict = value as String;
          getPostCode(selectedValueDict.toString());
          setState(() {});
        },
        validator: (value) {
          if (value == null) {
            return 'กรุณาเลือกตำบล';
          }
          return null;
        },
        onSaved: (value) {
          selectedValueAmp = value.toString();
        },
        icon: const Icon(
          Icons.keyboard_arrow_down,
        ),
        iconEnabledColor: Colors.black,
        iconDisabledColor: Colors.black,
        buttonHeight: 25,
        buttonWidth: double.infinity,
        buttonPadding: const EdgeInsets.only(left: 0, right: 14),
        buttonDecoration: null,
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 200,
        dropdownWidth: null,
        dropdownPadding: null,
        dropdownDecoration: null,
        dropdownElevation: 8,
        scrollbarRadius: const Radius.circular(5),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(0, 0),
      ),
    );
  }

  Widget contAdr() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 101, 188, 231),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
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
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'ชื่อ - นามสกุล',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          minFontSize: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                          ),
                          child: TextFormField(
                            controller: name,
                            decoration: ThemeValidBuy().textInputDecoration(),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "กรุณากรอกชื่อ";
                              }
                              return null;
                            },
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  )),
              BootstrapCol(
                  sizes: 'col-12 col-md-6',
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'เบอร์โทรศัพท์',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          minFontSize: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                          ),
                          child: TextFormField(
                            controller: phone,
                            decoration: ThemeValidBuy().textInputDecoration(),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "กรุณากรอกเบอร์โทร";
                              } else if (!isLength(val, 9, 10)) {
                                return "กรอกเบอร์โทรไม่ถูกค้อง";
                              } else {
                                return null;
                              }
                            },
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  )),
              BootstrapCol(
                  sizes: 'col-12 col-md-6',
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'จังหวัด',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          minFontSize: 14,
                        ),
                        contProvince()
                      ],
                    ),
                  )),
              BootstrapCol(
                  sizes: 'col-12 col-md-6',
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'อำเภอ',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          minFontSize: 14,
                        ),
                        contAmp()
                      ],
                    ),
                  )),
              BootstrapCol(
                  sizes: 'col-12 col-md-6',
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'ตำบล',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          minFontSize: 14,
                        ),
                        contDict()
                      ],
                    ),
                  )),
              BootstrapCol(
                  sizes: 'col-12 col-md-6',
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          'รหัสไปรษณีย์',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                          minFontSize: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                          ),
                          child: TextFormField(
                            controller: postCode,
                            decoration: ThemeValidBuy().textInputDecoration(),
                            validator: (val) {
                              if (val!.isEmpty) {
                                return "กรุณากรอกรหัสไปรษณีย์";
                              }
                              return null;
                            },
                            cursorColor: Colors.black,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),

        Padding(
          padding:
              const EdgeInsets.only(top: 0, right: 20, left: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                'ข้อมูลที่อยู่',
                style: TextStyle(fontSize: 15, color: Colors.black),
                minFontSize: 14,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                child: TextFormField(
                  maxLines: 3,
                  controller: adr,
                  cursorColor: Colors.black,
                  style: TextStyle(color: Colors.black),
                  decoration: ThemeValidBuy().textInputDecoration(),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "กรุณากรอกที่อยู่";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),

        //เส้น
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 101, 188, 231),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Icon(
                      Icons.fire_truck,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                ),
              ),
              AutoSizeText(
                'ประเภทการจัดส่ง :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                minFontSize: 17,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget contDeliChoose() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: AutoSizeText(
                'เลือกประเภทการจัดส่ง',
                style: TextStyle(fontSize: 15, color: Colors.black),
                minFontSize: 14,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: BootstrapRow(
                children: <BootstrapCol>[
                  ...deliAll.map(
                    (dataDeli) => BootstrapCol(
                      sizes: 'col-12 col-md-6',
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10.0, right: 10),
                        decoration: groupValue == dataDeli.deliveryId
                            ? BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 101, 188, 231),
                                ),
                                color: Color.fromARGB(255, 231, 243, 250),
                                borderRadius: BorderRadius.circular(5),
                              )
                            : BoxDecoration(
                                border: Border.all(
                                  color: Colors.black12,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                        child: ListTile(
                          title: Text(
                            dataDeli.deliveryName,
                          ),
                          subtitle: Text(
                            'ราคาจัดส่ง ${dataDeli.deliveryPrice} บาท',
                            style: TextStyle(fontSize: 13),
                          ),
                          leading: Radio<int>(
                            value: dataDeli.deliveryId,
                            groupValue: groupValue,
                            onChanged: (int? value) {
                              totalFinal = dataDeli.deliveryPrice + totalAll;
                              totalDeli = dataDeli.deliveryPrice;
                              setState(() {
                                groupValue = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            BootstrapCol(sizes: 'col-12 col-md-6', child: Container()),
          ],
        ),
      ),
    );
  }

  Widget contPayChoose() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 101, 188, 231),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Icon(
                      Icons.credit_card,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                ),
              ),
              AutoSizeText(
                'วิธีการชำระเงิน :',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                minFontSize: 17,
                maxLines: 1,
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    'เลือกวิธีการชำระเงิน',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    minFontSize: 14,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  BootstrapRow(children: <BootstrapCol>[
                    BootstrapCol(
                      sizes: 'col-12 col-md-6',
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10.0, right: 10),
                        child: Container(
                          decoration: _typePay == 2
                              ? BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromARGB(255, 101, 188, 231),
                                  ),
                                  color: Color.fromARGB(255, 231, 243, 250),
                                  borderRadius: BorderRadius.circular(5),
                                )
                              : BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                          child: ListTile(
                            title: const Text('เครดิต/เดบิต'),
                            trailing: Icon(Icons.credit_card_rounded),
                            leading: Radio<int>(
                              value: 2,
                              groupValue: _typePay,
                              onChanged: (value) {
                                setState(() {
                                  _typePay = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    BootstrapCol(
                      sizes: 'col-12 col-md-6',
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10.0, right: 10),
                        decoration: _typePay == 1
                            ? BoxDecoration(
                                border: Border.all(
                                  color: Color.fromARGB(255, 101, 188, 231),
                                ),
                                color: Color.fromARGB(255, 231, 243, 250),
                                borderRadius: BorderRadius.circular(5),
                              )
                            : BoxDecoration(
                                border: Border.all(
                                  color: Colors.black12,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                        child: ListTile(
                          title: const Text(
                            'พร้อมเพย์',
                          ),
                          trailing: Icon(Icons.qr_code_rounded),
                          leading: Radio<int>(
                            value: 1,
                            groupValue: _typePay,
                            onChanged: (int? value) {
                              setState(() {
                                _typePay = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    BootstrapCol(
                      sizes: 'col-12 col-md-6',
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10.0, right: 10),
                        child: Container(
                          decoration: _typePay == 3
                              ? BoxDecoration(
                                  border: Border.all(
                                    color: Color.fromARGB(255, 101, 188, 231),
                                  ),
                                  color: Color.fromARGB(255, 231, 243, 250),
                                  borderRadius: BorderRadius.circular(5),
                                )
                              : BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black12,
                                  ),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                          child: ListTile(
                            title: const Text('Mobile banking'),
                            trailing: Icon(Icons.smartphone_outlined),
                            leading: Radio<int>(
                              value: 3,
                              groupValue: _typePay,
                              onChanged: (value) {
                                setState(() {
                                  _typePay = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                ],
              ),
            )),
        BootstrapCol(sizes: 'col-12 col-md-6', child: Container()),
      ],
    );
  }
}
