import 'package:mbayat_user_app/utils/allExport.dart';

class LabelValueRow extends StatelessWidget {
  final String label;
  final String value;
  final AppTextType textType;
  final FontWeight valueFontWeight;
  final double gap;

  const LabelValueRow({
    super.key,
    required this.label,
    required this.value,
    this.textType = AppTextType.body,
    this.valueFontWeight = FontWeight.w500,
    this.gap = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: label,
          type: textType,
        ),
        kWidthGap(gap),
        TextWidget(
          text: ": $value",
          type: textType,
          fontWeight: valueFontWeight,
        ),
      ],
    );
  }
}
