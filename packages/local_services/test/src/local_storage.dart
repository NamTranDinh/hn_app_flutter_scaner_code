import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_services/local_services.dart';
import 'package:mocktail/mocktail.dart';

class _MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late SharedPreferences sharedPreferences;

  setUp(() {
    sharedPreferences = _MockSharedPreferences();
  });

  group('AppSharedPreferences', () {
    test('can be instantiated', () {
      expect(LocalStorage(sharedPreferences), isNotNull);
    });
  });
}
