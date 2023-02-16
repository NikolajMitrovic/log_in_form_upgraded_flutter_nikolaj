import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_in_form_flutter/bloc/login/login_event.dart';
import 'package:log_in_form_flutter/bloc/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(status: LoginStateStatus.initial, model: SignInModel())) {
    on<LoginUpdateEvent>(_update);
    on<LoginSubmitEvent>(_submit);
  }

  Future<void> _update(LoginUpdateEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(model: event.model));
  }

  Future<void> _submit(LoginSubmitEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(status: LoginStateStatus.submitting));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(status: LoginStateStatus.submitted, model: state.model));
  }
}
