import 'dart:developer' as dev;

import 'package:usda_db_package/usda_db_package.dart';

class LocalDbService {
  final DB _db = DB();

  Future<void> init() async {
    try {
      await _db.init();
    } catch (e, st) {
      dev.log('$e');
      dev.log('$st');
      throw Exception('LocalDBService init() error:  ******$e, $st');
    }
  }

  void dispose() => _db.dispose();

  /// Use to return a list of food descriptions from search term.
  ///
  ///Returns (description, length, id).
  Future<List<(String, num, String)?>> getAutoComplete(String term) async =>
      await _db.getDescriptions(term);
}
