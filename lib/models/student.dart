class Student {
  final int? id;
  final String name;
  final String course;

  Student({this.id, required this.name, required this.course});

  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'course': course};
  
  factory Student.fromMap(Map<String, dynamic> map) => Student(
    id: map['id'],
    name: map['name'],
    course: map['course'],
  );
}