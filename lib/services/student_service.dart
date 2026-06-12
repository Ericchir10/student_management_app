import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/student.dart';

class StudentService {
  static final StudentService instance = StudentService._internal();
  factory StudentService() => instance;
  StudentService._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await openDatabase(
      join(await getDatabasesPath(), 'students.db'),
      version: 1,
      onCreate: (db, version) => db.execute(
        'CREATE TABLE Students(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, course TEXT)',
      ),
    );
    return _database!;
  }

  Future<int> insert(Student student) async => (await database).insert('Students', student.toMap());

  Future<List<Student>> getStudents() async {
    final List<Map<String, dynamic>> maps = await (await database).query('Students');
    return List.generate(maps.length, (i) => Student.fromMap(maps[i]));
  }

  Future<void> delete(int id) async => (await database).delete('Students', where: 'id = ?', whereArgs: [id]);
}