import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Mark Attendance")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // Example: Marking student with ID 1 as Present
            await DatabaseHelper.instance.markAttendance(1, DateTime.now().toString(), 'Present');
            if (context.mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Attendance Marked!")));
          },
          child: const Text("Mark Attendance"),
        ),
      ),
    );
  }
}