import 'package:mbayat_user_app/utils/allExport.dart';

class HistoryOrderCard extends StatelessWidget {
  const HistoryOrderCard({super.key});

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
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LabelValueRow(label: "box_type", value: "Vendor Mystery Box"),
          kHeightGap(6),
          LabelValueRow(label: "order_date", value: "12 Feb 2025"),
          kHeightGap(6),
          LabelValueRow(label: "customer_name", value: "Ali Muhammed"),
          kHeightGap(6),
          LabelValueRow(label: "order_status", value: "Delivered"),

          // const SizedBox(height: 12),

          // /// Status Chip
          // Align(
          //   alignment: Alignment.centerRight,
          //   child: Container(
          //     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          //     decoration: BoxDecoration(
          //       color: AppColors.success100,
          //       borderRadius: BorderRadius.circular(20),
          //     ),
          //     child: TextWidget(
          //       text: "Completed",
          //       type: AppTextType.small,
          //       color: AppColors.success600,
          //       fontWeight: FontWeight.w500,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
