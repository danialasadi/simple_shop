import 'package:artacode_test/cores/resources/data_state.dart';

abstract class LoginRepository {
  Future<DataState<String?>> login({required String email , required String pass });
  Future<DataState<String?>> register({required String email, required String pass});
    Future<DataState<bool>> dataBaseInsert(
      {required String key, required String value});

}
