import '../../Utils/allExport.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundColor: AppColors.white,
      isShowDrawer: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
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
                    title: "Total Orders",
                    order: "1,250",
                    sales: "\$25,000",
                    bgColor: AppColors.surface200,
                    titleColor: AppColors.surface700,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: _AnalyticsCard(
                    title: "Total Sales",
                    order: "750",
                    sales: "\$15,000",
                    bgColor: AppColors.success100,
                    titleColor: AppColors.success700,
                  ),
                ),
              ],
            )
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
          Text(title, style: TextStyle(color: titleColor)),
          const SizedBox(height: 8),
          Text(
            order,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          const Text("Order"),
          const SizedBox(height: 4),
          Text("Sales\n$sales"),
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
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(color: textColor)),
          const SizedBox(height: 12),
          Text(
            count,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
