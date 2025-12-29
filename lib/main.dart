import 'package:easy_localization/easy_localization.dart';
import 'package:mbayat_user_app/NetworkService/Service/DioClient.dart';
import 'package:mbayat_user_app/utils/app_locales.dart';

import 'Utils/allExport.dart';

final loaderNotifier = LoaderNotifier();
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
SharedPreferences? sharedPrefs;
final DioClient dioClient = DioClient(baseUrl: BASE_URL);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  sharedPrefs = await SharedPreferences.getInstance();

  runApp(
    EasyLocalization(
      supportedLocales: AppLocales.supportedLocales,
      path: 'assets/l10n',
      fallbackLocale: AppLocales.fallback,
      useOnlyLangCode: true,
      saveLocale: true,
      startLocale: WidgetsBinding.instance.platformDispatcher.locale,
      child: MultiProvider(
        providers: AppProvider.appProviders,
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          child: const MyPhone(),
        ),
      ),
    ),
  );
}
