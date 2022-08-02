// ignore_for_file: camel_case_types, prefer_const_constructors, avoid_unnecessary_containers, sort_child_properties_last, unnecessary_new

import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sell_books_web/global.dart';
import 'package:sell_books_web/widget/nav_widget/drawers.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';
import 'package:sell_books_web/widget/validate.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:validators/validators.dart';
import 'package:http/http.dart' as http;

class Registor_Page extends StatefulWidget {
  const Registor_Page({Key? key}) : super(key: key);
  static const String route = '/registor';
  @override
  State<Registor_Page> createState() => _Registor_PageState();
}

class _Registor_PageState extends State<Registor_Page> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController(text: "นิติพล พงษ์คำ");
  TextEditingController email =
      TextEditingController(text: 'ni.tiphon202@gmail.com');
  TextEditingController phone = TextEditingController(text: "0864403511");
  TextEditingController pass = TextEditingController(text: "12345678");
  TextEditingController pass2 = TextEditingController(text: "12345678");
  void _validate() {
    if (formKey.currentState!.validate()) {
      context.loaderOverlay.show();
      setRegister();
    }
  }

  Future<void> setRegister() async {
    var dataForm = {
      "user_name": username.text,
      "user_email": email.text,
      "user_password": pass.text,
      "user_phone": phone.text,
    };
    // print(dataForm);
    var url = "${Global.hostName}/register.php";
    var res = await http.post(Uri.parse(url), body: dataForm);
    var getData = json.decode(res.body);
    if (getData["status"] == "ok") {
      context.loaderOverlay.hide();
      _onSuccessAlert(context);
    } else if (getData["status"] == "no") {
      context.loaderOverlay.hide();
      _onError(context);
    } else if (getData["status"] == "repleat") {
      context.loaderOverlay.hide();
      _onRepleateEmail(context);
    }
  }

  void setGoSuccess() {
    Navigator.pop(context);
    Navigator.pushNamed(context, "/login");
  }

  _onSuccessAlert(context) {
    Alert(
      context: context,
      type: AlertType.success,
      style: AlertStyle(
        isOverlayTapDismiss: false,
        isCloseButton: false,
        overlayColor: Color.fromARGB(113, 0, 0, 0),
      ),
      title: "เสร็จสิ้น",
      desc: "สมัครสมาชิกเรียบร้อย.",
      buttons: [
        DialogButton(
          child: Text(
            "ตกลง",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => setGoSuccess(),
          width: 120,
        )
      ],
    ).show();
  }

  _onRepleateEmail(context) {
    Alert(
      context: context,
      type: AlertType.error,
      style: AlertStyle(
        overlayColor: Color.fromARGB(113, 0, 0, 0),
      ),
      title: "ไม่สำเร็จ",
      desc: "อีเมลนี้มีอยู่ในระบบแล้ว.",
      buttons: [
        DialogButton(
          child: Text(
            "ตกลง",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  _onError(context) {
    Alert(
      context: context,
      type: AlertType.error,
      style: AlertStyle(
        overlayColor: Color.fromARGB(113, 0, 0, 0),
      ),
      title: "ไม่สำเร็จ",
      desc: "เกิดข้อผิดผลาดกรุณาลองใหม่อีกครั้ง.",
      buttons: [
        DialogButton(
          child: Text(
            "ตกลง",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  // void testLoad() {
  //   context.loaderOverlay.show();
  // }

  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);
    var color = Colors.transparent;

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
        backgroundColor: Color.fromRGBO(238, 238, 238, 1),
        drawer: NavDrawer(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                //NAV_START
                NavMainScreen(),
                //NAV_END
                //BODY_START
                Container(
                  transform: Matrix4.translationValues(0.0, 50, 0.0),
                  width: MediaQuery.of(context).size.width,
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 150),
                      child: Column(
                        children: [
                          Container(
                            width: 450,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                color: Color(0xFFF7F7F7),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 1,
                                      color: Color.fromARGB(255, 29, 29, 29)
                                          .withOpacity(.30),
                                      offset: Offset(.0, 0))
                                ]),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset("images/logo.png", width: 230),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: SizedBox(
                                      child: AutoSizeText(
                                        'สมัครสมาชิก',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                        minFontSize: 15,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30, left: 40, right: 40),
                                    child: Container(
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: TextFormField(
                                          controller: username,
                                          decoration: ThemeHelper()
                                              .textInputDecoration(
                                                  Icons
                                                      .supervised_user_circle_outlined,
                                                  'กรอกชื่อ'),
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
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 40, right: 40),
                                    child: Container(
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: TextFormField(
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          cursorColor: Colors.black,
                                          style: TextStyle(color: Colors.black),
                                          controller: email,
                                          decoration: ThemeHelper()
                                              .textInputDecoration(
                                                  Icons.alternate_email,
                                                  'กรอกอีเมล'),
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
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 40, right: 40),
                                    child: Container(
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: TextFormField(
                                          cursorColor: Colors.black,
                                          style: TextStyle(color: Colors.black),
                                          controller: phone,
                                          decoration: ThemeHelper()
                                              .textInputDecoration(
                                                  Icons.phone, 'กรอกเบอร์โทร'),
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
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 40, right: 40),
                                    child: Container(
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: TextFormField(
                                          obscureText: true,
                                          cursorColor: Colors.black,
                                          style: TextStyle(color: Colors.black),
                                          controller: pass,
                                          decoration: ThemeHelper()
                                              .textInputDecoration(
                                                  Icons.password_outlined,
                                                  'กรอกรหัสผ่าน'),
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
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 40, right: 40),
                                    child: Container(
                                      child: Container(
                                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                        child: TextFormField(
                                          obscureText: true,
                                          cursorColor: Colors.black,
                                          style: TextStyle(color: Colors.black),
                                          controller: pass2,
                                          decoration: ThemeHelper()
                                              .textInputDecoration(
                                                  Icons.password_outlined,
                                                  'กรอกรหัสผ่านยืนยัน'),
                                          validator: (val) {
                                            if (val!.isEmpty) {
                                              return "กรุณากรอกรหัสผ่านยืนยัน";
                                            } else if (val != pass.text) {
                                              return "รหัสผ่านไม่ตรงกัน";
                                            } else {
                                              return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30,
                                        left: 40,
                                        right: 40,
                                        bottom: 30),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        child: Text('ยืนยันการสมัคร',
                                            style: TextStyle(
                                                fontFamily: "Prompt")),
                                        onPressed: () {
                                          _validate();
                                          // _onRepleateEmail(context);
                                          // testLoad();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.blue,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 60, vertical: 25),
                                          textStyle: TextStyle(
                                            fontSize: 16,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(30.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                //BODY_END

                //FOOTING_START

                //FOOTING_END
              ],
            ),
          ),
        ),
      ),
    );
  }
}
