import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginDatabase {
  final FlutterSecureStorage storage;
  LoginDatabase(this.storage);

  Future<void> insert({required String value, required String key}) async {
    return await storage.write(key: key, value: value.toString());
  }
}
