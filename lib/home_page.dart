import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/cubit/auth_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffaf164a),
        foregroundColor: Colors.black,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              'hello ,',
              style: TextStyle(color: Colors.pinkAccent),
            )),
            Text(
              BlocProvider.of<AuthCubit>(context).Eemail,
              style: TextStyle(fontSize: 20),
            )
          ],
        )
      ]),
    );
  }
}
