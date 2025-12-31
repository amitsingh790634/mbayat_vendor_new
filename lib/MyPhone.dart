import 'package:easy_localization/easy_localization.dart';
import 'package:mbayat_user_app/utils/allExport.dart';

import 'Utils/allExport.dart';

class MyPhone extends StatelessWidget {
  const MyPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => InternetProvider())],
      child: const _MyPhoneContent(),
    );
  }
}

class _MyPhoneContent extends StatelessWidget {
  const _MyPhoneContent();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: StatusBarStyle.light,
      child: MaterialApp(
        title: 'Mbayat Vendor',
        debugShowCheckedModeBanner: false,
        color: AppColors.primary500,
        navigatorKey: navigatorKey,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        home: SplashScreen(),
        builder: (context, child) {
          return Stack(
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: child,
              ),

              /// 🌐 Internet Status Bar
              const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: InternetStatusBar(),
              ),

              /// ⏳ Global Loader
              const GlobalLoader(),
            ],
          );
        },
      ),
    );
  }
}
