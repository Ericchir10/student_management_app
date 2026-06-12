import 'package:flutter/material.dart';
import 'student_list_screen.dart';
import 'add_student_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const StudentListScreen())
                ),
                child: const Text("View List")
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => AddStudentScreen())
                ),
                child: const Text("Add Student")
            ),
          ],
        ),
      ),
    );
  }
}