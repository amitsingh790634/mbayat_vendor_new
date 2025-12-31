import 'package:mbayat_user_app/screens/CustomBottomNav/DashboardScreen.dart';

import '../Utils/allExport.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startScreen();
    // Todo Set immersive mode with transparent status bar
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  Future<void> startScreen() async {
    Future.delayed(const Duration(seconds: 3), () async {
      routeScreen();
    });
  }

  Future<void> routeScreen() async {
    bool isLoggedIn = sharedPrefs?.getBool(LocalConfig.isLogin) ?? false;
    logDebug("Auth Token ${sharedPrefs?.getString(LocalConfig.token)}");
    if (isLoggedIn) {
      NavigationService.pushAndRemoveUntil(const DashboardScreen());
    } else {
      NavigationService.pushAndRemoveUntil(DashboardScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Center(child: Image.asset(AppImages.kEnLogo, fit: BoxFit.cover)),
    );
  }
}
