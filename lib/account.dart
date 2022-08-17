import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sell_books_web/dialog/dialog_web.dart';

import 'package:sell_books_web/global.dart';
import 'package:sell_books_web/widget/cate_ac.dart';
import 'package:sell_books_web/widget/nav_widget/drawers.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';
import 'package:http/http.dart' as http;
import 'package:sell_books_web/widget/validate_buy.dart';
import 'package:validators/validators.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);
  static const String route = '/account';

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final box = GetStorage();
  String nameuser = "";
  String emailuser = "";
  String phoneuser = "";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController usernameCl = TextEditingController();
  TextEditingController emailuserCl = TextEditingController();
  TextEditingController phoneuserCl = TextEditingController();
  @override
  void initState() {
    getUserProfile();
    super.initState();
  }

  void getUserProfile() async {
    var url =
        "${Global.hostName}/user_by_id.php?user_id=${box.read("user_id")}";
    var res = await http.get(Uri.parse(url));
    await json.decode(res.body)['data'].map((data) {
      usernameCl.text = data["user_name"];
      emailuserCl.text = data["user_email"];
      phoneuserCl.text = data["user_phone"];
    }).toList();
    setState(() {});
  }

  void goLogOut() {
    box.write("login", false);

    Navigator.pushNamed(context, "/");
  }

  void saveData() {
    if (formKey.currentState!.validate()) {
      goUpdate();
    }
  }

  Future<void> goUpdate() async {
    var dataForm = {
      "user_name": usernameCl.text,
      "user_email": emailuserCl.text,
      "user_phone": phoneuserCl.text,
      "user_id": "${box.read("user_id")}"
    };
    var url = "${Global.hostName}/update_user.php";
    var res = await http.post(Uri.parse(url), body: dataForm);
    var getData = json.decode(res.body);
    if (getData["status"] == "repleat") {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              dialogErrAll(context, "อีเมลนี้มีอยู่ในระบบแล้ว"));
    } else if (getData["status"] == "no") {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              dialogErrAll(context, "กรุณาลองใหม่อีกครั้ง"));
    } else if (getData["status"] == "ok") {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              dialogSuccessAll(context, "บันทึกข้อมูลเรียบร้อย"));
    }
  }

  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
          child: Column(children: [
        // ignore: prefer_const_constructors
        NavMainScreen(),
        BootstrapContainer(
            fluid: false,
            decoration: const BoxDecoration(color: Colors.white),
            children: <Widget>[
              BootstrapRow(
                children: <BootstrapCol>[
                  BootstrapCol(
                      //  invisibleForSizes: "sm xs md ",
                      sizes: 'col-12 col-sm-12 col-md-12 col-lg-4',
                      invisibleForSizes: "sm xs md ",
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 40, bottom: 40),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                            child: getCateMain(context, "account"),
                          )))),
                  BootstrapCol(
                    sizes: 'col-12 col-sm-12 col-md-12 col-lg-8',
                    child: BootstrapRow(children: <BootstrapCol>[
                      BootstrapCol(
                        invisibleForSizes: 'sm xs',
                        sizes: 'col 12',
                        child: Container(height: 20),
                      ),
                      getMobileCate(context, "account"),
                      getContSave()
                    ]),
                  )
                ],
              ),
            ])
      ])),
    );
  }

  BootstrapCol getContSave() {
    return BootstrapCol(
      sizes: 'col 12 ',
      child: Form(
        key: formKey,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 40),
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
                          color: const Color.fromARGB(255, 101, 188, 231),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(7.0),
                          child: Icon(
                            Icons.folder,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    const AutoSizeText(
                      'ข้อมูลของฉัน',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

              //รายการ1

              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: BootstrapRow(
                  children: <BootstrapCol>[
                    BootstrapCol(
                        sizes: 'col-12 col-md-6',
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Column(
                            children: [
                              const SizedBox(
                                width: double.infinity,
                                child: AutoSizeText(
                                  'ชื่อ - นามสกุล',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  minFontSize: 14,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 5,
                                ),
                                child: TextFormField(
                                  controller: usernameCl,
                                  cursorColor: Colors.black,
                                  style: const TextStyle(color: Colors.black),
                                  decoration:
                                      ThemeValidBuy().textInputDecoration(),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "กรุณากรอกชื่อ";
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

              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: BootstrapRow(
                  children: <BootstrapCol>[
                    BootstrapCol(
                        sizes: 'col-12 col-md-6',
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Column(
                            children: [
                              const SizedBox(
                                width: double.infinity,
                                child: AutoSizeText(
                                  'เบอร์โทรศัพท์',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  minFontSize: 14,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 5,
                                ),
                                child: TextFormField(
                                  controller: phoneuserCl,
                                  cursorColor: Colors.black,
                                  style: const TextStyle(color: Colors.black),
                                  decoration:
                                      ThemeValidBuy().textInputDecoration(),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "กรุณากรอกเบอร์โทร";
                                    } else if (!isLength(val, 9, 10)) {
                                      return "กรอกเบอร์โทรไม่ถูกค้อง";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: BootstrapRow(
                  children: <BootstrapCol>[
                    BootstrapCol(
                        sizes: 'col-12 col-md-6',
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: Column(
                            children: [
                              const SizedBox(
                                width: double.infinity,
                                child: AutoSizeText(
                                  'อีเมล',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  minFontSize: 14,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 5,
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailuserCl,
                                  cursorColor: Colors.black,
                                  style: const TextStyle(color: Colors.black),
                                  decoration:
                                      ThemeValidBuy().textInputDecoration(),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "กรุณากรอกอีเมล";
                                    } else if (!isEmail(val)) {
                                      return "รูปแบบอีเมลไม่ถูกต้อง";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                    top: 40, left: 15, right: 15, bottom: 30),
                child: InkWell(
                  onTap: () {
                    saveData();
                  },
                  child: SizedBox(
                    width: 260,
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
                          padding: const EdgeInsets.all(13.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 0),
                                child: AutoSizeText(
                                  'บันทึกข้อมูล',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                  minFontSize: 14,
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.save_rounded,
                                    color: Colors.white,
                                  )),
                            ],
                          ),
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
    );
  }
}
