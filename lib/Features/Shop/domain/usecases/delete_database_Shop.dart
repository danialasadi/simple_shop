import 'package:artacode_test/Features/Shop/domain/repository/Shop_repository.dart';
import 'package:artacode_test/Features/SplashScreen/domain/repository/splash_screen_repository.dart';
import 'package:artacode_test/cores/params/shop_usecase_params.dart';
import 'package:artacode_test/cores/params/login_usecase_params.dart';
import 'package:artacode_test/cores/resources/data_state.dart';
import 'package:artacode_test/cores/usecase/use_case.dart';

class DeleteShopDatabaseUsecase
    extends UseCase<DataState<dynamic>, ShopUsecaseParams> {
  final ShopRepository shopRepository;

  DeleteShopDatabaseUsecase(this.shopRepository);

  @override
  Future<DataState<bool>> call({ShopUsecaseParams? param}) async {



    if (param?.key != null) {

      return await shopRepository.dataBaseDelete(
        key: param!.key!,
      );
    } else {
      return const DataFailed('خطا');
    }
  }
}
