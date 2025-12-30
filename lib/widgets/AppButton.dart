import 'package:easy_localization/easy_localization.dart';
import 'package:mbayat_user_app/Utils/AllExport.dart';

enum AppButtonType { primary, secondary }

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final AppButtonType type;
  final bool isDisabled;

  /// prefix icon/image
  final Widget? prefix;

  final double height;
  final double? width;
  final double radius;

  const AppButton({
    super.key,
    required this.text,
    this.onTap,
    this.type = AppButtonType.primary,
    this.isDisabled = false,
    this.prefix,
    this.height = 48,
    this.width,
    this.radius = 24,
  });

  bool get _disabled => isDisabled || onTap == null;

  @override
  Widget build(BuildContext context) {
    final bool isPrimary = type == AppButtonType.primary;

    return GestureDetector(
      onTap: _disabled ? null : onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: height,
        width: width??.infinity,
        padding: .symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: _backgroundColor(isPrimary),
          borderRadius: BorderRadius.circular(radius),
          border: _border(isPrimary),
          boxShadow: _shadow(isPrimary),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefix != null) ...[prefix!, const SizedBox(width: 8)],
            Text(text.tr(), style: _textStyle(isPrimary)),
          ],
        ),
      ),
    );
  }

  // ---------------- STYLES ----------------

  Color _backgroundColor(bool isPrimary) {
    if (_disabled) {
      return AppColors.neutral100;
    }
    return isPrimary ? AppColors.primary500 : Colors.transparent;
  }

  Border? _border(bool isPrimary) {
    if (isPrimary) return null;

    return Border.all(
      color: _disabled ? AppColors.neutral300 : AppColors.primary500,
      width: 1.2,
    );
  }

  List<BoxShadow>? _shadow(bool isPrimary) {
    if (!isPrimary || _disabled) return null;
    return AppShadows.sm;
  }

  TextStyle _textStyle(bool isPrimary) {
    if (_disabled) {
      return TextStyle(
        fontFamily: AppTypography.cabinet,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.neutral400,
      );
    }

    return TextStyle(
      fontFamily: AppTypography.cabinet,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: isPrimary ? AppColors.white : AppColors.primary500,
    );
  }
}
