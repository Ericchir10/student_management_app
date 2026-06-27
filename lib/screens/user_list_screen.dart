import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/user_model.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  List<UserModel> users = [];

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    final data = await DatabaseHelper.instance.getStudents();
    setState(() => users = data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User List")),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(users[i].name),
          subtitle: Text(users[i].course),
        ),
      ),
    );
  }
}