import 'package:mbayat_user_app/utils/allExport.dart';

class FilterButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final IconData icon;

  const FilterButton({
    super.key,
    required this.onTap,
    this.text = "filter",
    this.icon = Icons.filter_list,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 18,
        color: AppColors.white,
      ),
      label: TextWidget(
        text: text,
        type: AppTextType.body,
        fontSize: 14,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.filterButtonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
