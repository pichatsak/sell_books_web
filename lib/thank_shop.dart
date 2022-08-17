import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sell_books_web/global.dart';
import 'package:sell_books_web/widget/nav_widget/drawers.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ThankyouShop extends StatefulWidget {
  const ThankyouShop({Key? key}) : super(key: key);
  static const String route = '/thankyou';

  @override
  State<ThankyouShop> createState() => _ThankyouShopState();
}

class _ThankyouShopState extends State<ThankyouShop> {
  var formatter = NumberFormat('000000');
  bool isLoad = true;
  final box = GetStorage();
  String orderNo = "";
  @override
  void initState() {
    checkData();
    super.initState();
  }

  void checkData() async {
    var txtCurBill = box.read("cur_pay");
    getShowBill(box.read("cur_bill"));
  }

  void getCheckPay() async {
    var dataForm = {
      "charge_id": "${box.read("cur_charge")}",
    };
    var url = "${Global.hostName}/check_pay_conf.php";
    var res = await http.post(Uri.parse(url), body: dataForm);

    var getData = json.decode(res.body);
    setState(() {
      orderNo = formatter.format(getData["data"]);
    });
  }

  void getShowBill(String billId) async {
    var url = "${Global.hostName}/get_bill.php?bill_id=$billId";
    var res = await http.get(Uri.parse(url));
    var getData = json.decode(res.body);
    setState(() {
      orderNo = formatter.format(getData["order_id"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);
    return LoaderOverlay(
      useDefaultLoading: false,
      overlayWidget: Center(
        child: LoadingAnimationWidget.inkDrop(
          color: Colors.white,
          size: 50,
        ),
      ),
      overlayColor: Colors.black,
      overlayOpacity: 0.5,
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
        drawer: const NavDrawer(),
        body: SingleChildScrollView(
            child: Column(children: [
          const NavMainScreen(),
          BootstrapContainer(
            fluid: false,
            decoration: const BoxDecoration(color: Colors.white),
            children: <Widget>[
              BootstrapRow(children: <BootstrapCol>[
                BootstrapCol(
                    sizes: 'col-12',
                    child: Container(
                      transform: Matrix4.translationValues(0.0, -80.0, 0.0),
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 300,
                            // decoration: BoxDecoration(
                            //     border: Border.all(
                            //       color: Color.fromARGB(255, 101, 188, 231),
                            //     ),
                            //     //    color: Color.fromARGB(255, 101, 188, 231),
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.circular(360),
                            //     // ignore: prefer_const_literals_to_create_immutables
                            //     boxShadow: [
                            //       // BoxShadow(
                            //       //     blurRadius: 5,
                            //       //     color:
                            //       //         Color.fromARGB(255, 29, 29, 29)
                            //       //             .withOpacity(.3),
                            //       //     offset: Offset(-10, 20))
                            //     ]),
                            child: Icon(
                              Icons.task_alt,
                              size: 100,
                              color: Color.fromARGB(255, 101, 188, 231),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: AutoSizeText(
                              'สั่งซื้อสินค้าสำเร็จ',
                              style:
                                  TextStyle(fontSize: 27, color: Colors.black),
                              minFontSize: 20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: AutoSizeText(
                              'หมายเลขออเดอร์ : #$orderNo',
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                              minFontSize: 14,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: AutoSizeText(
                              'รอการจัดส่งสินค้าจากทางเจ้าหน้าที่',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 48, 48, 48)),
                              minFontSize: 14,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: AutoSizeText(
                              'ขอบคุณสำหรับการสั่งซื้อสินค้าของเรา',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                              minFontSize: 14,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: AutoSizeText(
                              'กลับสู่หน้าแรก สำหรับเริ่มต้นทำรายการใหม่',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                              minFontSize: 14,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30, left: 15, right: 15),
                            child: InkWell(
                              onTap: () {},
                              child: Card(
                                shadowColor: Colors.black,
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: Container(
                                  width: 220,
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
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.only(left: 0),
                                          child: AutoSizeText(
                                            'กลับสู่หน้าแรก',
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.white),
                                            minFontSize: 14,
                                          ),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(left: 10),
                                            child: Icon(
                                              Icons.home,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
              ])
            ],
          )
        ])),
      ),
    );
  }
}
