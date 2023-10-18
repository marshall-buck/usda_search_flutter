import 'package:stacked/stacked.dart';
import 'package:usda_search/app/app.locator.dart';
import 'package:usda_search/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:usda_search/services/local_db_service.dart';

import 'dart:developer' as dev;

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _localDBService = locator<LocalDbService>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    // await Future.delayed(const Duration(seconds: 3));
    // await _localDBService.init();
    // final res = await _localDBService.getDescriptions('apple');

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _navigationService.replaceWithHomeView();
    // dev.log('$res', name: 'Startup View Model');
  }
}
