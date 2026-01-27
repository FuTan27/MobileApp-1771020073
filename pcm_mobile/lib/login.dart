import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> login(String email, String password) async {
  print("CALL API"); // 👈 DÒNG KIỂM TRA

  final url = Uri.parse('http://172.16.71.210/api/auth/login');

  final response = await http
    .post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    )
    .timeout(const Duration(seconds: 5));

  print("STATUS: ${response.statusCode}");
  print("BODY: ${response.body}");

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final token = data['token'];
    print('JWT: $token');
  } else {
    throw Exception('Login failed');
  }
  
}
