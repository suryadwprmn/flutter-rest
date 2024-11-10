import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Getdata extends StatefulWidget {
  const Getdata({super.key});

  @override
  State<Getdata> createState() => _GetdataState();
}

class _GetdataState extends State<Getdata> {
  String result = "Tidak Ada data";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GET DATA'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(result),
              ElevatedButton(
                onPressed: () async {
                  var response = await http
                      .get(Uri.parse("https://reqres.in/api/users/2"));

                  if (response.statusCode == 200) {
                    Map<String, dynamic> data =
                        json.decode(response.body) as Map<String, dynamic>;
                    setState(() {
                      result =
                          '${data["data"]["email"]} - ${data["data"]["first_name"]} ${data["data"]["last_name"]}';
                    });
                  } else {
                    print("gagal");
                  }
                },
                style: ButtonStyle(
                  iconColor: WidgetStateProperty.all(Colors.blue),
                ),
                child: Text("GET"),
              )
            ],
          ),
        ));
  }
}
