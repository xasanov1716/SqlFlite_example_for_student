import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_db/local_db/local_database.dart';
import 'package:local_db/models/student_model.dart';
import 'package:student/bloc/student/student_bloc.dart';
import 'package:student/ui/student/student_screen.dart';
import 'package:student/ui/student/widgets/global_button.dart';
import 'package:student/ui/student/widgets/global_text_fields.dart';
import 'package:student/utils/ui_utils/error_message_dialog.dart';

class UpdateStudent extends StatefulWidget {
  const UpdateStudent({Key? key}) : super(key: key);

  @override
  State<UpdateStudent> createState() => _UpdateStudentState();
}

class _UpdateStudentState extends State<UpdateStudent> {

  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<StudentBloc, StudentState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(height: 20,),
                GlobalTextField(
                    hintText: 'First Name',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.start,
                    controller: fname, prefixIcon: Icons.person,),
               const  SizedBox(height: 12,),
                GlobalTextField(
                    hintText: 'Last Name',
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.start,
                    controller: lname, prefixIcon: Icons.person),
               const  SizedBox(height: 12,),

                GlobalTextField(
                    hintText: 'Age',
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    textAlign: TextAlign.start,
                    controller: age, prefixIcon: Icons.person),
             const   Spacer(),
                GlobalButton(title: 'Save', onTap: () {
                  if(fname.text.isNotEmpty && lname.text.isNotEmpty && age.text.isNotEmpty){
                    print('IF GA KIRDI');
                    StudentModel model = StudentModel(firstName: fname.text, lastName: lname.text, age: int.parse(age.text));
                    BlocProvider.of<StudentBloc>(context).add(UpdateStudentEvent(studentModel: model));
                    BlocProvider.of<StudentBloc>(context).add(GetAllStudentEevent());
                    Navigator.pop(context);
                    showErrorMessage(message: 'QOSHILDI', context: context);
                  }else{
                    showErrorMessage(message: 'Maydonlar toliq emas', context: context);
                  }
                }),
               const SizedBox(height: 32,),
              ],
            );
          },
          listener: (context, state) {
            if(state is StudentErrorState){
              showErrorMessage(message: state.errorText, context: context);
            }
            if(state is StudentSuccessState){
              showErrorMessage(message: 'Student Qoshildi', context: context);
              Navigator.pop(context);
            }
          },
        ));
  }
}
