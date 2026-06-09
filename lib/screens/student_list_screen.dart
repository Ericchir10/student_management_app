import 'package:flutter/material.dart';

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final students = [
      {
        'name': 'John Doe',
        'email': 'john@gmail.com',
        'grade': 'A'
      },
      {
        'name': 'Mary Wanjiku',
        'email': 'mary@gmail.com',
        'grade': 'B+'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(students[index]['name']!),
              subtitle: Text(
                '${students[index]['email']} - Grade ${students[index]['grade']}',
              ),
            ),
          );
        },
      ),
    );
  }
}