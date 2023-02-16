// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:log_in_form_flutter/bloc/login/login_state.dart';

abstract class LoginEvent {}

class LoginUpdateEvent extends LoginEvent {
  SignInModel model;
  LoginUpdateEvent({
    required this.model,
  });
}

class LoginSubmitEvent extends LoginEvent {}
