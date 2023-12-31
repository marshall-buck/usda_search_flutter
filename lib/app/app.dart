import 'package:usda_search/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:usda_search/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:usda_search/ui/views/home/home_view.dart';
import 'package:usda_search/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:usda_search/services/local_db_service.dart';
import 'package:usda_search/services/autocomplete_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    InitializableSingleton(classType: LocalDbService),

    LazySingleton(classType: AutocompleteService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
