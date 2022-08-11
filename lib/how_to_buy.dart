import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:sell_books_web/global.dart';
import 'package:sell_books_web/widget/nav_widget/drawers.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';
import 'package:http/http.dart' as http;

class HowToBuyPage extends StatefulWidget {
  const HowToBuyPage({Key? key}) : super(key: key);

  @override
  State<HowToBuyPage> createState() => _HowToBuyPageState();
}

class _HowToBuyPageState extends State<HowToBuyPage> {
  String contentShow = "";
  @override
  void initState() {
    getConts();
    super.initState();
  }

  Future<void> getConts() async {
    var url = "${Global.hostName}/howtobuy.php";
    var res = await http.get(Uri.parse(url));
    var getData = json.decode(res.body);
    contentShow = getData["data"];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
          child: Column(children: [
        NavMainScreen(),
        BootstrapContainer(
            fluid: false,
            decoration: const BoxDecoration(color: Colors.white),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, top: 55, right: 40, bottom: 0),
                child: BootstrapRow(children: <BootstrapCol>[
                  BootstrapCol(
                      sizes: 'col-12',
                      child: Row(
                        // ignore: prefer_const_literals_to_create_immutables
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
                                  Icons.how_to_vote_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const AutoSizeText(
                            'วิธีการสั่งซื้อ',
                            style: TextStyle(
                                fontSize: 23, fontWeight: FontWeight.bold),
                            minFontSize: 20,
                            maxLines: 1,
                          ),
                        ],
                      )),
                ]),
              )
            ]),
        BootstrapContainer(
            fluid: false,
            decoration: const BoxDecoration(color: Colors.white),
            children: <Widget>[
              BootstrapRow(children: <BootstrapCol>[
                BootstrapCol(
                    sizes: 'col-12',
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                          child: SizedBox(
                            height: 1,
                            width: double.infinity,
                            child: ColoredBox(color: Colors.black12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                          child: HtmlWidget(
                            contentShow,
                            textStyle: const TextStyle(
                                fontFamily: "Prompt",
                                fontWeight: FontWeight.w100),
                          ),
                        ),
                      ],
                    )),
              ]),
            ]),
      ])),
    );
  }
}
