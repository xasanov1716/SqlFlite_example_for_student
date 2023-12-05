import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:local_db/local_db/local_database.dart';
import 'package:local_db/models/student_model.dart';
import 'package:student/bloc/student/student_bloc.dart';
import 'package:student/ui/student/student_screen.dart';
import 'package:student/ui/student/widgets/global_button.dart';
import 'package:student/ui/student/widgets/global_text_fields.dart';
import 'package:student/utils/colors/app_colors.dart';
import 'package:student/utils/ui_utils/error_message_dialog.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({Key? key}) : super(key: key);

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  TextEditingController fname = TextEditingController();

  TextEditingController lname = TextEditingController();

  TextEditingController age = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
          backgroundColor: AppColors.c_0C1A30,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.c_0C1A30,
          ),
          body: BlocConsumer<StudentBloc, StudentState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    GlobalTextField(
                        hintText: 'First Name',
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        textAlign: TextAlign.start,
                        controller: fname, prefixIcon: Icons.person),
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
                        textInputAction: TextInputAction.done,
                        textAlign: TextAlign.start,
                        controller: age, prefixIcon: Icons.numbers),
                 const   Spacer(),
                    GlobalButton(title: 'Save', onTap: () {
                      if(fname.text.isNotEmpty && lname.text.isNotEmpty && age.text.isNotEmpty){
                        print('IF GA KIRDI');
                        StudentModel model = StudentModel(firstName: fname.text, lastName: lname.text, age: int.parse(age.text));
                        BlocProvider.of<StudentBloc>(context).add(AddStudentEvent(studentModel: model));
                        BlocProvider.of<StudentBloc>(context).add(GetAllStudentEevent());
                        Navigator.pop(context);
                        showMySnackbar(context);
                      }else{
                        showErrorMessage(message: 'Maydonlar toliq emas', context: context);
                      }
                    }),
                   const SizedBox(height: 32,),
                  ],
                ),
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
          )),
    );
  }

  void showMySnackbar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('Student Added'),
      duration: Duration(seconds: 3), // Duration for how long the Snackbar should be visible
      action: SnackBarAction(
        label: 'Student',
        onPressed: () {
          // Add an action when the "Undo" button is pressed
          // You can add custom logic here
        },
      ),
    );
}}
