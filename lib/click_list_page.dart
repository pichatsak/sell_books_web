import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sell_books_web/global.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';

import 'package:http/http.dart' as http;

class ClickListPage extends StatefulWidget {
  final String idGet;
  const ClickListPage({Key? key, required this.idGet}) : super(key: key);
  static const String route = '/product';

  @override
  State<ClickListPage> createState() => _ClickListPageState();
}

class _ClickListPageState extends State<ClickListPage> {
  var formatter = NumberFormat('#,###,###.00');
  String pid = "";
  String prodName = "";
  String prodDetailEx = "";
  String prodWriter = "";
  int prodPrice = 0;
  int prodAmount = 0;
  int productId = 0;
  String productPic = "";
  String productDetail = "";
  String productIsbn = "";
  String productHeight = "";
  String productWidth = "";
  String productWide = "";
  String productWeight = "";
  String productPrintColor = "";
  String productPaper = "";
  String productOwner = "";
  String productYear = "";

  final box = GetStorage();
  @override
  void initState() {
    // print("id : ${widget.idGet}");
    pid = widget.idGet;
    setShowProductData(pid);
    super.initState();
  }

  void setShowProductData(String pidGet) async {
    var url = "${Global.hostName}/product_by_id.php?id=$pidGet";
    var res = await http.get(Uri.parse(url));
    await json.decode(res.body)['data'].map((data) {
      prodName = data["product_name"];
      prodDetailEx = data["product_detail_et"];
      prodWriter = data["product_writer"];
      prodPrice = data["product_price"];
      prodAmount = data["product_amount"];
      productId = data["product_id"];
      productPic = data["product_pic"];
      productDetail = data["product_detail"];
      productIsbn = data["product_isbn"];
      productHeight = data["product_height"];
      productWidth = data["product_width"];
      productWide = data["product_wide"];
      productWeight = data["product_weight"];
      productPrintColor = data["product_print_color"];
      productPaper = data["product_paper"];
      productOwner = data["product_owner"];
      productYear = data["product_year"];
    }).toList();
    setState(() {});
  }

  void setAddCart(int pid) async {
    if (box.read("login")) {
      var dataForm = {
        "product_id": "$pid",
        "num": "1",
        "user_id": "${box.read("user_id")}"
      };
      var url = "${Global.hostName}/add_cart.php";
      var res = await http.post(Uri.parse(url), body: dataForm);
      var getData = json.decode(res.body);
      if (getData["status"] == "ok") {
        // ignore: use_build_context_synchronously
        _onSuccessAlert(context);
      } else if (getData["status"] == "no") {
        // ignore: use_build_context_synchronously
        _onError(context);
      } else if (getData["status"] == "nostock") {
        // ignore: use_build_context_synchronously
        _onErrorStock(context);
      }
    } else {
      _onErrorLogin(context);
    }
  }

