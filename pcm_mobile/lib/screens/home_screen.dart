import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trang chủ"),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<String?>(
          future: AuthService.getToken(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "JWT Token:\n\n${snapshot.data}",
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      ),
    );
  }
}
