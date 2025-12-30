import 'package:mbayat_user_app/screens/OtpScreen/OtpProvider/otpProvider.dart';

import '../utils/allExport.dart';

class AppProvider {
  static final List<SingleChildWidget> appProviders = [
    ChangeNotifierProvider(create: (_) => AppLanguageProvider()),
    ChangeNotifierProvider(create: (_) => InternetProvider()),
    ChangeNotifierProvider(create: (_) => LoaderNotifier()),
    ChangeNotifierProvider(create: (_) => PaginationProvider()),
    ChangeNotifierProvider(create: (_) => LoginProvider()),
    ChangeNotifierProvider(create: (_) => OtpProvider()),

    // Todo
  ];
}
