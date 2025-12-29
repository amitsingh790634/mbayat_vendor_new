import '../utils/allExport.dart';

class AppProvider {
  static final List<SingleChildWidget> appProviders = [
    ChangeNotifierProvider(create: (_) => AppLanguageProvider()),
    ChangeNotifierProvider(create: (_) => InternetProvider()),
    ChangeNotifierProvider(create: (_) => LoaderNotifier()),
    ChangeNotifierProvider(create: (_) => PaginationProvider()),
    ChangeNotifierProvider(create: (_) => LoginProvider()),

    // Todo
  ];
}
