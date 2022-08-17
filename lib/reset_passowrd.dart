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
import 'package:sell_books_web/widget/validate_buy.dart';
import 'package:validators/validators.dart';
import 'package:http/http.dart' as http;

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);
  static const String route = '/reset_password';

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final box = GetStorage();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController pass1 = TextEditingController();
  TextEditingController pass2 = TextEditingController();

  void saveData() {
    if (formKey.currentState!.validate()) {
      goUpdate();
    }
  }

  Future<void> goUpdate() async {
    var dataForm = {
      "pass_new": pass1.text,
      "user_id": "${box.read("user_id")}"
    };
    var url = "${Global.hostName}/update_pass.php";
    var res = await http.post(Uri.parse(url), body: dataForm);
    var getData = json.decode(res.body);

    if (getData["status"] == "ok") {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              dialogSuccessAll(context, "บันทึกข้อมูลเรียบร้อย"));
      pass1.text = "";
      pass2.text = "";
      setState(() {});
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
                      sizes: 'col-12   col-sm-12 col-md-12 col-lg-4',
                      invisibleForSizes: "sm xs md ",
                      child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 40, bottom: 40),
                          child: Center(
                              child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  child: getCateMain(context, "chp"))))),
                  BootstrapCol(
                    sizes: 'col-12 col-sm-12 col-md-12 col-lg-8',
                    child: BootstrapRow(children: <BootstrapCol>[
                      BootstrapCol(
                        invisibleForSizes: 'xm xs',
                        sizes: 'col 12',
                        child: Container(height: 20),
                      ),
                      getMobileCate(context, "chp"),
                      getConPass()
                    ]),
                  )
                ],
              ),
            ])
      ])),
    );
  }

  BootstrapCol getConPass() {
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
                            Icons.key,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    const AutoSizeText(
                      'ตั้งค่ารหัสผ่าน',
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
                                  'รหัสผ่านใหม่',
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
                                  obscureText: true,
                                  controller: pass1,
                                  cursorColor: Colors.black,
                                  style: const TextStyle(color: Colors.black),
                                  decoration:
                                      ThemeValidBuy().textInputDecoration(),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "กรุณากรอกรหัสผ่าน";
                                    } else if (!isLength(val, 8, 32)) {
                                      return "กรุณากรอกขั้นต่ำ 8 ตัวอักษร";
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
                                  'ยืนยันรหัสผ่านใหม่',
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
                                  obscureText: true,
                                  controller: pass2,
                                  cursorColor: Colors.black,
                                  style: const TextStyle(color: Colors.black),
                                  decoration:
                                      ThemeValidBuy().textInputDecoration(),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "กรุณากรอกรหัสผ่าน";
                                    } else if (!isLength(val, 8, 32)) {
                                      return "กรุณากรอกขั้นต่ำ 8 ตัวอักษร";
                                    } else if (val != pass1.text) {
                                      return "รหัสผ่านไม่ตรงกัน";
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
                                  'บันทึกรหัสผ่านใหม่',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
