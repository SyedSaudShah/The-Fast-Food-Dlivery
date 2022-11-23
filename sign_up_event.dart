part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpFetchEvent extends SignUpEvent{
  String name;
  String email;
  String password;
  SignUpFetchEvent(this.name,this.email,this.password);
}
