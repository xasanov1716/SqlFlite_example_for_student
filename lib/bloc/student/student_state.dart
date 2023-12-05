part of 'student_bloc.dart';

@immutable
abstract class StudentState {}

class StudentInitial extends StudentState {}

class StudentLoadingState extends StudentState {}

class StudentErrorState extends StudentState {

  final String errorText;
  StudentErrorState({required this.errorText});
}


class StudentSuccessState extends StudentState {
  List<StudentModel> students;

  StudentSuccessState({required this.students});
}


