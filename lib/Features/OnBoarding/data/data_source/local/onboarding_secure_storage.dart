import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class OnBoardingDatabase {
  final FlutterSecureStorage storage;
  OnBoardingDatabase(this.storage);

  Future<void> insert({required bool value, required String key}) async {
    return await storage.write(key: key, value: value.toString());
  }


}
