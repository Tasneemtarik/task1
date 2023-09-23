import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  dynamic? Eemail;
  dynamic? Name;
  AuthCubit() : super(signupInitial());
  Future<void> Signin(String emailAddress, String password) async {
    try {
      emit(signupLoading());
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      emit(signupsuccess());
    } on FirebaseAuthException catch (e) {
      emit(signupfailure());

      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future Signup(String email, String password) async {
    emit(signupLoading());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future addUserdetails(String Username, String email, String password,
      dynamic phone, dynamic age, String gender) async {
    dynamic response =
        await FirebaseFirestore.instance.collection('users').add({
      'User name': Username,
      'email': email,
      'password': password,
      'phone number': phone,
      'Age': age,
      'Gender': gender
    });
    Eemail = email;
    Name = Username;
    print('Saved your data');
  }
}
