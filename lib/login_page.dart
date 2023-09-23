import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task1/cubit/auth_cubit.dart';
import 'package:task1/home_page.dart';

import 'Components/buttonn.dart';
import 'Components/default_textform.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
  
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  SharedPreferences? logindata;
  bool? newuser;
  String? emaill, passwordd;

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  bool isloading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     check_already_login();
    print('ok');
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is signupLoading) {
          isloading = true;
        } else if (state is signupsuccess) {
          Navigator.pushNamed(context, 'HomePage/');
        } else if (state is signupfailure) {
          final snackBar = SnackBar(
            content: const Text('Some thing wrong'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Find the ScaffoldMessenger in the widget tree
          // and use it to show a SnackBar.
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isloading,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xffaf164a),
              foregroundColor: Colors.black,
            ),
            body: Form(
                key: _formkey,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Column(
                      children: [
                        Text(
                          'Sign in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        SizedBox(height: 40),
                        defaultTextForm(
                            onchanged: (data) {
                              emaill = data;
                            },
                            text: 'email',
                            icon: Icon(Icons.email),
                            controllerr: email,
                            func: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  !value.endsWith('.com')) {
                                return 'wrong email';
                              } else {
                                return null;
                              }
                            },
                            type: TextInputType.emailAddress),
                        SizedBox(
                          height: 10,
                        ),
                        defaultTextForm(
                            onchanged: (data) {
                              passwordd = data;
                            },
                            text: 'password',
                            icon: Icon(Icons.lock),
                            controllerr: password,
                            func: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  value.length < 6) {
                                return 'wrong password';
                              } else {
                                return null;
                              }
                            },
                            type: TextInputType.visiblePassword),
                        SizedBox(
                          height: 30,
                        ),
                        Buttonn(
                          textt: "Sign in",
                          func: () async {
                            if (_formkey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context).Signin(
                                  emaill.toString().trim(),
                                  passwordd.toString().trim());
                            }
                           dynamic emailll = email.text.toString();
                          dynamic passworddd = password.text.toString();

                          logindata?.setBool('login', false);
                          logindata?.setString('email', emailll);
                          print(logindata?.getString('email'));
                            Navigator.popAndPushNamed(context, 'HomePage/');
                          },
                        )
                      ],
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
    void check_already_login() async {
    logindata = await SharedPreferences.getInstance();
    newuser = (logindata?.getBool('login') ?? true);
    //print(newuser);
  }

  void dipose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}

