import 'dart:async';
import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:validators/validators.dart';

import 'package:sell_books_web/dialog/dialog_web.dart';
import 'package:sell_books_web/global.dart';
import 'package:sell_books_web/models/amphure_model.dart';
import 'package:sell_books_web/models/deli_type_model.dart';
import 'package:sell_books_web/models/province_model.dart';
import 'package:sell_books_web/models/tumbon_model.dart';
import 'package:sell_books_web/tools/text_format_ultil.dart';
import 'package:sell_books_web/widget/nav_widget/drawers.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';
import 'package:sell_books_web/widget/validate_buy.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({Key? key}) : super(key: key);
  static const String route = '/checkout';

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

enum SingingCharacter { lafayette, jefferson }

InputDecoration styleInput = InputDecoration(
  border: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
  isDense: true,
  contentPadding: const EdgeInsets.fromLTRB(15.0, 18.0, 0.0, 10.0),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black12, width: 1),
    borderRadius: BorderRadius.circular(5.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black12, width: 1),
    borderRadius: BorderRadius.circular(5),
  ),
);

InputDecoration styleInputSelect = InputDecoration(
  border: InputBorder.none,
  disabledBorder: InputBorder.none,
  isDense: true,
  contentPadding: const EdgeInsets.fromLTRB(15.0, 18.0, 0.0, 10.0),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black12, width: 1),
    borderRadius: BorderRadius.circular(5.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black12, width: 1),
    borderRadius: BorderRadius.circular(5),
  ),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Colors.red, width: 1)),
  focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Colors.red, width: 1)),
);

class _CheckOutPageState extends State<CheckOutPage> {
  var formatter = NumberFormat('#,###,##0.00');
  int? _typePay = 2;
  String typePayStr = "credit";
  int? _typePayMb = 1;
  final box = GetStorage();
  int totalAll = 0;
  int numAll = 0;
  List<DeliTypeModel> deliAll = [];
  int groupValue = 1;
  int totalDeli = 0;
  int totalFinal = 0;
  bool isPay = false;
  late Timer inTimer;
  List<ProvinceModel> itemsProv = [];

  List<AmphureModel> itemsAmp = [];

  List<TumbonModel> itemsDict = [];

