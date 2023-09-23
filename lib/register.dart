import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:task1/Components/buttonn.dart';
import 'package:task1/Components/default_textform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task1/cubit/auth_cubit.dart';

class Register_Screen extends StatelessWidget {
  Register_Screen({super.key});
  final _formkey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  String? name;
  String? Email;
  final List<String> genderItems = [
    'Male',
    'Female',
  ];
  bool isloading = false;
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    MediaQueryData query = MediaQuery.of(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is signupLoading) {
          isloading = true;
        } else if (state is signupsuccess) {
          Navigator.pushNamed(context, 'Login/');
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
        return ModalProgressHUD(inAsyncCall: isloading,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          SizedBox(height: 40),
                          defaultTextForm(
                              text: 'User name',
                              icon: Icon(Icons.person),
                              controllerr: username,
                              func: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'please enter the name';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.name),
                          SizedBox(
                            height: 10,
                          ),
                          defaultTextForm(
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
                            height: 10,
                          ),
                          defaultTextForm(
                              text: 'Phone number',
                              icon: Icon(Icons.phone),
                              controllerr: phone,
                              func: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your correct phone please';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.phone),
                          SizedBox(
                            height: 10,
                          ),
                          defaultTextForm(
                              text: 'Age',
                              icon: Icon(Icons.person),
                              controllerr: age,
                              func: (value) {
                                if (value == null ||
                                    value.isEmpty ||
                                    value.length > 3) {
                                  return 'Enter the correct age';
                                } else {
                                  return null;
                                }
                              },
                              type: TextInputType.number),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: DropdownButtonFormField2<String>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                  // Add Horizontal padding using menuItemStyleData.padding so it matches
                                  // the menu padding when button's width is not specified.
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffaf164a), width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xffaf164a), width: 2),
                                    borderRadius: BorderRadius.circular(15),
                                  )
                                  // Add more decoration..
                                  ),
                              hint: const Text(
                                'Select Your Gender',
                                style: TextStyle(fontSize: 14),
                              ),
                              items: genderItems
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select gender.';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                //Do something when selected item is changed.
                              },
                              onSaved: (value) {
                                selectedValue = value.toString();
                              },
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 10),
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  color: Color(0xffaf164a),
                                ),
                                iconSize: 24,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an Account? ',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, 'Login/');
                                  },
                                  child: Text(
                                    'Sign in',
                                    style: TextStyle(color: Colors.blue),
                                  )),
                            ],
                          ),
                          Buttonn(
                            textt: "Sign up",
                            func: () {
                              if (_formkey.currentState!.validate()) {
                                BlocProvider.of<AuthCubit>(context).Signup(
                                    email.text.trim(), password.text.trim());
                                BlocProvider.of<AuthCubit>(context)
                                    .addUserdetails(
                                        username.text,
                                        email.text,
                                        password.text,
                                        phone.text,
                                        age.text,
                                        selectedValue.toString());
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Data Saved Successfully')));
                                BlocProvider.of<AuthCubit>(context).Name =
                                    username.text.trim();
                                BlocProvider.of<AuthCubit>(context).Eemail =
                                    email.text.trim();
                                Navigator.pushNamed(context, 'Login/');
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Somthing went wrong')));
                              }
                            },
                          )
                        ],
                      ),
                    ],
                  ))),
        );
      },
    );
  }
}
