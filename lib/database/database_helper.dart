import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/user_model.dart'; // Ensure this matches your model file

class DatabaseHelper {
  // Singleton pattern
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('student_app.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE students (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        course TEXT NOT NULL
      )
    ''');
    
    await db.execute('''
      CREATE TABLE attendance (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        studentId INTEGER NOT NULL,
        date TEXT NOT NULL,
        status TEXT NOT NULL
      )
    ''');
  }

  // Operations
  Future<int> insertStudent(UserModel student) async {
    final db = await instance.database;
    return await db.insert('students', student.toMap());
  }

  Future<List<UserModel>> getStudents() async {
    final db = await instance.database;
    final result = await db.query('students');
    return result.map((json) => UserModel.fromMap(json)).toList();
  }

  Future<int> deleteStudent(int id) async {
    final db = await instance.database;
    return await db.delete('students', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> markAttendance(int studentId, String date, String status) async {
    final db = await instance.database;
    return await db.insert('attendance', {
      'studentId': studentId,
      'date': date,
      'status': status
    });
  }

  Future<List<Map<String, dynamic>>> getAttendanceReport() async {
    final db = await instance.database;
    return await db.query('attendance');
  }
}