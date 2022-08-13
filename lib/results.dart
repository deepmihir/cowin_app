import 'dart:convert';
import 'dart:ffi';

import 'package:cowin_app/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Results extends StatefulWidget {
  const Results({Key? key}) : super(key: key);

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  var session = [];
  var listC = 0;
  var pincode = '';
  @override
  void initState() {
    print("Result are coming");
    pincode = MyHome.pincode;
    getData();
    super.initState();
  }

  getData() async {
    var url = Uri.parse(
        'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=$pincode&date=13-08-2022');
    var response = await http.get(url);
    // print(response.body);
    var decode = json.decode(response.body);
    session = decode['sessions'];
    setState(() {
      listC = session.length;
    });
    print(session);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Vaccination Centers"),
      ),
      body: Container(
          child: ListView.builder(
              itemCount: listC,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(top: 10, right: 20, left: 20),
                  height: 200,
                  child: Container(
                    margin: EdgeInsets.only(top: 10, right: 20, left: 20),
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(session[index]['name']),
                          Text(session[index]['vaccine']),
                          Text(session[index]['fee_type']),
                          Text(session[index]['address']),
                        ],
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
