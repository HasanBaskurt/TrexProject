// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, avoid_web_libraries_in_flutter, unused_import

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:iot_project/apis/api.dart';
import 'package:iot_project/buttons/socketButtons.dart';
import 'package:iot_project/buttons/tableButtons.dart';
import 'package:iot_project/buttons/rgbLedButtons.dart';
import 'package:iot_project/model/teamcityData.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "IOT PROJECT",
        home: Scaffold(
          /*appBar: AppBar(
            backgroundColor: Color(0xff2c2c2c),
            title: Text(
              "IOT PROJECT",
              style: TextStyle(
                color: Color(0xfffff8f4),
              ),
            ),
            centerTitle: true,
            shadowColor: Colors.red,
          ),*/
          body: appFunc(),
        ));
  }
}

class appFunc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 5.0),
          color: Color(0xff2c2c2c),
          child: ListView(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                height: 550,
                child: Column(
                  children: <Widget>[
                    /*Container(
                      child: Column(
                        children: <Widget>[
                          Row(
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
                        ],
                      ),
                    ),*/
                    //Data Table

                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      height: 540,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TeamcityListApp(),
                        ],
                      ),
                    ),
                    /*Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            textDirection: TextDirection.ltr,
                            children: const <Widget>[
                              Directionality(
                                child: AllDataButton(),
                                textDirection: TextDirection.ltr,
                              ),
                              Directionality(
                                child: SequentialButton(),
                                textDirection: TextDirection.ltr,
                              ),
                              Directionality(
                                child: LastestButton(),
                                textDirection: TextDirection.ltr,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            textDirection: TextDirection.ltr,
                            children: const <Widget>[
                              Directionality(
                                child: RunningButton(),
                                textDirection: TextDirection.ltr,
                              ),
                              Directionality(
                                child: FailureButton(),
                                textDirection: TextDirection.ltr,
                              ),
                              Directionality(
                                child: SuccessButton(),
                                textDirection: TextDirection.ltr,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),*/
                  ],
                ),
              ),

              // ignore: avoid_unnecessary_containers
              Container(
                height: 310,
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 140.0,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textDirection: TextDirection.ltr,
                            children: const <Widget>[
                              Text(
                                'RGB LED CONTROL',
                                style: TextStyle(
                                  fontFamily: 'Satisfy',
                                  fontSize: 20,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            textDirection: TextDirection.ltr,
                            children: [
                              Column(
                                children: const <Widget>[
                                  Directionality(
                                    child: GreenLedButton(),
                                    textDirection: TextDirection.ltr,
                                  ),
                                  Text("Green",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 18)),
                                ],
                              ),
                              Column(
                                children: const <Widget>[
                                  Directionality(
                                    child: RedLedButton(),
                                    textDirection: TextDirection.ltr,
                                  ),
                                  Text("Red",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 18)),
                                ],
                              ),
                              Column(
                                children: const <Widget>[
                                  Directionality(
                                    child: BlueLedButton(),
                                    textDirection: TextDirection.ltr,
                                  ),
                                  Text("Blue",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 18)),
                                ],
                              ),
                              Column(
                                children: const <Widget>[
                                  Directionality(
                                    child: CloseLedButton(),
                                    textDirection: TextDirection.ltr,
                                  ),
                                  Text("Close",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 140.0,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textDirection: TextDirection.ltr,
                            children: const <Widget>[
                              Text(
                                'SOCKET CONTROLLER',
                                style: TextStyle(
                                  fontFamily: 'Satisfy',
                                  fontSize: 20,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            textDirection: TextDirection.ltr,
                            children: [
                              Column(
                                children: [
                                  Directionality(
                                    child: Text(''),
                                    textDirection: TextDirection.ltr,
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Directionality(
                                    child: SocketOpenButton(),
                                    textDirection: TextDirection.ltr,
                                  ),
                                  Text("On",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 18)),
                                ],
                              ),
                              Column(
                                children: [
                                  Directionality(
                                    child: SocketCloseButton(),
                                    textDirection: TextDirection.ltr,
                                  ),
                                  Text("Off",
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 18)),
                                ],
                              ),
                              Column(
                                children: [
                                  Directionality(
                                    child: Text(''),
                                    textDirection: TextDirection.ltr,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

// Teamcity Data Table
class TeamcityListApp extends StatefulWidget {
  const TeamcityListApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => TeamcityListAppState();
}

class TeamcityListAppState extends State<TeamcityListApp> {
  List<TeamcityData> itemList = [];
  List<TeamcityData> lastList = [];

  // ignore: deprecated_member_use
  late List<TeamcityData> list;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
            child: Container(
              height: 285.0,
              child: ListView(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        headingRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.black),
                        dataRowColor: MaterialStateColor.resolveWith(
                            (states) => Colors.yellow),
                        // ignore: prefer_const_literals_to_create_immutables
                        columns: [
                          const DataColumn(
                              label: Text(
                            'Build Id',
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
                          const DataColumn(
                              label: Text(
                            'Date',
                            style: TextStyle(color: Colors.orange),
                          )),
                        ],

                        /// ??NEML?? !!!!
                        rows: List<DataRow>.generate(
                          itemList.length,
                          (index) => DataRow(
                              color: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (itemList[index].build_result.toString() ==
                                    "running")
                                  // ignore: curly_braces_in_flow_control_structures
                                  return Colors.lightBlueAccent;
                                else if (itemList[index]
                                        .build_result
                                        .toString() ==
                                    "failure")
                                  // ignore: curly_braces_in_flow_control_structures
                                  return Colors.red;
                                else if (itemList[index]
                                        .build_result
                                        .toString() ==
                                    // ignore: curly_braces_in_flow_control_structures
                                    "success") return Color(0xff008000);

                                return Colors.white; // Use the default value.
                              }),
                              cells: [
                                DataCell(Text('${itemList[index].id}')),
                                DataCell(Text('${itemList[index].build_name}')),
                                DataCell(
                                    Text('${itemList[index].build_event}')),
                                DataCell(
                                    Text('${itemList[index].build_result}')),
                                DataCell(Text(
                                    '${itemList[index].build_start_time}')),
                              ]),
                        )),
                  ),
                ],
              ),
            ),
            onRefresh: refreshTeamcityData),
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
              height: 150.0,
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
                            const DataColumn(
                                label: Text(
                              'Date',
                              style: TextStyle(color: Colors.orange),
                            )),
                          ],

                          /// ??NEML?? !!!!
                          rows: List<DataRow>.generate(
                            lastList.length,
                            (index) => DataRow(
                                color: MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  if (itemList[index].build_result.toString() ==
                                      "running")
                                    // ignore: curly_braces_in_flow_control_structures
                                    return Colors.lightBlueAccent;
                                  else if (itemList[index]
                                          .build_result
                                          .toString() ==
                                      "failure")
                                    // ignore: curly_braces_in_flow_control_structures
                                    return Colors.red;
                                  else if (itemList[index]
                                          .build_result
                                          .toString() ==
                                      // ignore: curly_braces_in_flow_control_structures
                                      "success") return Color(0xff008000);

                                  return Colors.white; // Use the default value.
                                }),
                                cells: [
                                  DataCell(Text('${itemList[index].id}')),
                                  DataCell(
                                      Text('${itemList[index].build_name}')),
                                  DataCell(
                                      Text('${itemList[index].build_event}')),
                                  DataCell(
                                      Text('${itemList[index].build_result}')),
                                  DataCell(Text(
                                      '${itemList[index].build_start_time}')),
                                ]),
                          )),
                    ),
                  ],
                ),
              ),
            ),
            onRefresh: refreshTeamcityLastData)
        // ignore: sized_box_for_whitespace
      ],
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
