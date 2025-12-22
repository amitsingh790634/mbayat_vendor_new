import 'package:mbayat_user_app/Utils/AllExport.dart';

class AppShadows {
  static List<BoxShadow> xs = [
    BoxShadow(
      color: AppColors.neutral900.withOpacity(0.08),
      blurRadius: 4,
      offset: Offset(0, 1),
    ),
  ];

  static List<BoxShadow> sm = [
    BoxShadow(
      color: AppColors.neutral900.withOpacity(0.10),
      blurRadius: 6,
      offset: Offset(0, 2),
    ),
  ];

  static List<BoxShadow> md = [
    BoxShadow(
      color: AppColors.neutral900.withOpacity(0.12),
      blurRadius: 10,
      offset: Offset(0, 4),
    ),
  ];

  static List<BoxShadow> lg = [
    BoxShadow(
      color: AppColors.neutral900.withOpacity(0.15),
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ];

  static List<BoxShadow> xl = [
    BoxShadow(
      color: AppColors.neutral900.withOpacity(0.18),
      blurRadius: 24,
      offset: Offset(0, 12),
    ),
  ];

  static List<BoxShadow> xxl = [
    BoxShadow(
      color: AppColors.neutral900.withOpacity(0.22),
      blurRadius: 32,
      offset: Offset(0, 16),
    ),
  ];
}
