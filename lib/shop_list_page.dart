// ignore_for_file: camel_case_types, depend_on_referenced_packages, prefer_const_constructors_in_immutables, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last

import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sell_books_web/check_out_page.dart';
import 'package:sell_books_web/global.dart';
import 'package:sell_books_web/models/cart_list_model.dart';
import 'package:sell_books_web/models/cart_view_model.dart';
import 'package:sell_books_web/widget/nav_widget/drawers.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';
import 'package:http/http.dart' as http;

class Shop_List_Page extends StatefulWidget {
  Shop_List_Page({Key? key}) : super(key: key);
  static const String route = '/cart';

  @override
  State<Shop_List_Page> createState() => _Shop_List_PageState();
}

class _Shop_List_PageState extends State<Shop_List_Page> {
  final box = GetStorage();

  var formatter = NumberFormat('#,###,##0.00');
  List<CartViewModel> cartAllData = [];
  List<CartListModel> cartListData = [];
  int totalAll = 0;
  int numAll = 0;
  bool isEdit = false;

  Future<void> getCartAll() async {
    var url = "${Global.hostName}/cart_all.php?user_id=${box.read("user_id")}";
    var res = await http.get(Uri.parse(url));
    var getData = json.decode(res.body);
    cartAllData = [];
    if (getData["num"] > 0) {
      await json
          .decode(res.body)['data']
          .map((data) => cartAllData.add(CartViewModel.fromJson(data)))
          .toList();
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

  @override
  void initState() {
    getCartAll();
    super.initState();
  }

  void goUpdateCart() async {
    // var jsonGet = jsonEncode(cartAllData.map((e) => e.toJson()).toList());
    // var dataForm = {"data": jsonGet, "user_id": "${box.read("user_id")}"};
    // var url = "${Global.hostName}/cart_update.php";
    // var res = await http.post(Uri.parse(url), body: dataForm);
    // isEdit = false;
    // getCartAll();
  }

  void setDeleteCart(int cartId) async {
    var dataForm = {
      "del_id": cartId.toString(),
    };
    var url = "${Global.hostName}/cart_del.php";
    var res = await http.delete(Uri.parse(url), body: dataForm);
    var getData = json.decode(res.body);
    if (getData["status"] == "ok") {
      getCartAll();
    } else if (getData["status"] == "no") {
      // ignore: use_build_context_synchronously
      _onError(context);
    }
  }

  void setNewTotal() {
    totalAll = 0;
    cartAllData.map((data) {
      totalAll += (data.price * data.num);
    }).toList();
    setState(() {});
  }

  void setEditNum(String status, int index) {
    isEdit = true;
    if (status == "add") {
      int newnum = cartAllData[index].num + 1;
      if (newnum <= cartAllData[index].productAmount) {
        cartAllData[index].num++;
        cartAllData[index].total =
            (cartAllData[index].price * cartAllData[index].num);
      } else if (newnum > cartAllData[index].productAmount) {
        cartAllData[index].num = cartAllData[index].productAmount;

        cartAllData[index].total =
            (cartAllData[index].price * cartAllData[index].num);
      }
      setNewTotal();
    } else {
      int curnum = cartAllData[index].num;
      if (curnum == 1) {
        cartAllData[index].num = 1;

        cartAllData[index].total =
            (cartAllData[index].price * cartAllData[index].num);
      } else {
        cartAllData[index].num--;

        cartAllData[index].total =
            (cartAllData[index].price * cartAllData[index].num);
      }
      setNewTotal();
    }
  }

  _onError(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      style: AlertStyle(
        overlayColor: Color.fromARGB(113, 0, 0, 0),
      ),
      title: "ไม่สำเร็จ",
      desc: "กรุณาลองใหม่อีกครั้ง.",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
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

  void openDelete(int cartId, BuildContext context) {
    Alert(
      context: context,
      type: AlertType.warning,
      style: AlertStyle(
        overlayColor: Color.fromARGB(113, 0, 0, 0),
      ),
      title: "ยืนยัน?",
      desc: "ต้องการลบรายการนี้ออกไป.",
      buttons: [
        DialogButton(
          child: Text(
            "ยกเลิก",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromARGB(255, 179, 179, 179),
        ),
        DialogButton(
          child: Text(
            "ยืนยัน",
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          color: Colors.red,
          onPressed: () {
            Navigator.pop(context);
            setDeleteCart(cartId);
          },
        )
      ],
    ).show();
  }

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
                              // show list
                              ...cartAllData.map((cartData) => getList(
                                  cartData, cartAllData.indexOf(cartData))),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 30, 0, 20),
                                child: SizedBox(
                                  height: 1,
                                  width: double.infinity,
                                  child: ColoredBox(color: Colors.black12),
                                ),
                              ),
                              numAll == 0
                                  ? Container(
                                      color: Color.fromARGB(255, 243, 243, 243),
                                      height:
                                          MediaQuery.of(context).size.height /
                                              1.75,
                                      child: Center(
                                          child: Text(
                                        "ไม่พบสินค้าในตะกร้า",
                                        style: TextStyle(fontSize: 20),
                                      )),
                                    )
                                  : Center(),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          child: Icon(
                                            Icons.arrow_back_ios_new,
                                            size: 15,
                                            color: Colors.blue,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(context, "/");
                                            },
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
                                    isEdit
                                        ? ElevatedButton(
                                            child: Text('อัพเดทตะกร้า'),
                                            onPressed: () {
                                              goUpdateCart();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.blue,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 15),
                                              textStyle: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "Prompt"),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                            ),
                                          )
                                        : Center()
                                  ],
                                ),
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
                                          child: getFinal(),
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

  Widget getHeader() {
    return BootstrapRow(
      children: <BootstrapCol>[
        BootstrapCol(
            invisibleForSizes: "sm xs",
            // ignore: prefer_const_literals_to_create_immutables
            sizes: 'col-4',
            child: Container()),
        BootstrapCol(
            invisibleForSizes: "sm xs",
            sizes: 'col-8',
            child: BootstrapRow(children: <BootstrapCol>[
              BootstrapCol(
                  sizes: 'col-12 col-md-8',
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      child: AutoSizeText(
                        'รายการ',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 104, 104, 104),
                        ),
                        minFontSize: 14,
                      ),
                    ),
                  )),
              BootstrapCol(
                  sizes: 'col-12 col-md-4',
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Container(
                      child: AutoSizeText(
                        'ราคา',
                        style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 104, 104, 104),
                        ),
                        minFontSize: 14,
                      ),
                    ),
                  )),
            ])),
      ],
    );
  }

  Widget getList(CartViewModel cartData, int index) {
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
        //หมวดหมู่
        getHeader(),
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
                      child: Image.network(
                          "${Global.hostImg}/${cartData.productId}/${cartData.productPic}",
                          fit: BoxFit.cover,
                          width: 130,
                          height: 180)),
                ),
              ),
              BootstrapCol(
                  sizes: 'col-8',
                  child: BootstrapRow(children: <BootstrapCol>[
                    BootstrapCol(
                      sizes: 'col-12 col-xs-12 col-sm-12 col-md-8',
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          children: [
                            Container(
                                child: SizedBox(
                              width: double.infinity,
                              child: AutoSizeText(
                                cartData.productName,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                                minFontSize: 14,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 30, bottom: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      //จำนวน
                                      SizedBox(
                                        child: AutoSizeText(
                                          'จำนวน :',
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black),
                                          minFontSize: 14,
                                        ),
                                      ),
                                      //ลบ
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 20,
                                          right: 10,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            setEditNum("del", index);
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Icon(
                                                  Icons.remove,
                                                  size: 17,
                                                  color: Colors.white,
                                                ),
                                              )),
                                        ),
                                      ),
                                      //ช่องกรอก

                                      SizedBox(
                                        width: 40,
                                        child: Text(
                                          cartData.num.toString(),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),

                                      //บวก
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 20,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            setEditNum("add", index);
                                          },
                                          child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(4.0),
                                                child: Icon(
                                                  Icons.add,
                                                  size: 17,
                                                  color: Colors.white,
                                                ),
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Row(children: [
                                      Text(
                                        "คงเหลือ : ",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w100,
                                          color: Color.fromARGB(
                                              255, 104, 104, 104),
                                        ),
                                      ),
                                      Text(cartData.productAmount.toString(),
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w100,
                                            color: Color.fromARGB(
                                                255, 104, 104, 104),
                                          ))
                                    ]),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    BootstrapCol(
                      sizes: 'col-12 col-xs-12 col-sm-12 col-md-4',
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: AutoSizeText(
                                '${formatter.format(cartData.total)} บาท',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                                minFontSize: 14,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    openDelete(cartData.cartId, context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 5, bottom: 5),
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                              color: Colors.red,
                                            ),
                                            minFontSize: 14,
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
                  ])),
            ],
          ),
        )
      ],
    );
  }

  Widget getFinal() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 0, right: 0, left: 0),
            child: BootstrapRow(children: <BootstrapCol>[
              BootstrapCol(
                sizes: 'col-12 ',
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
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.receipt_long,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      AutoSizeText(
                        'สรุปยอด',
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
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
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
            child: SizedBox(
              height: 1,
              width: double.infinity,
              child: ColoredBox(color: Colors.black12),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: AutoSizeText(
                          'รายการทั้งหมด',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                          minFontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: AutoSizeText(
                          numAll.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
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
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: AutoSizeText(
                          'ยอดรวม',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                          minFontSize: 14,
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 0),
                        child: AutoSizeText(
                          formatter.format(totalAll),
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
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
            padding: const EdgeInsets.only(top: 100),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(CheckOutPage.route);
              },
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
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: AutoSizeText(
                              'สั่งซื้อสินค้า',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                              minFontSize: 14,
                            ),
                          ),
                        ),
                        Container(
                          child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
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
    );
  }
}
