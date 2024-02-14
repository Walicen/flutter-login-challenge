import 'package:flutter_login_challenge/app/core/errors/failure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late final Failure failure;

  setUpAll(() {
    failure = const ServerFailure(message: 'Error');
  });

  test('should be a abstract class', () {
    expect(failure, isA<Failure>());
  });

  // test message
  test('should be return a message', () {
    expect(failure.message, 'Error');
  });
}
