import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetList extends StatelessWidget {
  List Listdata = [];

  GetList({super.key});

  Future<void> getData() async {
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/unknown"));
      var data = (json.decode(response.body) as Map<String, dynamic>)['data'];
      Listdata = data;
      print(Listdata);
    } catch (e) {
      print("Error $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GET DATA UNKNOWN'),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("Error: ${snapshot.error}"));
            } else {
              return ListView.builder(
                  itemCount: Listdata.length,
                  itemBuilder: (context, index) {
                    var data = Listdata[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Color(
                            int.parse(data['color'].replaceFirst('#', '0xff'))),
                      ),
                      title: Text("${data['name']}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Year: ${data['year']}"),
                          Text("Pantone Value: ${data['pantone_value']}"),
                        ],
                      ),
                      trailing: const Icon(Icons.more_vert),
                    );
                  });
            }
          }),
    );
  }
}
