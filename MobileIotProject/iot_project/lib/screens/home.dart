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
          appBar: AppBar(
            backgroundColor: Color(0xff2c2c2c),
            title: Text("IOT PROJECT"),
            centerTitle: true,
            shadowColor: Colors.red,
          ),
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
          padding: EdgeInsets.only(top: 20.0),
          color: Color(0xff2c2c2c),
          child: ListView(
            children: [
              // ignore: avoid_unnecessary_containers
              Container(
                height: 435,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 10),
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
                    ),
                    //Data Table

                    Container(
                      margin: EdgeInsets.only(bottom: 10.0),
                      height: 285,
                      color: Color(0xff191919),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TeamcityListApp(),
                        ],
                      ),
                    ),
                    Container(
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
                    ),
                  ],
                ),
              ),

              // ignore: avoid_unnecessary_containers
              Container(
                height: 280,
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
                            children: const <Widget>[
                              Directionality(
                                child: GreenLedButton(),
                                textDirection: TextDirection.ltr,
                              ),
                              Directionality(
                                child: RedLedButton(),
                                textDirection: TextDirection.ltr,
                              ),
                              Directionality(
                                child: BlueLedButton(),
                                textDirection: TextDirection.ltr,
                              ),
                              Directionality(
                                child: CloseLedButton(),
                                textDirection: TextDirection.ltr,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
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
                            children: const <Widget>[
                              Directionality(
                                child: Text(''),
                                textDirection: TextDirection.ltr,
                              ),
                              Directionality(
                                child: SocketOpenButton(),
                                textDirection: TextDirection.ltr,
                              ),
                              Directionality(
                                child: SocketCloseButton(),
                                textDirection: TextDirection.ltr,
                              ),
                              Directionality(
                                child: Text(''),
                                textDirection: TextDirection.ltr,
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

  // ignore: deprecated_member_use
  late List<TeamcityData> list;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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

                        /// ÖNEMLİ !!!!
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
            onRefresh: refreshTeamcityData)
        // ignore: sized_box_for_whitespace
      ],
    );
  }

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
