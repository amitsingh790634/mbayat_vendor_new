import 'package:easy_localization/easy_localization.dart';

import '../Utils/allExport.dart';

enum AppTextType {
  h1,
  h2,
  h3,
  title,
  subtitle,
  body,
  small,
  tiny,
  button,
  link,
  error,
}

class TextWidget extends StatelessWidget {
  final String text;
  final AppTextType type;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool underline;
  final bool italic;
  final bool strike;
  final double? letterSpacing;
  final double? height;

  const TextWidget({
    super.key,
    required this.text,
    this.type = AppTextType.body,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.underline = false,
    this.italic = false,
    this.strike = false,
    this.letterSpacing,
    this.height,
  });

  TextStyle _baseStyle() {
    switch (type) {
      case AppTextType.h1:
        return AppTypography.h1Style(color: color);
      case AppTextType.h2:
        return AppTypography.h2Style(color: color);
      case AppTextType.h3:
        return AppTypography.h3Style(color: color);
      case AppTextType.title:
        return AppTypography.titleStyle(color: color);
      case AppTextType.subtitle:
        return AppTypography.subtitleStyle(color: color);
      case AppTextType.small:
        return AppTypography.smallStyle(color: color);
      case AppTextType.tiny:
        return AppTypography.tinyStyle(color: color);
      case AppTextType.button:
        return AppTypography.buttonStyle(color: color);
      case AppTextType.link:
        return AppTypography.linkStyle(color: color);
      case AppTextType.error:
        return AppTypography.errorStyle(color: color);
      case AppTextType.body:
        return AppTypography.bodyStyle(color: color);
    }
  }

  @override
  Widget build(BuildContext context) {
    final base = _baseStyle();

    return Text(
      text.tr(),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow ?? TextOverflow.ellipsis,
      style: base.copyWith(
        fontSize: fontSize ?? base.fontSize,
        fontWeight: fontWeight ?? base.fontWeight,
        letterSpacing: letterSpacing,
        height: height,
        fontStyle: italic ? FontStyle.italic : FontStyle.normal,
        decoration: underline
            ? TextDecoration.underline
            : strike
            ? TextDecoration.lineThrough
            : TextDecoration.none,
      ),
      softWrap: true,
    );
  }
}
