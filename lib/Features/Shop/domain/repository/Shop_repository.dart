import 'package:danial_asadi/cores/resources/data_state.dart';

abstract class ShopRepository {
 

 

  Future<DataState<bool>> dataBaseDelete({required String key});
}
