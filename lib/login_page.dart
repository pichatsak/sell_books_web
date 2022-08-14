import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sell_books_web/global.dart';
import 'package:sell_books_web/widget/nav_widget/drawers.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';
import 'package:sell_books_web/widget/validate.dart';
import 'package:validators/validators.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static const String route = '/login';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email =
      TextEditingController(text: 'ni.tiphon202@gmail.com');
  TextEditingController pass = TextEditingController(text: "12345678");
  // TextEditingController email = TextEditingController();
  // TextEditingController pass = TextEditingController();
  final box = GetStorage();
  void _validate() {
    if (formKey.currentState!.validate()) {
      setLogin();
    }
  }

  Future<void> setLogin() async {
    var url =
        "${Global.hostName}/login.php?email=${email.text}&pass=${pass.text}";
    var res = await http.get(Uri.parse(url));
    var getData = json.decode(res.body);
    if (getData["status"] == "ok") {
      box.write("login", true);
      box.write("user_id", getData["data"]["user_id"]);
      box.write("user_email", getData["data"]["user_email"]);
      box.write("user_name", getData["data"]["user_name"]);
      box.write("user_phone", getData["data"]["user_phone"]);
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, "/");
    } else if (getData["status"] == "no") {
      // ignore: use_build_context_synchronously
      _onErrorUser(context);
    } else if (getData["status"] == "nopassword") {
      // ignore: use_build_context_synchronously
      _onErrorPass(context);
    }
  }

  _onErrorUser(context) {
    Alert(
      context: context,
      type: AlertType.error,
      style: const AlertStyle(
        overlayColor: Color.fromARGB(113, 0, 0, 0),
      ),
      title: "ไม่สำเร็จ",
      desc: "ไม่พบผู้ใช้นี้ในระบบ.",
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          width: 120,
          child: const Text(
            "ตกลง",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }

  _onErrorPass(context) {
    Alert(
      context: context,
      type: AlertType.error,
      style: const AlertStyle(
        overlayColor: Color.fromARGB(113, 0, 0, 0),
      ),
      title: "ไม่สำเร็จ",
      desc: "รหัสผ่านไม่ถูกต้อง.",
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
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
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //NAV_START
            // ignore: prefer_const_constructors
            NavMainScreen(),
            //NAV_END
            //BODY_START
            Container(
              transform: Matrix4.translationValues(0.0, 50.0, 0.0),
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Form(
                    key: formKey,
                    child: Container(
                      width: 450,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: const Color(0xFFF7F7F7),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1,
                                color: const Color.fromARGB(255, 29, 29, 29)
                                    .withOpacity(.30),
                                offset: const Offset(.0, 0))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/logo.png", width: 230),
                            const Padding(
                              padding: EdgeInsets.only(top: 5),
                              child: SizedBox(
                                child: AutoSizeText(
                                  'ลงชื่อเพื่อเข้าใช้',
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
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.black,
                                  style: const TextStyle(color: Colors.black),
                                  controller: email,
                                  decoration: ThemeHelper().textInputDecoration(
                                      Icons.alternate_email, 'กรอกอีเมล'),
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
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 40, right: 40),
                              child: Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: TextFormField(
                                  obscureText: true,
                                  cursorColor: Colors.black,
                                  style: const TextStyle(color: Colors.black),
                                  controller: pass,
                                  decoration: ThemeHelper().textInputDecoration(
                                      Icons.key_outlined, 'กรอกรหัสผ่าน'),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "กรุณากรอกรหัสผ่าน";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 13, left: 40, right: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  SizedBox(
                                    child: AutoSizeText(
                                      'ลืมรหัสผ่าน?',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                      minFontSize: 14,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, left: 40, right: 40, bottom: 20),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _validate();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.blue,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 60, vertical: 25),
                                    textStyle: const TextStyle(
                                        fontSize: 16, fontFamily: "Prompt"),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  child: const Text('เข้าสู่ระบบ'),
                                ),
                              ),
                            ),
                            const Text("หรือ"),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, "/registor");
                              },
                              child: const Text(
                                "สมัครสมาชิก",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.blue),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            //BODY_END

            //FOOTING_START

            //FOOTING_END
          ],
        ),
      ),
    );
  }
}
