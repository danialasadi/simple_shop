import 'package:artacode_test/cores/resources/data_state.dart';

abstract class OnBoardingRepository {
  Future<DataState<bool>> dataBaseInsert({required String key, required bool value});
}
