import 'package:artacode_test/cores/resources/data_state.dart';

abstract class SplashScreenRepository {
 

 

  Future<DataState<bool>> dataBaseRead({required String key});
}
