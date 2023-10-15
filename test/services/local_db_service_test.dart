import 'package:flutter_test/flutter_test.dart';
import 'package:usda_search/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('LocalDbServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
    group('init()', () {
      test('should not throw', () async {
        final service = getAndRegisterLocalDbService();

        expect(() async => await service.init(), returnsNormally);
      });
    });
    group('getDescriptions()', () {
      test('should return list of records', () async {
        final service = getAndRegisterLocalDbService();
        await service.init();
        final res = await service.getDescriptions('apple');
        expect(res, isNotEmpty);
      });
    });
  });
}
