import '../../Utils/allExport.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.white,
      isShowDrawer: true,
      body: SingleChildScrollView(
        // padding: const EdgeInsets.all(16),
        padding: .symmetric(horizontal: 16, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: "dashboard_analytics",
              type: AppTextType.h3,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
            kHeightGap(12),
            Row(
              children: const [
                Expanded(
                  child: _AnalyticsCard(
                    title: "individual_order",
                    order: "1,250",
                    sales: "\$25,000",
                    bgColor: AppColors.surface200,
                    titleColor: AppColors.surface700,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _AnalyticsCard(
                    title: "b2border",
                    order: "750",
                    sales: "\$15,000",
                    bgColor: AppColors.success100,
                    titleColor: AppColors.success700,
                  ),
                ),
              ],
            ),

            kHeightGap(20),
            const TextWidget(
              text: "types_of_boxes",
              type: AppTextType.h3,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            kHeightGap(12),
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: _BoxTypeCard(
                      title: "Mbayat\nMystery Box",
                      count: "3",
                      bgColor: Color(0xFFF3F1FA),
                      textColor: Color(0xFF6C5CE7),
                    ),
                  ),
                  kWidthGap(12),
                  Expanded(
                    child: _BoxTypeCard(
                      title: "Vendor\nMystery Box",
                      count: "1",
                      bgColor: Color(0xFFFFF1F0),
                      textColor: Colors.red,
                    ),
                  ),
                  kWidthGap(12),
                  Expanded(
                    child: _BoxTypeCard(
                      title: "Set Box",
                      count: "50",
                      bgColor: Color(0xFFF2FAF9),
                      textColor: Color(0xFF2AA198),
                    ),
                  ),
                ],
              ),
            ),
            kHeightGap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const TextWidget(
                  text: "mystery_box_order",
                  type: AppTextType.h3,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.filter_list,
                    size: 18,
                    color: AppColors.white,
                  ),
                  label: TextWidget(
                    text: "filter",
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
                ),
              ],
            ),
            kHeightGap(20),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return const _OrderCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AnalyticsCard extends StatelessWidget {
  final String title, order, sales;
  final Color bgColor, titleColor;

  const _AnalyticsCard({
    required this.title,
    required this.order,
    required this.sales,
    required this.bgColor,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: title,
            type: AppTextType.body,
            color: titleColor,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 8),
          TextWidget(
            text: order,
            type: AppTextType.h1,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(height: 6),
          const TextWidget(
            text: "order",
            type: AppTextType.h1,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          kHeightGap(4),
          TextWidget(
            text: sales,
            type: AppTextType.h1,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          kHeightGap(4),
          const TextWidget(
            text: "sales",
            type: AppTextType.h1,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}

class _BoxTypeCard extends StatelessWidget {
  final String title, count;
  final Color bgColor, textColor;

  const _BoxTypeCard({
    required this.title,
    required this.count,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      // height: 105,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            text: title,
            type: AppTextType.body,
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          kHeightGap(12),
          TextWidget(
            text: count,
            type: AppTextType.h1,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ],
      ),
    );
  }
}

class _OrderCard extends StatelessWidget {
  const _OrderCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LabelValueRow(label: "name", value: "Ali Muhammed"),
                  LabelValueRow(label: "age_gender", value: "25 / Male"),
                  LabelValueRow(label: "product", value: "Mystery Box"),
                  LabelValueRow(label: "status", value: "Delivered"),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextWidget(
                  text: "action",
                  type: AppTextType.small,
                  fontWeight: FontWeight.w500,
                ),
                kWidthGap(5),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColors.success600,
                  child: Icon(Icons.check, color: AppColors.white, size: 14),
                ),
                kWidthGap(8),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: AppColors.danger500,
                  child: Icon(Icons.close, color: AppColors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
