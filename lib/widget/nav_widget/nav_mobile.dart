// ignore_for_file: prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace, avoid_unnecessary_containers, unnecessary_new



import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';




Widget mobileView(BuildContext context) {
  var color = Colors.transparent;
  
    
  return SingleChildScrollView(
      child: BootstrapContainer(
          fluid: true,
          // ignore: prefer_const_constructors
          padding: const EdgeInsets.only(top: 0),
          children: <Widget>[
            
        Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(65, 176, 231, 1),
            ),
            child: BootstrapRow(
              children: <BootstrapCol>[
                BootstrapCol(
                  sizes: 'col-3 ',
                  // ignore: prefer_const_constructors
                  child: Container(
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Container(
                              // ignore: deprecated_member_use
                              child: InkWell(
                            onTap: () {
                             
                            },
                            child: Icon(
                              Icons.menu,
                              size: 35,
                              color: Colors.white,
                            ),
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                BootstrapCol(
                    sizes: 'col-9',
                    // ignore: prefer_const_constructors
                    child: Container(
                        height: 80,
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    // ignore: deprecated_member_use
                                    child: FlatButton(
                                      onPressed: () {
                                        
                                      },
                                      highlightColor: color,
                                      splashColor: color,
                                      hoverColor: color,

                                      // ignore: sort_child_properties_last, prefer_const_constructors
                                      child: Row(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 0, 0, 0),
                                              // ignore: prefer_const_constructors
                                              child: Icon(
                                                Icons.account_circle_sharp,
                                                size: 55,
                                                color: Colors.white,
                                              )),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            children: [
                                              // ignore: prefer_const_constructors
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // ignore: sized_box_for_whitespace
                                  Container(
                                    height: 80,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  // ignore: prefer_const_literals_to_create_immutables
                                                  children: [
                                                    // ignore: prefer_const_constructors
                                                    Text(
                                                      "ยอดชำระ",
                                                      // ignore: prefer_const_constructors
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13,
                                                      ),
                                                    ),
                                                    // ignore: prefer_const_constructors, avoid_unnecessary_containers
                                                    Container(
                                                      // ignore: prefer_const_constructors
                                                      margin:
                                                          EdgeInsets.fromLTRB(
                                                              0, 0, 0, 0),
                                                      // ignore: prefer_const_constructors
                                                      child: Text(
                                                        "2000.00",
                                                        // ignore: prefer_const_constructors
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: 60,
                                            height: 40,
                                            margin: EdgeInsets.fromLTRB(
                                                0, 0, 20, 0),
                                            // ignore: deprecated_member_use
                                            child: FlatButton(
                                              onPressed: () {},
                                              highlightColor: color,
                                              splashColor: color,
                                              hoverColor: color,

                                              // ignore: prefer_const_constructors
                                              // ignore: unnecessary_new
                                              child:
                                                  new Stack(children: <Widget>[
                                                Icon(
                                                  Icons.shopping_cart,
                                                  size: 40,
                                                  color: Colors.white,
                                                ),
                                                // ignore: unnecessary_new
                                                new Positioned(
                                                    top: -1,
                                                    right: -1,
                                                    // ignore: unnecessary_new
                                                    child: new Stack(
                                                        children: <Widget>[
                                                          new Icon(
                                                            Icons.brightness_1,
                                                            size: 20.0,
                                                            color: Colors.red,
                                                          ),
                                                          // ignore: unnecessary_new
                                                          new Positioned(
                                                              // ignore: unnecessary_new
                                                              child: new Center(
                                                            child: Container(
                                                              height: 20,
                                                              width: 20,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  new Text(
                                                                    "12",
                                                                    style: new TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize:
                                                                            11,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ))
                                                        ]))
                                              ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ])))),
              ],
            )),
      ]));
}
