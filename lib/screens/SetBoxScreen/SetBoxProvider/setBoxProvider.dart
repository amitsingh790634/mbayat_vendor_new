import 'package:mbayat_user_app/Utils/allExport.dart';

class SetBoxTabProvider extends ChangeNotifier {
  int _selectedTab = 0; // 0 = Order History, 1 = Product Details

  int get selectedTab => _selectedTab;

  void changeTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }
}
