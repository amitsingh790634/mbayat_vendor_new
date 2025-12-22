import 'package:mbayat_user_app/NetworkService/Service/internet_service.dart';

import '../../Utils/allExport.dart';

class InternetProvider with ChangeNotifier {
  InternetStatus _status = InternetStatus.connected;

  InternetStatus get status => _status;
  bool get isConnected => _status == InternetStatus.connected;

  InternetProvider() {
    InternetService().startMonitoring();
    InternetService().stream.listen((status) {
      _status = status;
      notifyListeners();
    });
  }
}
