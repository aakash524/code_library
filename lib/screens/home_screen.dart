import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/bg_img.jpg',
              fit: BoxFit.cover,
              height: height,
              width: width,
            ),
            const Positioned(
              top: 50,
              left: 20,
              child: Text(
                'Home Screen',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
