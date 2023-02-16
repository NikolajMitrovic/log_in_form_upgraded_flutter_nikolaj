// ignore_for_file: public_member_api_docs, sort_constructors_first
enum LoginStateStatus {
  initial,
  submitting,
  submitted,
}

class LoginState {
  final LoginStateStatus status; // status
  final SignInModel model; // klasa sa username i pw
  LoginState({
    required this.status,
    required this.model,
  });

  LoginState copyWith({
    LoginStateStatus? status,
    SignInModel? model,
  }) {
    return LoginState(
      status: status ?? this.status,
      model: model ?? this.model,
    );
  }
}

class SignInModel {
  String? username;
  String? password;
  SignInModel({
    this.username,
    this.password,
  });

  SignInModel copyWith({
    String? username,
    String? password,
  }) {
    return SignInModel(
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}
