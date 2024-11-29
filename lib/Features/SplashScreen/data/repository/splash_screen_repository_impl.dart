

import 'package:danial_asadi/Features/SplashScreen/data/data_source/local/splash_screen_secure_storage.dart';
import 'package:danial_asadi/Features/SplashScreen/domain/repository/splash_screen_repository.dart';
import 'package:danial_asadi/cores/resources/data_state.dart';

class SplashScreenRepositoryImpl extends SplashScreenRepository {
  final SplashScreenDatabase splashScreenDatabase;

  SplashScreenRepositoryImpl(this.splashScreenDatabase);

  @override
  Future<DataState<bool>> dataBaseRead({required String key}) async {
    try {
      String? token = await splashScreenDatabase.read(key: key);

  

      if (token != null) {
        return const DataSuccess(true);
      } else {
        return const DataSuccess(false);
      }
    } catch (e) {
      return const DataFailed('خطا ، لطفا دپباره امتحان کنید');
    }
  }
}