  _onSuccessAlert(context) {
    setState(() {});
    Alert(
      context: context,
      type: AlertType.success,
      style: const AlertStyle(
        isOverlayTapDismiss: false,
        isCloseButton: false,
        overlayColor: Color.fromARGB(113, 0, 0, 0),
      ),
      title: "เสร็จสิ้น",
      desc: "เพิ่มในตะกร้าเรียบร้อย.",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
          },
          width: 120,
          child: const Text(
            "ตกลง",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  _onErrorStock(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      style: const AlertStyle(
        overlayColor: Color.fromARGB(113, 0, 0, 0),
      ),
      title: "ไม่สำเร็จ",
      desc: "สินค้าคงเหลือไม่เพียงพอ.",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
          },
          width: 120,
          child: const Text(
            "ตกลง",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  _onError(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      style: const AlertStyle(
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
          child: const Text(
            "ตกลง",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  _onErrorLogin(context) {
    Alert(
      context: context,
      type: AlertType.warning,
      style: const AlertStyle(
        overlayColor: Color.fromARGB(113, 0, 0, 0),
      ),
      title: "ไม่สำเร็จ",
      desc: "กรุณาเข้าสู่ระบบก่อน.",
      buttons: [
        DialogButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamed(context, "/login");
          },
          width: 120,
          child: const Text(
            "ตกลง",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
      body: SingleChildScrollView(
          child: Column(children: [
        //NAV_START
        const NavMainScreen(),
        //NAV_END
        //BODY_START
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: BootstrapContainer(
            decoration: const BoxDecoration(color: Colors.white),
            fluid: false,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 35, left: 30, right: 30),
                child: BootstrapRow(
                  children: <BootstrapCol>[
                    BootstrapCol(
                      sizes: 'col-12  col-md-12 col-lg-4',
                      child: Center(
                        child: SizedBox(
                          height: 300,
                          child: productPic != ""
                              ? Image.network(
                                  "${Global.hostImg}/$productId/$productPic",
                                  fit: BoxFit.cover,
                                  width: 220,
                                  height: 230,
                                )
                              : const Center(),
                        ),
                      ),
                    ),
                    BootstrapCol(
                        sizes: 'col-12 col-md-12 col-lg-8',
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(18, 35, 0, 0),
                              child: SizedBox(
                                width: double.infinity,
                                child: AutoSizeText(
                                  prodName,
                                  style: const TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600),
                                  minFontSize: 18,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Container(
                                margin: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    margin:
                                        const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                    child: AutoSizeText(
                                      prodDetailEx,
                                      style: const TextStyle(
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
                              margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: SizedBox(
                                width: double.infinity,
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: AutoSizeText(
                                    'ผู้เขียน $prodWriter',
                                    style: const TextStyle(
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
                              margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                              child: SizedBox(
                                width: double.infinity,
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: AutoSizeText(
                                    '${formatter.format(prodPrice)} บาท',
                                    style: const TextStyle(
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
                              margin: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                              child: SizedBox(
                                width: double.infinity,
                                child: Container(
                                  margin: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: AutoSizeText(
                                    'คงเหลือ : $prodAmount เล่ม',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w100,
                                      color: Color.fromARGB(255, 104, 104, 104),
                                    ),
                                    minFontSize: 14,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(18, 20, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ElevatedButton.icon(
                                      onPressed: () {
                                        setAddCart(productId);
                                      },
                                      icon: const Icon(Icons.shopping_cart),
                                      label: const Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                        )),
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(30, 30, 30, 20),
                child: SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: ColoredBox(color: Colors.black12),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
                child: BootstrapRow(height: 60, children: <BootstrapCol>[
                  BootstrapCol(
                      sizes: 'col-12',
                      child: Column(
                        children: [
                          HtmlWidget(
                            productDetail,
                            renderMode: RenderMode.column,
                            textStyle: const TextStyle(
                                fontSize: 25,
                                fontFamily: "Prompt",
                                fontWeight: FontWeight.w100),
                          ),
                        ],
                      )),
                ]),
              ),

              const Padding(
                padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
                child: SizedBox(
                  height: 1,
                  width: double.infinity,
                  child: ColoredBox(color: Colors.black12),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
                child: BootstrapRow(height: 60, children: <BootstrapCol>[
                  BootstrapCol(
                      sizes: 'col-12',
                      child: Column(
                        children: [getContDeatil()],
                      )),
                ]),
              ),

              //BODY_END
              //FOOTING_START
              // ignore: prefer_const_constructors

              //FOOTING_END
            ],
          ),
        ),
      ])),
    );
  }

  Widget getContDeatil() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      child: BootstrapRow(height: 60, children: <BootstrapCol>[
        BootstrapCol(
            sizes: 'col-12',
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: AutoSizeText(
                    'รายละเอียดหนังสือ',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    minFontSize: 17,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: AutoSizeText(
                            'ISBN',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w100),
                            minFontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: AutoSizeText(
                            ':  $productIsbn',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w100),
                            minFontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: AutoSizeText(
                            'ขนาดรูปเล่ม',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w100),
                            minFontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: AutoSizeText(
                            ':  $productWide x $productWidth x $productHeight มม.',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w100),
                            minFontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: AutoSizeText(
                            'น้ำหนัก',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w100),
                            minFontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: AutoSizeText(
                            ':  $productWeight กรัม',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w100),
                            minFontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: AutoSizeText(
                            'เนื้อในพิมพ์',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w100),
                            minFontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: AutoSizeText(
                            ':  $productPrintColor',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w100),
                            minFontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: AutoSizeText(
                            'ชนิดกระดาษ',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w100),
                            minFontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: AutoSizeText(
                            ':  $productPaper',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w100),
                            minFontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: AutoSizeText(
                            'สำนักพิมพ์',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w100),
                            minFontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: AutoSizeText(
                            ':  $productOwner',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w100),
                            minFontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 100,
                          child: AutoSizeText(
                            'เดือนปีที่พิมพ์',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w100),
                            minFontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: AutoSizeText(
                            ':  $productYear',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w100),
                            minFontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
                  child: SizedBox(
                    height: 1,
                    width: double.infinity,
                    child: ColoredBox(color: Colors.black12),
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
              ],
            )),
      ]),
    );
  }
}
