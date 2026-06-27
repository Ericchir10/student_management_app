import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/user_model.dart';

class StudentListScreen extends StatefulWidget {
  const StudentListScreen({super.key});

  @override
  State<StudentListScreen> createState() => _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
  List<UserModel> students = [];

  @override
  void initState() {
    super.initState();
    _refresh();
  }

  Future<void> _refresh() async {
    final data = await DatabaseHelper.instance.getStudents();
    setState(() => students = data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student List")),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(students[i].name),
          subtitle: Text(students[i].course),
        ),
      ),
    );
  }
}