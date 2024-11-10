import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PutPatch extends StatefulWidget {
  const PutPatch({super.key});

  @override
  State<PutPatch> createState() => _PutPatchState();
}

class _PutPatchState extends State<PutPatch> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  var result = "Tidak Ada Data";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PUT DATA'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          //Name TextField
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              label: Text("Name"),
            ),
          ),

          //Job TextField
          TextField(
            controller: jobController,
            decoration: const InputDecoration(
              label: Text("job"),
            ),
          ),
          const SizedBox(height: 15),
          ElevatedButton(
              onPressed: () async {
                var response = await http
                    .put(Uri.parse('https://reqres.in/api/users/2'), body: {
                  "name": nameController.text,
                  "job": jobController.text
                });
                print(response.body);
                setState(() {
                  result = response.body;
                });
              },
              child: const Text("Submit")),

          const SizedBox(
            height: 15,
          ),
          const Divider(),

          const SizedBox(
            height: 15,
          ),
          Text(result)
        ],
      ),
    );
  }
}
