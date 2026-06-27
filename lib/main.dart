import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/student_list_screen.dart'; // Ensure this matches your filename
import 'screens/register_student_screen.dart';
import 'screens/attendance_screen.dart';
import 'screens/report_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const StudentManagementApp());
}

class StudentManagementApp extends StatelessWidget {
  const StudentManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Management System',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/students': (context) => const StudentListScreen(),
        '/add-student': (context) => const RegisterStudentScreen(),
        '/attendance': (context) => const AttendanceScreen(),
        '/report': (context) => const ReportScreen(),
      },
    );
  }
}