part of 'auth_bloc.dart';

 class AuthState extends Equatable {
  final AuthStatus authStatus;

  const AuthState({
    required this.authStatus,
  });

  AuthState copyWith({
    AuthStatus? newAuthStatus,
  }) {
    return AuthState(
      authStatus: newAuthStatus ?? authStatus,
   
    );
  }

  @override
  List<Object?> get props => [authStatus];
}
