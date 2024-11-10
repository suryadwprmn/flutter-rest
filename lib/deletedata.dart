import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Deletedata extends StatelessWidget {
  const Deletedata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DELETE DATA'),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () async {
                var response = await http
                    .delete(Uri.parse('https://reqres.in/api/users/2'));
                if (response.statusCode == 204) {
                  print("Data Terhapus");
                } else {
                  print("Gagal Menghapus Data");
                }
              },
              child: const Text('DeleteData'))),
    );
  }
}
