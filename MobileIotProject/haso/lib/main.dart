import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:haso/apis/api.dart';
import 'model/teamcityData.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

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
  getTeamcity() {
    Api.getTeamcities().then((response) {
      setState(() {
        var dataList = json.decode(response.body);
        for (var i = 0; i < dataList.length; i++) {
          itemList.add(TeamcityData.fromJson(dataList[i]));
        }
      });
    });
  }

  // ignore: deprecated_member_use
  late List<TeamcityData> list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff2c2c2c),
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
              child: Container(
                color: Colors.orange,
                height: 400.0,
                // ignore: avoid_unnecessary_containers
                child: Container(
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
                              ],

                              /// ÖNEMLİ !!!!
                              rows: List<DataRow>.generate(
                                itemList.length,
                                (index) => DataRow(cells: [
                                  DataCell(Text('${itemList[index].id}')),
                                  DataCell(
                                      Text('${itemList[index].build_name}')),
                                  DataCell(
                                      Text('${itemList[index].build_event}')),
                                  DataCell(
                                      Text('${itemList[index].build_result}')),
                                ]),
                              )),
                        ),
                        /*Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${itemList[index].id}'),
                                Text('${itemList[index].triggered_by}'),
                                Text('${itemList[index].build_name}'),
                                Text('${itemList[index].build_event}'),
                                Text('${itemList[index].build_result}')
                              ],
                            )*/
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    getTeamcity();
  }
}
