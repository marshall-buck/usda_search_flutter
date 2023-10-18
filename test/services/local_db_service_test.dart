import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:usda_search/app/app.locator.dart';
import 'package:usda_search/services/local_db_service.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('LocalDbServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
    group('init()', () {
      test('should not throw', () async {
        final real = LocalDbService();

        expect(() async => await real.init(), returnsNormally);
      });
    });
    group('getAutoComplete()', () {
      test('should return list of records', () async {
        final real = LocalDbService();
        await real.init();
        final res = await real.getAutoComplete('apple');
        expect(res, isNotEmpty);
        print(res);
        // expect(res.length, isNotEmpty);
      });
    });
  });
}
