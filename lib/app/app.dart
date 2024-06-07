import 'package:acadameet/ui/views/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../ui/views/dashboard/dashboard_view.dart';
import '../ui/views/startup/startup_view.dart';
import '../ui/views/unknown/unknown_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: StartupView,),
    CustomRoute(page: HomeView, path: '/', initial: true),
    CustomRoute(page: DashboardView, path: '/dashboard', deferredLoading: true),
    // @stacked-route

    CustomRoute(page: UnknownView, path: '/404'),

    /// When none of the above routes match, redirect to UnknownView
    RedirectRoute(path: '*', redirectTo: '/404'),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    // @stacked-service
  ],
  bottomsheets: [
    // StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    // StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
