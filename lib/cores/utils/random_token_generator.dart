import 'dart:math';

class RandomStringGenerator {
 static const String _characters =
      'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
 static final Random _random = Random();

  /// تولید رشته تصادفی با طول مشخص
 static String generate(int length) {
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _characters.codeUnitAt(_random.nextInt(_characters.length)),
      ),
    );
  }
}
