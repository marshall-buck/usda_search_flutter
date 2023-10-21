import 'dart:developer' as dev;

import 'package:stacked/stacked_annotations.dart';
import 'package:usda_db_package/usda_db_package.dart';

class LocalDbService implements InitializableDependency {
  final DB _db = DB();
  @override
  Future<void> init() async {
    try {
      await _db.init();
    } catch (e, st) {
      dev.log('$e');
      dev.log('$st');
      throw Exception('LocalDBService init() error:  ******$e, $st');
    }
  }

  /// Nulls out DB data structures.
  void dispose() => _db.dispose();

  /// Use to return a list of sorted by length food descriptions from search term.
  Future<List<(String, num, String)?>> getAutoCompleteDescriptionRecords(
          String term) async =>
      await _db.getDescriptions(term);

  /// Get a FoodModel Item by Index
  FoodModel? getFood(String index) => _db.getFood(index);

  @override
  String toString() {
    return 'LocalDataBaseService: $_db}';
  }
}
