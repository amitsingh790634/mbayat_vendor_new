import 'package:flutter/material.dart';

class PaginationProvider extends ChangeNotifier {
  int page = 1;
  int limit = 10;
  bool hasMore = true;
  bool isLoadingMore = false;

  void reset() {
    page = 1;
    hasMore = true;
    notifyListeners();
  }

  void nextPage() {
    page++;
    notifyListeners();
  }

  void setLoadingMore(bool value) {
    isLoadingMore = value;
    notifyListeners();
  }

  void updateHasMore(bool value) {
    hasMore = value;
    notifyListeners();
  }
}
