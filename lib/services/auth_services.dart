import 'dart:convert';
import 'package:flutter_rest/services/session_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rest/models/response_model.dart';

const String baseUrl = "https://recipe.incube.id/api";

class AuthService {
  final SessionService _sessionService = SessionService();

  Future<Map<String, dynamic>> register(
      String name, String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': name,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 201) {
      // Jika registrasi berhasil

      ResponseModel res = ResponseModel.fromJson(jsonDecode(response.body));
      await _sessionService.saveToken(res.data['token']);
      await _sessionService.saveUser(res.data['user']['id'].toString(),
          res.data['user']['name'], res.data['user']['email']);
      // Simpan token dan data pengguna ke session
      return {"status": true, "message": res.message};
    } else if (response.statusCode == 422) {
      // Jika validasi gagal
      ResponseModel res = ResponseModel.fromJson(jsonDecode(response.body));
      Map<String, dynamic> errors = res.errors as Map<String, dynamic>;
      return {"status": false, "message": res.message};
    } else {
      // Jika ada kesalahan lainnya
      throw Exception('Gagal Register');
    }
  }

  
  
}
