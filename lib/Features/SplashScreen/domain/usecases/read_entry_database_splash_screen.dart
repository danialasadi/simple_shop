

import 'package:danial_asadi/Features/SplashScreen/domain/repository/splash_screen_repository.dart';
import 'package:danial_asadi/cores/params/splash_screen_usecase_params.dart';
import 'package:danial_asadi/cores/resources/data_state.dart';
import 'package:danial_asadi/cores/usecase/use_case.dart';

class ReadEntrySplashScreenDatabaseUsecase
    extends UseCase<DataState<dynamic>, SplashScreenUsecaseParams> {
  final SplashScreenRepository splashScreenRepository;

  ReadEntrySplashScreenDatabaseUsecase(
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
