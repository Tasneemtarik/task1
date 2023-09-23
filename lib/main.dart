import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/cubit/auth_cubit.dart';
import 'package:task1/home_page.dart';
import 'package:task1/login_page.dart';
import 'package:task1/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Task());
}

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          'register/': (context) => Register_Screen(),
          'Login/': (context) => Login(),
          'HomePage/': (context) => HomePage()
        },
        initialRoute: 'register/',
      ),
    );
  }
}
