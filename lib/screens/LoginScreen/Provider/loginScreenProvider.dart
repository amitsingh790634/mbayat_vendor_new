import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void login() async {
    _isLoading = true;
    notifyListeners();

    // Simulate API Call
    await Future.delayed(const Duration(seconds: 2));
    
    debugPrint("Logging in with: ${emailController.text}");
    
    _isLoading = false;
    notifyListeners();
  }
}