import 'package:artacode_test/cores/resources/data_state.dart';

abstract class ShopRepository {
 

 

  Future<DataState<bool>> dataBaseDelete({required String key});
}
