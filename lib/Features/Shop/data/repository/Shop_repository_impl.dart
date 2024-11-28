import 'package:artacode_test/Features/Shop/data/data_source/local/Shop_secure_storage.dart';
import 'package:artacode_test/Features/Shop/domain/repository/Shop_repository.dart';
import 'package:artacode_test/Features/SplashScreen/data/data_source/local/splash_screen_secure_storage.dart';
import 'package:artacode_test/Features/SplashScreen/domain/repository/splash_screen_repository.dart';
import 'package:artacode_test/cores/resources/data_state.dart';

class ShopRepositoryImpl extends ShopRepository {
  final ShopDatabase shopDatabase;

  ShopRepositoryImpl(this.shopDatabase);

  @override
  Future<DataState<bool>> dataBaseDelete({required String key}) async {
    try {

      await shopDatabase.delete(key: key);

      return const DataSuccess(true);
    } catch (e) {
      return const DataFailed('خطا ، لطفا دپباره امتحان کنید');
    }
  }
}
