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
        final real = LocalDbService();

        expect(() async => await real.init(), returnsNormally);
        real.dispose();
      });
    });
    group('getAutoComplete()', () {
      test('should return list of sorted records', () async {
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
        for (var i = 0; i < res.length - 1; i++) {
          expect(res[i]!.$2 <= res[i + 1]!.$2, isTrue);
        }
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
    group('getFood() - ', () {
      test('gets the Food Item', () async {
        final real = LocalDbService();
        await real.init();
        final res = real.getFood("167513");
        expect(res?.id, '167513');
        expect(res?.description,
            'Pillsbury, Cinnamon Rolls with Icing, refrigerated dough');
        expect(res?.descriptionLength, 56);
        expect(res?.protein, 4.34);
        expect(res?.dietaryFiber, 1.4);
        expect(res?.satFat, 3.25);
        expect(res?.totFat, 11.3);
        expect(res?.totCarb, 53.4);
        expect(res?.calories, 330);
        expect(res?.totSugars, 21.3);
        real.dispose();
      });
      test('returns null on bad index', () async {
        final real = LocalDbService();
        await real.init();
        final noFood = real.getFood('bad index');

        expect(noFood, isNull);
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
