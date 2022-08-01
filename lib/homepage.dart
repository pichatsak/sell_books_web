// ignore_for_file: unnecessary_const, deprecated_member_use, unused_local_variable, avoid_unnecessary_containers, prefer_const_constructors, duplicate_ignore, sized_box_for_whitespace

import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:pager/pager.dart';
import 'package:sell_books_web/global.dart';
import 'package:sell_books_web/models/Category.dart';
import 'package:sell_books_web/models/ProductModel.dart';
import 'package:sell_books_web/widget/nav_widget/drawers.dart';
import 'package:sell_books_web/widget/nav_widget/nav_main.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  static const String route = '/';

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var formatter = NumberFormat('#,###,###.00');
  String namemenu1 = "วิทยาศาตร์";
  int posView = 1;
  var color = Colors.transparent;
  List<CategoryModel> cateAllData = [];
  List<ProductModel> prodAllData = [];
  String strCate = "";
  int numCate = 0;
  String cateIdCur = "";
  int pageCur = 1;
  bool isEmptyProduct = false;
  int totalPage = 1;
  String sortCur = "no";
  String? selectedValueSort;
  final List<String> itemsSort = [
    'ราคาต่ำสุด',
    'ราคาสูงสุด',
  ];

  Future<void> getCateAll() async {
    var url = "${Global.hostName}/category_get.php";
    var res = await http.get(Uri.parse(url));
    var getData = json.decode(res.body);
    cateAllData = [];
    await json.decode(res.body)['data'].map((data) {
      cateAllData.add(CategoryModel(
          categoryId: data['category_id'],
          cateName: data['cate_name'],
          cateNum: data['cate_num'],
          dateCreate: data['date_create'],
          dateUpdate: data['date_update']));
    }).toList();
    setShowCate();
  }

  @override
  void initState() {
    getCateAll();
    super.initState();
  }

  void setShowCate() {
    setState(() {
      cateIdCur = cateAllData[0].categoryId.toString();
      numCate = cateAllData.length;
      pageCur = 1;
    });
    setShowProduct(cateIdCur);
  }

  void setShowProduct(cateId) async {
    // ignore: avoid_print
    // print("show menu : $cateIdCur");
    var url =
        "${Global.hostName}/product_by_cate_id.php?id=$cateId&page=$pageCur&sort=$sortCur";

    var res = await http.get(Uri.parse(url));
    var getData = json.decode(res.body);
    prodAllData = [];
    int gets = getData["size"];
    int pageNum = getData["page_num"];
    if (gets > 0) {
      await json
          .decode(res.body)['data']
          .map((data) => prodAllData.add(ProductModel.fromJson(data)))
          .toList();
      setState(() {
        isEmptyProduct = false;
        totalPage = pageNum;
      });
    } else {
      setState(() {
        isEmptyProduct = true;
        totalPage = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    bootstrapGridParameters(gutterSize: 0);

    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      drawer: NavDrawer(),
      body: SingleChildScrollView(
        // ignore: avoid_unnecessary_containers
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  //NAV_START
                  NavMainScreen(),
                  //NAV_END
                  //BODY_START
                  BootstrapContainer(
                      fluid: false,
                      decoration: BoxDecoration(color: Colors.white),
                      children: <Widget>[
                        BootstrapRow(children: <BootstrapCol>[
                          BootstrapCol(
                              invisibleForSizes: "sm xs ",
                              sizes: 'col-3',
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 15, 0, 7),
                                // ignore: avoid_unnecessary_containers
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 101, 188, 231),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(20),
                                              topLeft: Radius.circular(20)),
                                        ),
                                        height: 50,
                                        width: double.infinity,
                                        // ignore: prefer_const_constructors
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: Icon(
                                                Icons.category,
                                                color: Colors.white,
                                              ),
                                            ),
                                            // ignore: prefer_const_constructors
                                            Container(
                                              child: Text(
                                                "หมวดหมู่",
                                                // ignore: prefer_const_constructors
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w100,
                                                    fontSize: 16),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black12, width: 1),
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(5),
                                              bottomLeft: Radius.circular(5)),
                                        ),
                                        // ignore: avoid_unnecessary_containers
                                        child: Container(
                                          child: ListView.builder(
                                            itemCount: numCate,
                                            shrinkWrap: true,
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              return getContCateView(
                                                  cateAllData[index]);
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                          BootstrapCol(
                            sizes: 'col-12 col-sm-12 col-md-9',
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(27.5, 15, 27.5, 0),
                              child: Container(
                                child: Center(
                                  child: Column(
                                    children: [
                                      searchBar(),
                                      getCateMobile(),
                                      sortBar(),
                                      if (!isEmptyProduct)
                                        posView == 1
                                            ? getListData()
                                            : getGroupData()
                                      else
                                        getShowEmpty(),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      totalPage > 0 ? getContPagi() : Center(),
                                      SizedBox(
                                        height: 100,
                                      ),
                                      //ในกรอบข้อมูล
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ])
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget orderBar() {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Row(
          children: const [
            Expanded(
              child: Text(
                'เรียงตาม',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w100,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        items: itemsSort
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w100,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ))
            .toList(),
        value: selectedValueSort,
        onChanged: (value) {
          selectedValueSort = value as String;
          if (selectedValueSort == "ราคาต่ำสุด") {
            sortCur = "low";
          } else if (selectedValueSort == "ราคาสูงสุด") {
            sortCur = "high";
          }
          setShowProduct(cateIdCur);
        },
        icon: const Icon(
          Icons.keyboard_arrow_down,
        ),
        iconEnabledColor: Colors.black,
        iconDisabledColor: Colors.black,
        buttonHeight: 50,
        buttonWidth: 160,
        buttonPadding: const EdgeInsets.only(left: 14, right: 14),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black26,
          ),
          color: Colors.white12,
        ),
        itemHeight: 40,
        itemPadding: const EdgeInsets.only(left: 14, right: 14),
        dropdownMaxHeight: 200,
        dropdownWidth: 200,
        dropdownPadding: null,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        dropdownElevation: 8,
        scrollbarRadius: const Radius.circular(20),
        scrollbarThickness: 6,
        scrollbarAlwaysShow: true,
        offset: const Offset(0, 0),
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(31, 161, 161, 161),
          borderRadius: BorderRadius.circular(32),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: TextFormField(
            cursorColor: Colors.black,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintText: "ค้นหาสินค้าที่ต้องการ",

              hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w100),
              // fillColor: Color.fromARGB(31, 161, 161, 161),
              // filled: true,
              suffixIcon: Container(
                margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                child: IconButton(
                  onPressed: () {},
                  highlightColor: color,
                  splashColor: color,
                  hoverColor: color,
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget sortBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            height: 40,
            width: 115,
            child: orderBar(),
          ),
          Container(
            child: Row(children: [
              Container(
                height: 40,
                decoration: posView == 0
                    ? BoxDecoration(
                        color: Color.fromARGB(31, 122, 122, 122),
                        borderRadius: BorderRadius.circular(32),
                      )
                    : null,
                child: IconButton(
                  onPressed: (() {
                    setState(() {
                      posView = 0;
                    });
                  }),
                  highlightColor: color,
                  splashColor: color,
                  hoverColor: color,
                  icon: Icon(Icons.apps_outlined),
                  color: Color.fromRGBO(65, 176, 231, 1),
                ),
              ),
              Container(
                height: 25,
                width: 1,
                color: Colors.grey,
                margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              ),
              Container(
                height: 40,
                decoration: posView == 1
                    ? BoxDecoration(
                        color: Color.fromARGB(31, 122, 122, 122),
                        borderRadius: BorderRadius.circular(32),
                      )
                    : null,
                child: IconButton(
                  onPressed: (() {
                    setState(() {
                      posView = 1;
                    });
                  }),
                  highlightColor: color,
                  splashColor: color,
                  hoverColor: color,
                  icon: Icon(Icons.menu),
                  color: Color.fromRGBO(65, 176, 231, 1),
                ),
              ),
            ]),
          ),
        ]),
      ),
    );
  }

  Widget getCateMobile() {
    return BootstrapRow(children: <BootstrapCol>[
      BootstrapCol(
        invisibleForSizes: "md lg xl",
        sizes: 'col-12',
        child: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Container(
            width: double.infinity,
            // ignore: prefer_const_literals_to_create_immutables
            child: Column(children: <Widget>[
              Card(
                shadowColor: Colors.black,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.zero,
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    key: GlobalKey(),
                    leading: Icon(
                      Icons.category,
                      size: 20,
                      color: Colors.white,
                    ),
                    iconColor: Colors.white,
                    backgroundColor: Color.fromARGB(255, 101, 188, 231),
                    maintainState: true,
                    title: Text(
                      'หมวดหมู่',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.white),
                    ),
                    collapsedIconColor: Colors.white,
                    collapsedBackgroundColor:
                        Color.fromARGB(255, 101, 188, 231),

                    // subtitle: Text(
                    //     'Trailing expansion arrow icon'),
                    children: <Widget>[
                      ...cateAllData.map((e) => ListTile(
                            onTap: () {
                              pageCur = 1;
                              cateIdCur = e.categoryId.toString();
                              setShowProduct(e.categoryId);
                            },
                            title: Text(
                              e.cateName,
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      )
    ]);
  }

  Widget getContPagi() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 0.5),
            borderRadius: BorderRadius.circular(0.0),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Pager(
                currentPage: pageCur,
                totalPages: totalPage,
                onPageChanged: (page) {
                  pageCur = page;
                  setShowProduct(cateIdCur);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget getShowEmpty() {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Text(
          "ไม่พบสินค้า",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  Widget getContCateView(CategoryModel data) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        child: Container(
            color: cateIdCur == data.categoryId.toString()
                ? Color.fromARGB(255, 226, 238, 248)
                : null,
            height: 55,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              ListTile(
                title: InkWell(
                  onTap: () {
                    pageCur = 1;
                    cateIdCur = data.categoryId.toString();
                    setShowProduct(data.categoryId);
                  },
                  child: Text(
                    textAlign: TextAlign.center,
                    data.cateName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ])),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Container(
          height: 1,
          color: Colors.black12,
        ),
      ),
    ]);
  }

  Widget getGroupData() {
    return Column(
      children: [
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////
        ///บรรทัด1
        BootstrapRow(children: <BootstrapCol>[
          ...prodAllData.map((prod) => BootstrapCol(
              sizes: 'col-6 col-sm-6 col-md-4',
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Container(
                          child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, "/product?id=${prod.productId}");
                        },
                        child: Image.network(
                            "${Global.hostImg}/${prod.productId}/${prod.productPic}",
                            fit: BoxFit.cover,
                            width: 200,
                            height: 280),
                      )),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 15, right: 15),
                    child: SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, "/product?id=${prod.productId}");
                        },
                        child: AutoSizeText(
                          prod.productName,
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w600),
                          minFontSize: 18,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: AutoSizeText(
                            prod.productDetailEt,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 104, 104, 104),
                                fontWeight: FontWeight.w100),
                            minFontSize: 14,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )),
                  Container(
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: SizedBox(
                      width: double.infinity,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: AutoSizeText(
                          'ผู้เขียน ${prod.productWriter}',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                          minFontSize: 14,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: AutoSizeText(
                        '${formatter.format(prod.productPrice)} บาท',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                        minFontSize: 14,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(Icons.shopping_cart),
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            "เพิ่มลงตะกร้า",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w100),
                          ),
                        )),
                  )
                ],
              )))
        ]),

        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      ],
    );
  }

  Widget getListData() {
    return Column(
      children: [
        ...prodAllData.map((prod) => Padding(
              padding: const EdgeInsets.only(top: 20),
              child: BootstrapRow(
                children: <BootstrapCol>[
                  BootstrapCol(
                      sizes: 'col-4 ',
                      child: Column(
                        children: [
                          BootstrapRow(children: <BootstrapCol>[
                            BootstrapCol(
                              invisibleForSizes: " lg xl ",
                              sizes: 'col-12',
                              child: Center(
                                child: Container(
                                    child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        "/product?id=${prod.productId}");
                                  },
                                  child: Image.network(
                                      "${Global.hostImg}/${prod.productId}/${prod.productPic}",
                                      fit: BoxFit.cover,
                                      width: 200,
                                      height: 210),
                                )),
                              ),
                            )
                          ]),
                          BootstrapRow(children: <BootstrapCol>[
                            BootstrapCol(
                              invisibleForSizes: " md sm xs",
                              sizes: 'col-12',
                              child: Center(
                                child: Container(
                                    child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        "/product?id=${prod.productId}");
                                  },
                                  child: Image.network(
                                      "${Global.hostImg}/${prod.productId}/${prod.productPic}",
                                      fit: BoxFit.cover,
                                      width: 200,
                                      height: 280),
                                )),
                              ),
                            )
                          ]),
                        ],
                      )),
                  BootstrapCol(
                      sizes: 'col-8',
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/product?id=${prod.productId}");
                                },
                                child: AutoSizeText(
                                  prod.productName,
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600),
                                  minFontSize: 18,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: AutoSizeText(
                                      prod.productDetailEt,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              255, 104, 104, 104),
                                          fontWeight: FontWeight.w100),
                                      minFontSize: 14,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                )),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: SizedBox(
                                width: double.infinity,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: AutoSizeText(
                                    'ผู้เขียน ${prod.productWriter}',
                                    style: TextStyle(
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
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: SizedBox(
                                width: double.infinity,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: AutoSizeText(
                                    '${formatter.format(prod.productPrice)} บาท',
                                    style: TextStyle(
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
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: ElevatedButton.icon(
                                        onPressed: () {},
                                        icon: Icon(Icons.shopping_cart),
                                        label: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 10, 0, 10),
                                          child: Text(
                                            "เพิ่มลงตะกร้า",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w100),
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            )),
        ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
      ],
    );
  }
}
