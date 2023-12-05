import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_db/local_db/local_database.dart';
import 'package:local_db/models/student_model.dart';
import 'package:meta/meta.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  StudentBloc() : super(StudentInitial()) {
   on<AddStudentEvent>(_addStudent);
   on<GetAllStudentEevent>(_getAllStudent);
   on<DeleteSingleStudentEvent>(_deleteSingleStudent);
   on<UpdateStudentEvent>(_updateStudent);
  }


  _addStudent(AddStudentEvent event,Emitter emit)async{
    emit(StudentLoadingState());
    try{
    await LocalDatabase.insertStudent(event.studentModel);
    emit(StudentSuccessState(students: []));
    }
    catch(e){
      emit(StudentErrorState(errorText: e.toString()));
    }
  }

  _updateStudent(UpdateStudentEvent event,Emitter emit)async{
    emit(StudentLoadingState());
    try{
      await LocalDatabase.updateStudent(studentModel: event.studentModel);
      emit(StudentSuccessState(students: []));
    }
    catch(e){
      emit(StudentErrorState(errorText: e.toString()));
    }
  }

  _getAllStudent(GetAllStudentEevent event, Emitter emit)async{
    emit(StudentLoadingState());
      List<StudentModel> allStudent= [];
    try{
      allStudent =  await LocalDatabase.getAllStudent();
      emit(StudentSuccessState(students: allStudent));
    }
        catch(e){
      emit(StudentErrorState(errorText: e.toString()));
        }
  }

  _deleteSingleStudent(DeleteSingleStudentEvent event, Emitter emit)async{
    emit(StudentLoadingState());
    List<StudentModel> model = [];
  try{
    await LocalDatabase.deleteStudent(event.id);
    model = await LocalDatabase.getAllStudent();
    emit(StudentSuccessState(students: model));
  }
      catch(e){
    emit(StudentErrorState(errorText: e.toString()));
      }
  }
}
