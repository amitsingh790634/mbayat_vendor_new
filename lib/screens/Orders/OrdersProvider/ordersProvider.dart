import 'package:mbayat_user_app/Utils/allExport.dart';

class OrderTabProvider extends ChangeNotifier {
  int _selectedTab = 0; // 0 = Recent, 1 = History

  int get selectedTab => _selectedTab;

  void changeTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }
}
