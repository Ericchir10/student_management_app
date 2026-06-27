import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Attendance Report")),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: DatabaseHelper.instance.getAttendanceReport(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, i) => ListTile(
              title: Text("Record ID: ${snapshot.data![i]['id']}"),
              subtitle: Text("Status: ${snapshot.data![i]['status']}"),
            ),
          );
        },
      ),
    );
  }
}