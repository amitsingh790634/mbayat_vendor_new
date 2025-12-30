import 'dart:async';

import 'package:mbayat_user_app/utils/allExport.dart';

class OtpProvider with ChangeNotifier{


 late Timer timer;
  int start = 60;

   final pinController = TextEditingController();

  /// Start OTP Timer
  void startTimer() {
    start = 60;
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          timer.cancel();
        } else {
          start--;
        }
        notifyListeners();
      },
    );
  }


}