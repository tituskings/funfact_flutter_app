import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:funfact_app/settingsScreen.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  bool isLoading = true;
  List<dynamic> facts = [];

  void getData() async {
    try {
      Response response = await Dio().get(
          "https://raw.githubusercontent.com/tituskings/flutter_dummy_api/refs/heads/main/facts.json");

      facts = jsonDecode(response.data);
      isLoading = false;
      setState(() {});
    } catch (e) {
      print(e);
      isLoading = false;
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  //https://raw.githubusercontent.com/tituskings/flutter_dummy_api/refs/heads/main/facts.json
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Funfact"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Settingsscreen();
              }));
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.settings),
            ),
          )
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : PageView.builder(
              itemCount: facts.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        facts[index],
                        style: TextStyle(fontSize: 35),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
