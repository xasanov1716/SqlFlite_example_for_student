import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_db/models/student_model.dart';
import 'package:local_db/local_db/local_database.dart';
import 'package:student/bloc/student/student_bloc.dart';
import 'package:student/ui/student/subsreen/add_student.dart';
import 'package:student/utils/colors/app_colors.dart';
import 'package:student/utils/ui_utils/error_message_dialog.dart';


class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.c_0C1A30,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.c_0C1A30,
          actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddStudent()));
          }, icon: Icon(Icons.add))
        ],
      ),
      body: BlocConsumer<StudentBloc,StudentState>(
        builder: (context,state){
          if(state is StudentLoadingState){
            return const CupertinoActivityIndicator();
          }
          if(state is StudentSuccessState){
            return ListView(
              children: List.generate(state.students.length, (index) {
                StudentModel student = state.students[index];
                return ListTile(
                  title: Text(student.firstName,style: TextStyle(color: AppColors.c_3669C9,fontSize: 20),),
                  subtitle: Text(student.lastName,style: TextStyle(color: AppColors.c_838589,fontSize: 18)),
                  trailing: IconButton(onPressed: (){
                  }, icon: const Icon(Icons.delete,color: Colors.red,)),

                );
              }),
            );
          }
          return Text('ERROR');
        },
        listener: (context,state){
          if(state is StudentErrorState){
            showErrorMessage(message: state.errorText, context: context);
          }
        },
      )
    );
  }
}
