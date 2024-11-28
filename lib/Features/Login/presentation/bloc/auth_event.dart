part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String pass;

  LoginEvent({required   this.email, required this.pass});
}

class RegisterEvent extends AuthEvent {


final String email;
  final String pass;

  RegisterEvent({required this.email, required this.pass});

}
