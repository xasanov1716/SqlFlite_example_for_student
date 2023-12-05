class StudentModelFields {
  static const String id = '_id';
  static const String firstName = '_firstName';
  static const String lastName = '_lstName';
  static const String age = '_age';

  static const String tableName = 'students';
}

class StudentModel {
  int? id;
  final String firstName;
  final String lastName;
  final int age;

  StudentModel(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.age});

  StudentModel copyWith(
          {String? firstName, String? lastName, int? age, int? id}) =>
      StudentModel(
          firstName: firstName ?? this.firstName,
          lastName: lastName ?? this.lastName,
          age: age ?? this.age,
          id: id ?? this.id);

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
      firstName: json[StudentModelFields.firstName] as String? ?? '',
      lastName: json[StudentModelFields.lastName] as String? ?? '',
      age: json[StudentModelFields.age] as int? ?? 0,);

  Map<String, dynamic> toJson() => {
        StudentModelFields.firstName: firstName,
        StudentModelFields.lastName: lastName,
        StudentModelFields.age: age,
      };
}
