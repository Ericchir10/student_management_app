import '../models/student.dart';

class StudentService {
  final List<Student> students = [];

  void addStudent(Student student) {
    students.add(student);
  }

  List<Student> getStudents() {
    return students;
  }

  void deleteStudent(String id) {
    students.removeWhere((student) => student.id == id);
  }
}