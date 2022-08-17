import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_table/responsive_table.dart';
import 'package:sell_books_web/global.dart';
import 'package:http/http.dart' as http;

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  late List<DatatableHeader> _headers;
  final box = GetStorage();
  final List<int> _perPages = [10, 20, 50, 100];
  int _total = 100;
  int? _currentPerPage = 10;
  List<bool>? _expanded;

  int _currentPage = 1;
  final List<Map<String, dynamic>> _sourceOriginal = [];
  List<Map<String, dynamic>> _sourceFiltered = [];
  List<Map<String, dynamic>> _source = [];
  List<Map<String, dynamic>> _selecteds = [];
  // ignore: unused_field
  final String _selectableKey = "id";

  String? _sortColumn;
  bool _sortAscending = true;
  bool _isLoading = true;
  var random = Random();
  List<Map<String, dynamic>> dataGet = [];
  @override
  void initState() {
    super.initState();
    getDataBuy();

    /// set headers
    _headers = [
      DatatableHeader(
        text: "หมายเลข\nสั่งซื้อ",
        value: "order_id",
        show: true,
        sortable: true,
        textAlign: TextAlign.center,
        sourceBuilder: (value, row) {
          return getShowOrder(row);
        },
      ),
      DatatableHeader(
        text: "รายละเอียด",
        value: "detail",
        show: true,
        sortable: true,
        flex: 2,
        textAlign: TextAlign.left,
        sourceBuilder: (value, row) {
          return getShowDetail(value);
        },
      ),
      DatatableHeader(
          text: "ยอดรวม",
          value: "totals",
          show: true,
          sortable: true,
          textAlign: TextAlign.center),
      DatatableHeader(
          text: "ที่อยู่จัดส่ง",
          value: "adr",
          flex: 2,
          show: true,
          sortable: true,
          textAlign: TextAlign.left),
      DatatableHeader(
        text: "สถานะ",
        value: "status",
        flex: 2,
        show: true,
        sortable: true,
        textAlign: TextAlign.center,
        sourceBuilder: (value, row) {
          return getShowStatus(value, row);
        },
      ),
    ];

    _initializeData();
  }

  Widget getShowOrder(Map<String?, dynamic> row) {
    return Column(
      children: [
        Text(
          row["order_id"],
          textAlign: TextAlign.center,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          row["dateShow"],
          textAlign: TextAlign.center,
          style: const TextStyle(
              color: Color.fromARGB(255, 146, 146, 146), fontSize: 10),
        )
      ],
    );
  }

  Widget getShowDetail(String data) {
    final split = data.split(',');
    return Column(
      children: [
        ...split.map((e) => Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(" - "),
                    Expanded(
                      child: Text(e),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                )
              ],
            )),
      ],
    );
  }

  Widget getShowStatus(String status, Map<String?, dynamic> row) {
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: status == "success" ? Colors.green : Colors.orange,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text(
                status == "success" ? "จัดส่งแล้ว" : "รอจัดส่ง",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white),
              ),
            )),
        Text(row["deli"]),
        status == "success" ? Text(row['deli_code']) : const Center()
      ],
    );
  }

  void getDataBuy() async {
    var url =
        "${Global.hostName}/get_his_buy.php?user_id=${box.read("user_id")}";
    var res = await http.get(Uri.parse(url));
    List<Map<String, dynamic>> temps = [];
    int i = 0;
    await json.decode(res.body)['data'].map((data) {
      temps.add({
        "id": i,
        "order_id": "#${data['order_id']}",
        "dateShow": data['date'],
        "detail": data['detail'].toString(),
        "totals": data['total'],
        "adr": data['adr'],
        "status": data['status'],
        "deli": data['deli'],
        "deli_code": data['deli_code']
      });
      i++;
    }).toList();

    dataGet = temps;
  }

  _initializeData() async {
    _mockPullData();
  }

  _mockPullData() async {
    _expanded = List.generate(_currentPerPage!, (index) => false);

    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 1)).then((value) {
      _sourceOriginal.clear();
      _sourceOriginal.addAll(dataGet);
      _sourceFiltered = _sourceOriginal;
      _total = _sourceFiltered.length;
      if (_total < 10) {
        _source = _sourceFiltered.getRange(0, _total).toList();
      } else {
        _source = _sourceFiltered.getRange(0, _currentPerPage!).toList();
      }
      setState(() => _isLoading = false);
    });
  }

  _resetData({start = 0}) async {
    setState(() => _isLoading = true);
    var expandedLen =
        _total - start < _currentPerPage! ? _total - start : _currentPerPage;
    Future.delayed(const Duration(seconds: 0)).then((value) {
      _expanded = List.generate(expandedLen as int, (index) => false);
      _source.clear();
      _source = _sourceFiltered.getRange(start, start + expandedLen).toList();
      setState(() => _isLoading = false);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      Container(
        constraints: const BoxConstraints(
          maxHeight: 700,
        ),
        child: Card(
          child: ResponsiveDatatable(
            reponseScreenSizes: const [ScreenSize.lg],
            headerDecoration: const BoxDecoration(
              color: Color.fromARGB(255, 101, 188, 231),
            ),
            headerTextStyle: const TextStyle(color: Colors.white),
            headers: _headers,
            source: _source,
            selecteds: _selecteds,
            showSelect: false,
            autoHeight: false,
            onChangedRow: (value, header) {
              /// print(value);
              /// print(header);
            },
            onSubmittedRow: (value, header) {
              /// print(value);
              /// print(header);
            },
            onTabRow: (data) {
              if (kDebugMode) {
                print(data);
              }
            },
            onSort: (value) {
              setState(() => _isLoading = true);

              setState(() {
                _sortColumn = value;
                _sortAscending = !_sortAscending;
                if (_sortAscending) {
                  _sourceFiltered.sort(
                      (a, b) => b["$_sortColumn"].compareTo(a["$_sortColumn"]));
                } else {
                  _sourceFiltered.sort(
                      (a, b) => a["$_sortColumn"].compareTo(b["$_sortColumn"]));
                }
                var rangeTop = _currentPerPage! < _sourceFiltered.length
                    ? _currentPerPage!
                    : _sourceFiltered.length;
                _source = _sourceFiltered.getRange(0, rangeTop).toList();

                _isLoading = false;
              });
            },
            expanded: _expanded,
            sortAscending: _sortAscending,
            sortColumn: _sortColumn,
            isLoading: _isLoading,
            onSelect: (value, item) {
              if (value!) {
                setState(() => _selecteds.add(item));
              } else {
                setState(() => _selecteds.removeAt(_selecteds.indexOf(item)));
              }
            },
            onSelectAll: (value) {
              if (value!) {
                setState(() =>
                    _selecteds = _source.map((entry) => entry).toList().cast());
              } else {
                setState(() => _selecteds.clear());
              }
            },
            footers: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Text("แสดงข้อมูล:"),
              ),
              if (_perPages.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButton<int>(
                    value: _currentPerPage,
                    items: _perPages
                        .map((e) => DropdownMenuItem<int>(
                              value: e,
                              child: Text("$e"),
                            ))
                        .toList(),
                    onChanged: (dynamic value) {
                      setState(() {
                        _currentPerPage = value;
                        _currentPage = 1;
                        _resetData();
                      });
                    },
                    isExpanded: false,
                  ),
                ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("$_currentPage - $_currentPerPage of $_total"),
              ),
              IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 16,
                ),
                onPressed: _currentPage == 1
                    ? null
                    : () {
                        var nextSet = _currentPage - _currentPerPage!;
                        setState(() {
                          _currentPage = nextSet > 1 ? nextSet : 1;
                          _resetData(start: _currentPage - 1);
                        });
                      },
                padding: const EdgeInsets.symmetric(horizontal: 15),
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, size: 16),
                onPressed: _currentPage + _currentPerPage! - 1 > _total
                    ? null
                    : () {
                        var nextSet = _currentPage + _currentPerPage!;

                        setState(() {
                          _currentPage = nextSet < _total
                              ? nextSet
                              : _total - _currentPerPage!;
                          _resetData(start: nextSet - 1);
                        });
                      },
                padding: const EdgeInsets.symmetric(horizontal: 15),
              )
            ],
          ),
        ),
      ),
    ]));
  }
}
