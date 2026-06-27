import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Dashboard"),
        backgroundColor: Colors.blueAccent,
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2, // 2 items per row
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: [
          _buildDashboardButton(context, Icons.person_add, "Register", '/add-student'),
          _buildDashboardButton(context, Icons.list, "Student List", '/students'),
          _buildDashboardButton(context, Icons.check_circle, "Attendance", '/attendance'),
          _buildDashboardButton(context, Icons.bar_chart, "Reports", '/report'),
        ],
      ),
    );
  }

  // Helper widget to build menu buttons
  Widget _buildDashboardButton(BuildContext context, IconData icon, String label, String route) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.blueAccent),
            const SizedBox(height: 10),
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}