  String? selectedValueProv;
  String? selectedValueAmp;
  String? selectedValueDict;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController(text: "นิติพล");
  TextEditingController phone = TextEditingController(text: "0967958451");
  TextEditingController postCode = TextEditingController();
  TextEditingController adr = TextEditingController(text: "81 ถนน");
  TextEditingController nameCard =
      TextEditingController(text: "Somchai Prasert");
  TextEditingController noCard =
      TextEditingController(text: "4242 4242 4242 4242");
  TextEditingController expireCard = TextEditingController(text: "10/2022");
  TextEditingController cvcCard = TextEditingController(text: "123");

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
    if (getData["status"] == "ok") {
      context.loaderOverlay.show();
      goPayConfirm();
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => dialogErr(context,
              "สินค้าคงเหลือมีการเปลี่ยนแปลง \n กรุณาอัพเดทสินค้าในตะกร้าใหม่"));
    }
  }

  void goPayConfirm() {
    if (_typePay == 2) {
      gopayCredit();
    } else if (_typePay == 3) {
      goPayMbank();
    } else if (_typePay == 1) {
      goPayPrompay();
    }
  }

  void goPayPrompay() async {
    int totalAllGet = totalAll;
    var dataForm = {"total": "$totalAllGet"};
    var url = "${Global.hostName}/pay_promptpay.php";
    var res = await http.post(Uri.parse(url), body: dataForm);
    var getData = json.decode(res.body);
    box.write("keypay", getData["uid"]);
    setTempPayPrompay(getData);
  }

  void setTempPayPrompay(getData) async {
    var dataForm = {
      "user_id": "${box.read("user_id")}",
      "charge_id": "${getData['charge_id']}",
      "key_temp": "${getData['uid']}",
      "typepay": "4",
    };
    var url = "${Global.hostName}/set_temp_pay.php";
    await http.post(Uri.parse(url), body: dataForm);

    context.loaderOverlay.hide();
    showDialog(
        context: context,
        builder: (BuildContext context) =>
            dialogQrcode(context, getData["url_qrcode"]));
    inTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!isPay) {
        checkPayed(getData);
      } else {
        inTimer.cancel();
        Navigator.pushNamed(context, "/thankyou");
      }
    });
  }

  void goPayMbank() async {
    int totalAllGet = totalAll;
    var dataForm = {"total": "$totalAllGet", "type_bank": "$_typePayMb"};
    var url = "${Global.hostName}/pay_mb_kbank.php";
    var res = await http.post(Uri.parse(url), body: dataForm);
    var getData = json.decode(res.body);
    box.write("keypay", getData["uid"]);
    setTempPayMbank(getData);
  }

  void setTempPayMbank(getData) async {
    var dataForm = {
      "user_id": "${box.read("user_id")}",
      "charge_id": "${getData['charge_id']}",
      "key_temp": "${getData['uid']}",
      "typepay": "${getData['typepay']}",
    };
    var url = "${Global.hostName}/set_temp_pay.php";
    await http.post(Uri.parse(url), body: dataForm);

    box.write("cur_pay", "mbank");
    box.write("cur_charge", getData['charge_id']);

    var dataFormTemp = {
      "user_id": "${box.read("user_id")}",
      "key_temp": "${getData['uid']}",
      "charge_id": "${getData['charge_id']}",
      "order_total": "$totalAll",
      "order_total_all": "$totalFinal",
      "order_deli_price": "$totalDeli",
      "type_pay": "$groupValue",
      "order_name": name.text.toString(),
      "order_phone": phone.text.toString(),
      "order_adr": adr.text.toString(),
      "order_province": "$selectedValueProv",
      "order_amphur": "$selectedValueAmp",
      "order_tumbon": "$selectedValueDict",
      "order_postcode": postCode.text.toString(),
      "order_buy_form": "web",
      "order_type_deli": "$_typePay",
      "omise_net": getData["net"].toString(),
      "omise_fee": getData["fee"].toString(),
      "omise_fee_vat": getData["fee_vat"].toString(),
      "omise_key_secret": "",
      "omise_key_charge": getData["charge_id"].toString()
    };
    var urlTemp = "${Global.hostName}/add_temp_order.php";
    await http.post(Uri.parse(urlTemp), body: dataFormTemp);

    _launchURL(getData["url_pay"]);
    inTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (!isPay) {
        checkPayed(getData);
      } else {
        inTimer.cancel();
        Navigator.pushNamed(context, "/thankyou");
      }
    });
  }

  _launchURL(String urlGet) async {
    html.window.open(urlGet, "_blank");
  }

  void checkPayed(getData) async {
    var dataForm = {
      "user_id": "${box.read("user_id")}",
      "key_temp": "${getData['uid']}",
      "charge_id": "${getData['charge_id']}",
      "order_total": "$totalAll",
      "order_total_all": "$totalFinal",
      "order_deli_price": "$totalDeli",
      "type_pay": "$groupValue",
      "order_name": name.text.toString(),
      "order_phone": phone.text.toString(),
      "order_adr": adr.text.toString(),
      "order_province": "$selectedValueProv",
      "order_amphur": "$selectedValueAmp",
      "order_tumbon": "$selectedValueDict",
      "order_postcode": postCode.text.toString(),
      "order_buy_form": "web",
      "order_type_deli": "$_typePay",
      "omise_net": getData["net"].toString(),
      "omise_fee": getData["fee"].toString(),
      "omise_fee_vat": getData["fee_vat"].toString(),
      "omise_key_secret": "",
      "omise_key_charge": getData["charge_id"].toString()
    };
    var url = "${Global.hostName}/check_set_pay.php";
    var res = await http.post(Uri.parse(url), body: dataForm);
    var getRes = json.decode(res.body);
    if (getRes["status"] == "ok") {
      box.write("cur_bill", getRes["data"]);
      setState(() {
        isPay = true;
      });
    }
  }

  void gopayCredit() async {
    int totalAllGet = totalAll;
    String nameCardGet = nameCard.text;
    String noCardGet = noCard.text;
    String expireCardGet = expireCard.text;
    String cvcCardGet = cvcCard.text;
    var dataForm = {
      "total": "$totalAllGet",
      "nameCard": nameCardGet,
      "noCard": noCardGet,
      "expireCard": expireCardGet,
      "cvcCard": cvcCardGet
    };

    var url = "${Global.hostName}/pay_card.php";
    var res = await http.post(Uri.parse(url), body: dataForm);
    var getData = json.decode(res.body);
    if (getData["status"] == "successful") {
      setBuySuccess(getData);
    } else if (getData["status"] == "pending") {
    } else if (getData["status"] == "no") {
      context.loaderOverlay.hide();
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              dialogErr(context, "กรุณาตรวจสอบข้อมูลบัตรอีกครั้ง"));
    }
  }

  void setBuySuccess(getData) async {
    var dataForm = {
      "user_id": "${box.read("user_id")}",
      "order_total": "$totalAll",
      "order_total_all": "$totalFinal",
      "order_deli_price": "$totalDeli",
      "type_pay": "$groupValue",
      "order_name": name.text.toString(),
      "order_phone": phone.text.toString(),
      "order_adr": adr.text.toString(),
      "order_province": "$selectedValueProv",
      "order_amphur": "$selectedValueAmp",
      "order_tumbon": "$selectedValueDict",
      "order_postcode": postCode.text.toString(),
      "order_buy_form": "web",
      "order_type_deli": "$_typePay",
      "omise_net": getData["net"].toString(),
      "omise_fee": getData["fee"].toString(),
      "omise_fee_vat": getData["fee_vat"].toString(),
      "omise_key_secret": "",
      "omise_key_charge": getData["charge_id"].toString()
    };

    var url = "${Global.hostName}/set_order.php";
    var res = await http.post(Uri.parse(url), body: dataForm);
    var getRes = json.decode(res.body);

    context.loaderOverlay.hide();

    if (getRes["status"] == "ok") {
      box.write("cur_pay", "credit");
      box.write("cur_bill", getRes["data"]);
      Navigator.pushNamed(context, "/thankyou");
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              dialogErrAll(context, "เกิดข้อผิดผลาดกรุณาลองใหม่อีกครั้ง"));
    }
  }

  void goTestPay() {
    if (formKey.currentState!.validate()) {
      checkStock();
    }
  }

  exampleCreateSource() async {}

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
            // ignore: prefer_const_constructors
            NavMainScreen(),
            BootstrapContainer(fluid: false, children: <Widget>[
              Container(
                decoration: const BoxDecoration(color: Colors.white),
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
                                          : const Center()
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
      ),
    );
  }

  Widget conChooseMb() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
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
                          color: const Color.fromARGB(255, 101, 188, 231),
                        ),
                        color: const Color.fromARGB(255, 231, 243, 250),
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
                          color: const Color.fromARGB(255, 101, 188, 231),
                        ),
                        color: const Color.fromARGB(255, 231, 243, 250),
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
                          color: const Color.fromARGB(255, 101, 188, 231),
                        ),
                        color: const Color.fromARGB(255, 231, 243, 250),
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
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
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
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: AutoSizeText(
                            'ชื่อที่ปรากฏบนบัตร',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                            minFontSize: 14,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
                            controller: nameCard,
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
                      ],
                    ),
                  )),
              BootstrapCol(
                  sizes: 'col-12 col-md-6',
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: AutoSizeText(
                            'หมายเลขบัตร',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                            minFontSize: 14,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                          ),
                          child: TextFormField(
                            controller: noCard,
                            cursorColor: Colors.black,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(19),
                              CreditCardFormatter(),
                            ],
                            style: const TextStyle(color: Colors.black),
                            decoration: ThemeValidCard()
                                .textInputDecoration("xxxx xxxx xxxx xxxx"),
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
                      ],
                    ),
                  )),
              BootstrapCol(
                  sizes: 'col-12 col-md-6',
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          child: AutoSizeText(
                            'วันหมดอายุ',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                            minFontSize: 14,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,
                          ),
                          child: TextFormField(
                            controller: expireCard,
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(7),
                              ExpireCardFormatter(),
                            ],
                            decoration:
                                ThemeValidCard().textInputDecoration("MM/YYYY"),
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
                      ],
                    ),
                  )),
              BootstrapCol(
                  sizes: 'col-12 col-md-6',
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
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
                          child: TextFormField(
                            controller: cvcCard,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(3),
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            cursorColor: Colors.black,
                            style: const TextStyle(color: Colors.black),
                            decoration:
                                ThemeValidCard().textInputDecoration("xxx"),
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
                      ],
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
            color: const Color.fromARGB(255, 101, 188, 231),
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                  blurRadius: 5,
                  color: const Color.fromARGB(255, 29, 29, 29).withOpacity(.3),
                  offset: const Offset(-10, 20))
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
                          color: const Color.fromARGB(255, 29, 29, 29)
                              .withOpacity(.3),
                          offset: const Offset(0, 0))
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
                                color: const Color.fromARGB(255, 101, 188, 231),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.receipt,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                          const AutoSizeText(
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
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15, 20, 15, 10),
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
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
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
                              style: const TextStyle(
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
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
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
                              style: const TextStyle(
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
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
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
                              style: const TextStyle(
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
                      padding:
                          const EdgeInsets.only(top: 110, left: 15, right: 15),
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
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 0),
                                child: AutoSizeText(
                                  'ยืนยันการสั่งซื้อ',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                  minFontSize: 14,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 10),
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
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 101, 188, 231),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const AutoSizeText(
                  'ที่อยู่ในการจัดส่ง',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  minFontSize: 20,
                  maxLines: 1,
                ),
              ],
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
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 101, 188, 231),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(7.0),
                        child: Icon(
                          Icons.house,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                  const AutoSizeText(
                    'ข้อมูลผู้สั่งซื้อ :',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    minFontSize: 17,
                    maxLines: 1,
                  ),
                ],
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
                        const AutoSizeText(
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
                            style: const TextStyle(color: Colors.black),
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
                        const AutoSizeText(
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
                            style: const TextStyle(color: Colors.black),
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
                        const AutoSizeText(
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
                        const AutoSizeText(
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
                        const AutoSizeText(
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
                        const AutoSizeText(
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
                            style: const TextStyle(color: Colors.black),
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
              const AutoSizeText(
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
                  style: const TextStyle(color: Colors.black),
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
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
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
                    color: const Color.fromARGB(255, 101, 188, 231),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Icon(
                      Icons.fire_truck,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                ),
              ),
              const AutoSizeText(
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
            const SizedBox(
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
                                  color:
                                      const Color.fromARGB(255, 101, 188, 231),
                                ),
                                color: const Color.fromARGB(255, 231, 243, 250),
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
                            style: const TextStyle(fontSize: 13),
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
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 40, 0, 20),
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
                    color: const Color.fromARGB(255, 101, 188, 231),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Icon(
                      Icons.credit_card,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                ),
              ),
              const AutoSizeText(
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
                  const AutoSizeText(
                    'เลือกวิธีการชำระเงิน',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                    minFontSize: 14,
                  ),
                  const SizedBox(
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
                                    color: const Color.fromARGB(
                                        255, 101, 188, 231),
                                  ),
                                  color:
                                      const Color.fromARGB(255, 231, 243, 250),
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
                            trailing: const Icon(Icons.credit_card_rounded),
                            leading: Radio<int>(
                              value: 2,
                              groupValue: _typePay,
                              onChanged: (value) {
                                setState(() {
                                  _typePay = value;
                                  typePayStr = "credit";
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
                                  color:
                                      const Color.fromARGB(255, 101, 188, 231),
                                ),
                                color: const Color.fromARGB(255, 231, 243, 250),
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
                          trailing: const Icon(Icons.qr_code_rounded),
                          leading: Radio<int>(
                            value: 1,
                            groupValue: _typePay,
                            onChanged: (int? value) {
                              setState(() {
                                _typePay = value;
                                typePayStr = "promptpay";
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
                                    color: const Color.fromARGB(
                                        255, 101, 188, 231),
                                  ),
                                  color:
                                      const Color.fromARGB(255, 231, 243, 250),
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
                            trailing: const Icon(Icons.smartphone_outlined),
                            leading: Radio<int>(
                              value: 3,
                              groupValue: _typePay,
                              onChanged: (value) {
                                setState(() {
                                  _typePay = value;
                                  typePayStr = "mbank";
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
