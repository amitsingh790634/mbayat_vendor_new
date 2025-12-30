import 'package:mbayat_user_app/utils/allExport.dart';

class RecentOrderCard extends StatelessWidget {
  const RecentOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 12,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelValueRow(label: "product_name", value: "Mackup Kit"),
          kHeightGap(6),
          LabelValueRow(label: "box_type", value: "Vendor Mystery Box"),
          kHeightGap(6),
          LabelValueRow(label: "order_date", value: "12 Feb 2025"),
          kHeightGap(6),
          LabelValueRow(label: "customer_name", value: "Ali Muhammed"),

          const SizedBox(height: 12),

          /// Assign Button
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 36,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: TextWidget(
                  text: "assign_product",
                  type: AppTextType.small,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

