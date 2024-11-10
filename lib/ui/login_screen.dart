import 'package:flutter/material.dart';
import 'package:flutter_rest/services/auth_services.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  AuthService _authService = AuthService();

  void _login(context) async {
    try {
      await _authService.login(
        _emailController.text,
        _passwordController.text,
      );

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Registration successful!")));

      // Navigate to home screen after successful registration
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Registration failed: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Column(
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: "Email"),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () {
              _login(context);
            },
            child: Text("Login"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/register");
            },
            child: Text("Belum punya akun? Daftar"),
          ),
        ],
      ),
    );
  }
}
