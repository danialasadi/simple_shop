import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SplashScreenDatabase {
  final FlutterSecureStorage storage;
  SplashScreenDatabase(this.storage);



  Future<String?> read({required String key}) async {
    return await storage.read(key: key);
  }
}
