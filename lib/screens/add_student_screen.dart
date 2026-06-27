import 'package:flutter/material.dart';
import 'package:student_management_app/models/user_model.dart';
import '../database/database_helper.dart';
import '../models/student.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});
  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  final _nameController = TextEditingController();
  final _courseController = TextEditingController();

  void _saveStudent() async {
    final newStudent = Student(
      name: _nameController.text, 
      course: _courseController.text
    );
    await DatabaseHelper.instance.insertStudent(newStudent as UserModel);
    if (mounted) Navigator.pop(context); // Goes back to the list
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add New Student")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: "Student Name")),
            TextField(controller: _courseController, decoration: const InputDecoration(labelText: "Course")),
            ElevatedButton(onPressed: _saveStudent, child: const Text("Save Student")),
          ],
        ),
      ),
    );
  }
}