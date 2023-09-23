part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class signupInitial extends AuthState {}

class signupLoading extends AuthState {}

class signupsuccess extends AuthState {}

class signupfailure extends AuthState {}
