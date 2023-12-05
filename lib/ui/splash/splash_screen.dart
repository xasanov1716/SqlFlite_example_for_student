import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student/bloc/student/student_bloc.dart';
import 'package:student/ui/student/student_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  _init() async {
    await Future.delayed(const Duration(seconds: 3));

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const StudentScreen();
          },
        ),
      );
    }
  }

  @override
  void initState() {
    _init();
    context.read<StudentBloc>().add(GetAllStudentEevent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
