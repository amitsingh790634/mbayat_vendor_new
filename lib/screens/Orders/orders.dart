import 'package:mbayat_user_app/utils/allExport.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OrderTabProvider>();

    return CustomScaffold(
      showBackButton: true,
      appBarBgColor: AppColors.primary500,
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OrderTabs(),
            kHeightGap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: provider.selectedTab == 0
                      ? "recent_orders"
                      : "order_history",
                  type: AppTextType.h1,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                  color: AppColors.black,
                ),
                FilterButton(onTap: () {}),
              ],
            ),

            kHeightGap(16),

            provider.selectedTab == 0
                ? const RecentOrderList()
                : const OrderHistoryList(),
          ],
        ),
      ),
    );
  }
}

class RecentOrderList extends StatelessWidget {
  const RecentOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(4, (index) => const RecentOrderCard()),
    );
  }
}

class OrderHistoryList extends StatelessWidget {
  const OrderHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(3, (index) => const HistoryOrderCard()),
    );
  }
}

class OrderTabs extends StatelessWidget {
  const OrderTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<OrderTabProvider>();

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.surface200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _TabItem(
            text: "recent_orders",
            isSelected: provider.selectedTab == 0,
            onTap: () => provider.changeTab(0),
          ),
          _TabItem(
            text: "order_history",
            isSelected: provider.selectedTab == 1,
            onTap: () => provider.changeTab(1),
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabItem({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary500 : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextWidget(
              text: text,
              type: AppTextType.body,
              color: isSelected ? AppColors.white : AppColors.neutral500,
              fontWeight: isSelected ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

