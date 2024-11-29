
import 'package:danial_asadi/Features/OnBoarding/data/data_source/local/onboarding_secure_storage.dart';
import 'package:danial_asadi/Features/OnBoarding/domain/repository/onboarding_repository.dart';
import 'package:danial_asadi/cores/resources/data_state.dart';

class OnBoardingRepositoryImpl extends OnBoardingRepository {
  final OnBoardingDatabase onBoardingDatabase;

  OnBoardingRepositoryImpl(this.onBoardingDatabase);

  @override
  Future<DataState<bool>> dataBaseInsert(
      {required String key, required bool value}) async {
    try {
      await onBoardingDatabase.insert(value: value, key: key);
    } catch (e) {
      return const DataFailed('خطا');
    }

    return const DataSuccess(true);
  }
}
