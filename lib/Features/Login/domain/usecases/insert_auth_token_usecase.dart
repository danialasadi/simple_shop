import 'package:artacode_test/Features/Login/domain/repository/login_repository.dart';
import 'package:artacode_test/cores/params/login_usecase_params.dart';
import 'package:artacode_test/cores/params/onboarding_usecase_params.dart';
import 'package:artacode_test/cores/resources/data_state.dart';
import 'package:artacode_test/cores/usecase/use_case.dart';

class InsertAuthTokenUsecase
    extends UseCase<DataState<dynamic>, LoginUsecaseParams> {
  final LoginRepository loginRepository;

  InsertAuthTokenUsecase(this.loginRepository);

  @override
  Future<DataState<bool>> call({LoginUsecaseParams? param}) async {
    if (param?.key != null && param?.value != null) {
      return await loginRepository.dataBaseInsert(
        key: param!.key!,
        value: param.value!,
      );
    } else {
      return const DataFailed('خطا');
    }
  }
}
