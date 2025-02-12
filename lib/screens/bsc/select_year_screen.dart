import 'package:code_library/screens/bsc/tab_bsc.dart';
import 'package:flutter/material.dart';

class StudentYearSelectionScreen extends StatelessWidget {
  const StudentYearSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
          appBar: AppBar(title: Text('Select Year')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Which Year Student Are You?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            _buildYearContainer(context, '1st Year', Colors.blue),
            const SizedBox(height: 20),
            _buildYearContainer(context, '2nd Year', Colors.green),
            const SizedBox(height: 20),
            _buildYearContainer(context, '3rd Year', Colors.orange),
          ],
        ),
      ),
    );
  }

  Widget _buildYearContainer(BuildContext context, String year, Color color) {
    return GestureDetector(
      onTap: () {
        // Navigate to next screen based on selected year
        // Replace with actual navigation logic
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BscTabsScreen(),
          ),
        );
      },
      child: Container(
        width: 250,
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: const Offset(0, 5),
            )
          ]
        ),
        child: Center(
          child: Text(
            year,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

 
  }
