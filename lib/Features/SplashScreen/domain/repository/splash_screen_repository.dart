
import 'package:danial_asadi/cores/resources/data_state.dart';

abstract class SplashScreenRepository {
 

 

  Future<DataState<bool>> dataBaseRead({required String key});
}
