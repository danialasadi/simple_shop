import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ShopDatabase {
  final FlutterSecureStorage storage;
  ShopDatabase(this.storage);

  Future<void> delete({required String key}) async {

    print(key);

    await storage.delete(key: key);
  }
}
