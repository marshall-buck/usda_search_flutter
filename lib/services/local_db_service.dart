import 'package:stacked/stacked_annotations.dart';

import 'dart:developer' as dev;

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
      // throw Exception('LocalDBService init() error');
    }
  }

  void dispose() => _db.dispose();

  /// Use to return a list of food descriptions from search term.
  ///
  ///Returns (description, length, id).
  Future<List<(String, num, String)?>> getDescriptions(String term) async =>
      await _db.getDescriptions(term);
}
