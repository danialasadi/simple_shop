import 'package:artacode_test/Features/Login/domain/repository/login_repository.dart';
import 'package:artacode_test/cores/params/login_usecase_params.dart';
import 'package:artacode_test/cores/resources/data_state.dart';
import 'package:artacode_test/cores/usecase/use_case.dart';


class LoginApiUsecase  extends UseCase<DataState<dynamic>, LoginUsecaseParams> {
  final LoginRepository loginRepository;

  LoginApiUsecase(this.loginRepository);

  @override
  Future<DataState<dynamic>> call({LoginUsecaseParams? param}) async {
    if (param?.email != null  && param?.pass != null) {
      return await loginRepository.login(
          email: param!.email!, pass: param.pass!);
    } else {
      return const DataFailed('خطا');
    }
  }
}