import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:haso/apis/api.dart';
import 'model/tableButtons.dart';
import 'model/teamcityData.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TeamcityListApp(),
    );
  }
}

class TeamcityListApp extends StatefulWidget {
  const TeamcityListApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TeamcityListAppState();
}

class TeamcityListAppState extends State {
  List<TeamcityData> itemList = [];
  List<TeamcityData> lastList = [];

  // ignore: deprecated_member_use
  late List<TeamcityData> list;
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        // ignore: prefer_const_constructors
        backgroundColor: Color(0xff2c2c2c),
        shadowColor: Colors.red,
        title: const Text(
          "IOT PROJECT",
          style: TextStyle(color: Colors.orange),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.ltr,
                    children: const <Widget>[
                      Text(
                        'TEAMCITY DATA TABLE',
                        style: TextStyle(
                          fontFamily: 'Satisfy',
                          fontSize: 20,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                RefreshIndicator(
                  onRefresh: refreshTeamcityData,
                  child: Container(
                    color: Colors.orange,
                    height: 400.0,
                    child: Center(
                      child: ListView(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                                headingRowColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.black),
                                dataRowColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.white),
                                // ignore: prefer_const_literals_to_create_immutables
                                columns: [
                                  const DataColumn(
                                      label: Text(
                                    'Id',
                                    style: TextStyle(color: Colors.orange),
                                  )),
                                  const DataColumn(
                                      label: Text('Project Name',
                                          style:
                                              TextStyle(color: Colors.orange))),
                                  const DataColumn(
                                      label: Text(
                                    'Event',
                                    style: TextStyle(color: Colors.orange),
                                  )),
                                  const DataColumn(
                                      label: Text(
                                    'Result',
                                    style: TextStyle(color: Colors.orange),
                                  )),
                                  const DataColumn(
                                      label: Text(
                                    'Date',
                                    style: TextStyle(color: Colors.orange),
                                  )),
                                ],

                                /// ÖNEMLİ !!!!
                                rows: List<DataRow>.generate(
                                  itemList.length,
                                  (index) => DataRow(
                                      color: MaterialStateProperty.resolveWith<
                                          Color>((Set<MaterialState> states) {
                                        if (itemList[index]
                                                .build_result
                                                .toString() ==
                                            "running")
                                          return Colors.lightBlueAccent;
                                        else if (itemList[index]
                                                .build_result
                                                .toString() ==
                                            "failure")
                                          return Colors.red;
                                        else if (itemList[index]
                                                .build_result
                                                .toString() ==
                                            "success") return Color(0xff008000);

                                        return Colors
                                            .white; // Use the default value.
                                      }),
                                      cells: [
                                        DataCell(Text('${itemList[index].id}')),
                                        DataCell(Text(
                                            '${itemList[index].build_name}')),
                                        DataCell(Text(
                                            '${itemList[index].build_event}')),
                                        DataCell(Text(
                                            '${itemList[index].build_result}')),
                                        DataCell(Text(
                                            '${itemList[index].build_start_time}')),
                                      ]),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.0, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.ltr,
                    children: const <Widget>[
                      Text(
                        'TEAMCITY LAST DATA TABLE',
                        style: TextStyle(
                          fontFamily: 'Satisfy',
                          fontSize: 20,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                RefreshIndicator(
                    child: Container(
                      height: 200.0,
                      child: Center(
                        child: ListView(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                  headingRowColor:
                                      MaterialStateColor.resolveWith(
                                          (states) => Colors.black),
                                  dataRowColor: MaterialStateColor.resolveWith(
                                      (states) => Colors.white),
                                  // ignore: prefer_const_literals_to_create_immutables
                                  columns: [
                                    const DataColumn(
                                        label: Text(
                                      'Id',
                                      style: TextStyle(color: Colors.orange),
                                    )),
                                    const DataColumn(
                                        label: Text('Project Name',
                                            style: TextStyle(
                                                color: Colors.orange))),
                                    const DataColumn(
                                        label: Text(
                                      'Event',
                                      style: TextStyle(color: Colors.orange),
                                    )),
                                    const DataColumn(
                                        label: Text(
                                      'Result',
                                      style: TextStyle(color: Colors.orange),
                                    )),
                                    const DataColumn(
                                        label: Text(
                                      'Date',
                                      style: TextStyle(color: Colors.orange),
                                    )),
                                  ],

                                  /// ÖNEMLİ !!!!
                                  rows: List<DataRow>.generate(
                                    lastList.length,
                                    (index) => DataRow(
                                        color: MaterialStateProperty
                                            .resolveWith<Color>(
                                                (Set<MaterialState> states) {
                                          if (index.isEven) {
                                            return Colors.grey.withOpacity(0.3);
                                          }
                                          if (itemList[index]
                                                  .build_result
                                                  .toString() ==
                                              "running")
                                            return Colors.blue;
                                          else if (itemList[index]
                                                  .build_result
                                                  .toString() ==
                                              "failure")
                                            return Colors.red;
                                          else if (itemList[index]
                                                  .build_result
                                                  .toString() ==
                                              "success")
                                            return Color(0xff008000);

                                          return Colors
                                              .white; // Use the default value.
                                        }),
                                        cells: [
                                          DataCell(
                                              Text('${itemList[index].id}')),
                                          DataCell(Text(
                                              '${itemList[index].build_name}')),
                                          DataCell(Text(
                                              '${itemList[index].build_event}')),
                                          DataCell(Text(
                                              '${itemList[index].build_result}')),
                                          DataCell(Text(
                                              '${itemList[index].build_start_time}')),
                                        ]),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    onRefresh: refreshTeamcityLastData),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    refreshTeamcityData();
    refreshTeamcityLastData();
    super.initState();
  }

  Future refreshTeamcityData() async {
    Uri uri = Uri.parse('http://10.0.2.2:5000/api/buildLog');
    final response = await http.get(uri);
    var data = json.decode(response.body);
    setState(() {
      itemList.clear();
      for (var i = 0; i < data.length; i++) {
        itemList.add(TeamcityData.fromJson(data[i]));
      }
    });
  }

  Future refreshTeamcityLastData() async {
    Uri uri = Uri.parse('http://10.0.2.2:5000/api/list');
    final response = await http.get(uri);
    var data = json.decode(response.body);
    setState(() {
      lastList.clear();
      for (var i = 0; i < data.length; i++) {
        lastList.add(TeamcityData.fromJson(data[i]));
      }
    });
  }
}

/*class RefreshToken extends StatefulWidget {
  const RefreshToken({Key? key}) : super(key: key);

  @override
  State<RefreshToken> createState() => _RefreshTokenState();
}
*/
/*class _RefreshTokenState extends State<RefreshToken> {
  List<TeamcityData> itemList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown,
        appBar: AppBar(
          // ignore: prefer_const_constructors
          backgroundColor: Color(0xff2c2c2c),
          shadowColor: Colors.red,
          title: const Text(
            "IOT PROJECT",
            style: TextStyle(color: Colors.orange),
          ),
          centerTitle: true,
        ),
        body: RefreshIndicator(
          onRefresh: refreshTeamcityData,
          child: Container(
            color: Colors.orange,
            height: 400.0,
            child: Center(
              child: ListView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black),
                        dataRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.white),
                        // ignore: prefer_const_literals_to_create_immutables
                        columns: [
                          const DataColumn(
                              label: Text(
                            'Id',
                            style: TextStyle(color: Colors.orange),
                          )),
                          const DataColumn(
                              label: Text('Project Name',
                                  style: TextStyle(color: Colors.orange))),
                          const DataColumn(
                              label: Text(
                            'Event',
                            style: TextStyle(color: Colors.orange),
                          )),
                          const DataColumn(
                              label: Text(
                            'Result',
                            style: TextStyle(color: Colors.orange),
                          )),
                        ],

                        /// ÖNEMLİ !!!!
                        rows: List<DataRow>.generate(
                          itemList.length,
                          (index) => DataRow(cells: [
                            DataCell(Text('${itemList[index].id}')),
                            DataCell(Text('${itemList[index].build_name}')),
                            DataCell(Text('${itemList[index].build_event}')),
                            DataCell(Text('${itemList[index].build_result}')),
                          ]),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
/*
  getTeamcity() {
    Api.getTeamcities().then((response) {
      setState(() {
        var dataList = json.decode(response.body);
        for (var i = 0; i < dataList.length; i++) {
          itemList.add(TeamcityData.fromJson(dataList[i]));
        }
      });
    });
  }*/

  @override
  void initState() {
    refreshTeamcityData();
    super.initState();
  }

  Future refreshTeamcityData() async {
    Uri uri = Uri.parse('http://10.0.2.2:5000/api/buildLog');
    final response = await http.get(uri);
    var data = json.decode(response.body);
    setState(() {
      itemList.clear();
      for (var i = 0; i < data.length; i++) {
        itemList.add(TeamcityData.fromJson(data[i]));
      }
    });
  }
}
*/