part of 'student_bloc.dart';

@immutable
abstract class StudentEvent {}


class AddStudentEvent extends StudentEvent {
  final StudentModel studentModel;

  AddStudentEvent({required this.studentModel});
}

class GetAllStudentEevent extends StudentEvent{

  GetAllStudentEevent();
}


class DeleteSingleStudentEvent extends StudentEvent{
  final int id;

  DeleteSingleStudentEvent({required this.id});
}

class UpdateStudentEvent extends StudentEvent {
  final StudentModel studentModel;

  UpdateStudentEvent({required this.studentModel});
}