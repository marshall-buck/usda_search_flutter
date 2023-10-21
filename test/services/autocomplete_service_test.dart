import 'package:flutter_test/flutter_test.dart';
import 'package:usda_search/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('AutocompleteServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
