
import 'package:bloc/bloc.dart';
import 'package:danial_asadi/Features/Login/domain/usecases/insert_auth_token_usecase.dart';
import 'package:danial_asadi/Features/Login/domain/usecases/login_api_usecase.dart';
import 'package:danial_asadi/Features/Login/domain/usecases/register_api_usecase.dart';
import 'package:danial_asadi/Features/Login/presentation/bloc/auth_status.dart';
import 'package:danial_asadi/cores/params/login_usecase_params.dart';
import 'package:danial_asadi/cores/resources/data_state.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final InsertAuthTokenUsecase insertAuthTokenUsecase;
  final RegisterApiUsecase registerApiUsecase;
  final LoginApiUsecase loginApiUsecase;

  AuthBloc(this.insertAuthTokenUsecase, this.registerApiUsecase,
      this.loginApiUsecase)
      : super(AuthState(authStatus: AuthCompleted())) {
    on<LoginEvent>((event, emit) async {
      emit(state.copyWith(newAuthStatus: AuthLoading()));
      DataState dataState = await loginApiUsecase(
          param: LoginUsecaseParams(email: event.email, pass: event.pass));

      if (dataState is DataSuccess) {

        DataState dataStateToken = await insertAuthTokenUsecase(
            param: LoginUsecaseParams(
          value: dataState.data,
          key: 'token',
        ));

        if (dataStateToken is DataSuccess) {

          emit(state.copyWith(newAuthStatus: AuthCompleted()));
        }
      } else {

        emit(state.copyWith(newAuthStatus: AuthError(error: 'خطا')));
      }
    });

    on<RegisterEvent>((event, emit) async {
      emit(state.copyWith(newAuthStatus: AuthLoading()));
      DataState dataState = await registerApiUsecase(
          param: LoginUsecaseParams(email: event.email, pass: event.pass));

      if (dataState is DataSuccess) {

        DataState dataStateToken = await insertAuthTokenUsecase(
            param: LoginUsecaseParams(
          value: dataState.data,
          key: 'token',
        ));

        print(dataStateToken);
        if (dataStateToken is DataSuccess) {

          emit(state.copyWith(newAuthStatus: AuthCompleted()));
        }
          
      } else {

        emit(state.copyWith(newAuthStatus: AuthError(error: 'خطا')));
      }
    });
  }
}
