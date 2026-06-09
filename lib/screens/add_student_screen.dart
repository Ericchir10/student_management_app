import 'package:flutter/material.dart';

class AddStudentScreen extends StatelessWidget {
  AddStudentScreen({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final gradeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Student Name',
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: gradeController,
              decoration: const InputDecoration(
                labelText: 'Grade',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Student Added Successfully'),
                  ),
                );
              },
              child: const Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}