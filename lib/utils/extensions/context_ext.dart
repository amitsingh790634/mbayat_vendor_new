import '../../Utils/AllExport.dart';

extension ContextExt on BuildContext {
  // Media
  Size get size => MediaQuery.of(this).size;
  double get width => size.width;
  double get height => size.height;

  // Padding
  EdgeInsets get padding => MediaQuery.of(this).padding;
  double get topInset => padding.top;
  double get bottomInset => padding.bottom;

  // Theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;

  // Keyboard
  void hideKeyboard() => FocusScope.of(this).unfocus();

  // Navigation
  void pop<T>([T? result]) => Navigator.of(this).pop(result);
  Future<T?> push<T>(Widget page) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (_) => page));
}
