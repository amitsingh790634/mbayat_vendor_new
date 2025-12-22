import 'package:easy_localization/easy_localization.dart';

import '../../Utils/AllExport.dart';

class AppLanguageProvider extends ChangeNotifier {
  Locale appLocale = const Locale('en');

  AppLanguageProvider() {
    fetchLocale();
  }

  Future<void> fetchLocale() async {
    final savedLang = sharedPrefs?.getString(LocalConfig.languageCode);

    if (savedLang != null) {
      appLocale = Locale(savedLang);
    } else {
      appLocale = WidgetsBinding.instance.platformDispatcher.locale;
    }

    notifyListeners();
  }

  Future<void> changeLanguage(BuildContext context, Locale newLocale) async {
    await context.setLocale(newLocale);
    sharedPrefs?.setString(LocalConfig.languageCode, newLocale.languageCode);
    notifyListeners();
  }
}
