
import 'package:danial_asadi/Features/Login/data/data_source/local/login_secure_storage.dart';
import 'package:danial_asadi/Features/Login/data/data_source/remote/login_api_provider.dart';
import 'package:danial_asadi/Features/Login/domain/repository/login_repository.dart';
import 'package:danial_asadi/cores/resources/data_state.dart';
import 'package:danial_asadi/cores/utils/random_token_generator.dart';
import 'package:dio/dio.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginApiProvider loginApiProvider;
  final LoginDatabase loginDatabase;

  LoginRepositoryImpl(
    this.loginApiProvider,
    this.loginDatabase,
  );

  @override
  Future<DataState<String?>> login(
      {required String email, required String pass}) async {
    try {
      Response response =
          await loginApiProvider.login(email: email, pass: pass);

      if (response.statusCode == 200) {
        return DataSuccess(RandomStringGenerator.generate(8));
      } else {
        return const DataFailed("Something Went Wrong. try again...");
      }
    } on DioException {
      return const DataFailed("please check your connection...");
    }
  }

  @override
  Future<DataState<String?>> register(
      {required String email, required String pass}) async {
    try {
      Response response =
          await loginApiProvider.login(email: email, pass: pass);

      if (response.statusCode == 200) {
        print(response.data);
        return DataSuccess(RandomStringGenerator.generate(8));
      } else {
        return const DataFailed("Something Went Wrong. try again...");
      }
    } on DioException {
      return const DataFailed("please check your connection...");
    }
  }

  @override
  Future<DataState<bool>> dataBaseInsert(
      {required String key, required String value}) async {
    try {
      await loginDatabase.insert(value: value, key: key);
    } catch (e) {
      return const DataFailed('خطا');
    }

    return const DataSuccess(true);
  }
}
