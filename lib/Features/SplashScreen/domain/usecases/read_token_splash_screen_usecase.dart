import 'package:artacode_test/Features/SplashScreen/domain/repository/splash_screen_repository.dart';
import 'package:artacode_test/cores/params/login_usecase_params.dart';
import 'package:artacode_test/cores/params/splash_screen_usecase_params.dart';
import 'package:artacode_test/cores/resources/data_state.dart';
import 'package:artacode_test/cores/usecase/use_case.dart';

class ReadTokenSplashScreenDatabaseUsecase
    extends UseCase<DataState<dynamic>, SplashScreenUsecaseParams> {
  final SplashScreenRepository splashScreenRepository;

  ReadTokenSplashScreenDatabaseUsecase.ReadTokenSplashScreenDatabaseUsecase(
      this.splashScreenRepository);

  @override
  Future<DataState<bool>> call({SplashScreenUsecaseParams? param}) async {
    if (param?.key != null) {
      return await splashScreenRepository.dataBaseRead(
        key: param!.key!,
      );
    } else {
      return const DataFailed('خطا');
    }
  }
}
