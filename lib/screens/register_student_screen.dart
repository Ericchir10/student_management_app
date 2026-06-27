import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/user_model.dart';

class RegisterStudentScreen extends StatefulWidget {
  const RegisterStudentScreen({super.key});

  @override
  State<RegisterStudentScreen> createState() => _RegisterStudentScreenState();
}

class _RegisterStudentScreenState extends State<RegisterStudentScreen> {
  final _nameController = TextEditingController();
  final _courseController = TextEditingController();

  Future<void> _saveStudent() async {
    // 1. Create the model object with the input text
    final newStudent = UserModel(
      name: _nameController.text,
      course: _courseController.text,
    );

    // 2. Insert into the local database
    await DatabaseHelper.instance.insertStudent(newStudent);

    // 3. Return to the previous screen
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Student")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Student Name"),
            ),
            TextField(
              controller: _courseController,
              decoration: const InputDecoration(labelText: "Course"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveStudent,
              child: const Text("Save Student"),
            ),
          ],
        ),
      ),
    );
  }
}