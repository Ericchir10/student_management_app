import 'package:flutter/material.dart';
import '../models/student.dart';
import '../services/student_service.dart';

class AddStudentScreen extends StatelessWidget {
  final _nameController = TextEditingController();
  final _courseController = TextEditingController();

  AddStudentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Student")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: 'Name')),
            TextField(controller: _courseController, decoration: const InputDecoration(labelText: 'Course')),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_nameController.text.isNotEmpty) {
                  await StudentService().insert(Student(name: _nameController.text, course: _courseController.text));
                  Navigator.pop(context);
                }
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}