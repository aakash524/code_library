import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: const Stack(
        children: [
          // Positioned.fill(
          //   child: Image.asset(
          //     'assets/bg_img.jpg',
          //     fit: BoxFit.cover,
          //   ),
          // ),
          Text(
            'Home Screen',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
