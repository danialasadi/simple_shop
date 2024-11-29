

import 'package:danial_asadi/Features/Shop/data/data_source/local/Shop_secure_storage.dart';
import 'package:danial_asadi/Features/Shop/domain/repository/Shop_repository.dart';
import 'package:danial_asadi/cores/resources/data_state.dart';

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
