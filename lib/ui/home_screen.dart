import 'package:flutter/material.dart';
import 'package:flutter_rest/services/session_service.dart';

class HomeScreen extends StatelessWidget {
  SessionService _sessionService = SessionService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Home")),
        body: ElevatedButton(
            onPressed: () async {
              print(await _sessionService.getToken());
            },
            child: Text("Show Token")));
  }
}
