import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AutogetData extends StatelessWidget {
  List allUsers = [];

  AutogetData({super.key});

  Future<void> getAllUsers() async {
    try {
      var response = await http.get(Uri.parse("https://reqres.in/api/users"));
      var data = (json.decode(response.body) as Map<String, dynamic>)['data'];
      allUsers = data; // Simpan data pengguna ke allUsers
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GET DATA'),
      ),
      body: FutureBuilder(
        future: getAllUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return ListView.builder(
              itemCount: allUsers.length,
              itemBuilder: (context, index) {
                var user = allUsers[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user['avatar']),
                  ),
                  title: Text("${user['first_name']} ${user['last_name']}"),
                  subtitle: Text("${user['email']}"),
                );
              },
            );
          }
        },
      ),
    );
  }
}
