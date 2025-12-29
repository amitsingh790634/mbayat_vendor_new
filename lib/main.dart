import 'package:easy_localization/easy_localization.dart';
import 'package:mbayat_user_app/NetworkService/Service/DioClient.dart';
import 'package:mbayat_user_app/utils/allExport.dart';

final loaderNotifier = LoaderNotifier();
GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
SharedPreferences? sharedPrefs;
final DioClient dioClient = DioClient(baseUrl: BASE_URL);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  sharedPrefs = await SharedPreferences.getInstance();

  final supportedLocales = await LocaleHelper.getSupportedLocales();
  EasyLocalization.logger.enableLevels = [];

  runApp(
    EasyLocalization(
      supportedLocales: supportedLocales, // 🔥 DYNAMIC
      path: 'assets/l10n',
      useOnlyLangCode: true,
      saveLocale: true,
      fallbackLocale: const Locale('en'),
      startLocale: WidgetsBinding.instance.platformDispatcher.locale,
      assetLoader: const RootBundleAssetLoader(),
      child: MultiProvider(
        providers: AppProvider.appProviders,
        child: ScreenUtilInit(
          designSize: const Size(390, 844),
          minTextAdapt: true,
          splitScreenMode: true,
          // child:  LoginScreen(),
          child: const MyPhone(),
        ),
      ),
    ),
  );
}
