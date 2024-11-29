

import 'package:danial_asadi/Features/OnBoarding/domain/repository/onboarding_repository.dart';
import 'package:danial_asadi/cores/params/onboarding_usecase_params.dart';
import 'package:danial_asadi/cores/resources/data_state.dart';
import 'package:danial_asadi/cores/usecase/use_case.dart';

class InsertOnBoardingDatabaseUsecase
    extends UseCase<DataState<dynamic>, OnBoardingUsecaseParams> {
  final OnBoardingRepository onBoardingRepository;

  InsertOnBoardingDatabaseUsecase(this.onBoardingRepository);

  @override
  Future<DataState<bool>> call({OnBoardingUsecaseParams? param}) async {
    if (param?.key != null && param?.value != null) {
      return await onBoardingRepository.dataBaseInsert(
        key: param!.key!,
        value: param.value!,
      );
    } else {
      return const DataFailed('خطا');
    }
  }
}
