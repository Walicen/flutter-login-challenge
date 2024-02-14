import 'package:flutter_login_challenge/app/core/http/custom_http.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCustomHttp extends Mock implements CustomHttp {}

void main() {
  late final CustomHttp customHttp;
  setUpAll(() {
    customHttp = MockCustomHttp();
  });

  group('CustomHttp', () {
    test('should be return a CustomHttp', () {
      expect(customHttp, isA<CustomHttp>());
    });

    test('should be return a valid response', () async {
      when(() => customHttp.get('url')).thenAnswer((_) async => 'response');
      final result = await customHttp.get('url');
      expect(result, 'response');
    });
  });
}
