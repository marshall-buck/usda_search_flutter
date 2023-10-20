import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:usda_search/app/app.locator.dart';
import 'package:usda_search/services/local_db_service.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('LocalDbServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
    group('init()', () {
      test('should not throw', () async {
        // final real = LocalDbService();

        // expect(() async => await real.init(), returnsNormally);
      });
    });
    group('getAutoComplete()', () {
      test('should return list of records', () async {
        final real = LocalDbService();
        await real.init();
        final res = await real.getAutoCompleteDescriptionRecords('app');

        expect(res, isNotEmpty);
        expect(
            res,
            everyElement(isA<(String, num, String)>()
                .having((e) => e.$1, 'first element', isA<String>())
                .having((e) => e.$2, 'second element', isA<num>())
                .having((e) => e.$3, 'third element', isA<String>())));
        real.dispose();
      });
      test('should return empty list on no results', () async {
        final real = LocalDbService();
        await real.init();
        final res = await real.getAutoCompleteDescriptionRecords('');

        expect(res, []);

        real.dispose();
      });
    });
    group('dispose() - ', () {
      test('disposes db properly', () async {
        final real = LocalDbService();
        await real.init();
        final string1 = real.toString();
        expect(string1.contains('null'), false);
        real.dispose();
        final string2 = real.toString();
        expect(string2.contains('null'), true);
      });
    });
  });
}
