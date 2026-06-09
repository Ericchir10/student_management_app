import 'package:flutter/material.dart';
import 'package:student_management_app/screens/students_list_screen.dart';
import 'package:student_management_app/screens/add_student_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          verticalDirection: VerticalDirection.down,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StudentsListScreen()),
              ),
              icon: const Icon(Icons.badge_rounded),
              label: const Text('View Enrolled Students'),
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 20)),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddStudentScreen()),
              ),
              icon: const Icon(Icons.person_add_alt_1_rounded),
              label: const Text('Register New Student'),
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 20)),
            ),
          ],
        ),
      ),
    );
  }
}