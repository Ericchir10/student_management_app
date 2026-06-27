class UserModel {
  final int? id;
  final String name;
  final String course;

  UserModel({this.id, required this.name, required this.course});

  Map<String, dynamic> toMap() => {'id': id, 'name': name, 'course': course};
  
  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    id: map['id'],
    name: map['name'],
    course: map['course'],
  );
}