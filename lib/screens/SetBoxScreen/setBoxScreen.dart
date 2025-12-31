import 'package:mbayat_user_app/Utils/allExport.dart';

class SetBoxScreen extends StatelessWidget {
  const SetBoxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabProvider = context.watch<SetBoxTabProvider>();

    return CustomScaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title
            TextWidget(
              text: "Set Box",
              type: AppTextType.h1,
              fontWeight: FontWeight.w600,
            ),

            const SizedBox(height: 16),

            /// Tabs
            Row(
              children: [
                _TabButton(
                  text: "Order History",
                  isSelected: tabProvider.selectedTab == 0,
                  onTap: () => context.read<SetBoxTabProvider>().changeTab(0),
                ),
                const SizedBox(width: 12),
                _TabButton(
                  text: "Product Details",
                  isSelected: tabProvider.selectedTab == 1,
                  onTap: () => context.read<SetBoxTabProvider>().changeTab(1),
                ),
              ],
            ),

            const SizedBox(height: 24),

            /// Content Switch
            tabProvider.selectedTab == 0
                ? const SetBoxList()
                : const ProductDetailsPlaceholder(),

            const SizedBox(height: 24),

            /// Create Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary500,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: TextWidget(
                  text: "Create a Box",
                  type: AppTextType.body,
                  color: AppColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const _TabButton({
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
          height: 44,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary500 : AppColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.primary500),
          ),
          child: Center(
            child: TextWidget(
              text: text,
              type: AppTextType.body,
              color: isSelected ? AppColors.white : AppColors.primary500,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class SetBoxList extends StatelessWidget {
  const SetBoxList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SetBoxCard(status: "ACTIVE", statusColor: AppColors.success600),
        SetBoxCard(status: "ACTIVE", statusColor: AppColors.success500),
        SetBoxCard(status: "PENDING", statusColor: AppColors.warning500),
        SetBoxCard(status: "PAUSED", statusColor: AppColors.danger500),
      ],
    );
  }
}

class SetBoxCard extends StatelessWidget {
  final String status;
  final Color statusColor;

  const SetBoxCard({
    super.key,
    required this.status,
    required this.statusColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.circle, size: 8, color: statusColor),
                      kWidthGap(6),
                      TextWidget(
                        text: status,
                        type: AppTextType.small,
                        color: statusColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),

                  kHeightGap(6),
                  TextWidget(
                    text: "\$44.99",
                    type: AppTextType.body,
                    color: AppColors.primary500,
                    fontWeight: FontWeight.w500,
                  ),
                  kHeightGap(6),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    child: TextWidget(
                      text: "Box includes lockets, rings, jewellery and Gifts.",
                      type: AppTextType.small,
                      color: AppColors.neutral500,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),

              SvgPic(
                image: AppImages.common,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
            ],
          ),

          kHeightGap(12),
          Row(
            children: [
              Expanded(
                child: _ActionButton(text: "Edit", filled: true, onTap: () {}),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _ActionButton(
                  text: "Details",
                  filled: false,
                  onTap: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String text;
  final bool filled;
  final VoidCallback onTap;

  const _ActionButton({
    required this.text,
    required this.filled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: filled ? AppColors.primary500 : AppColors.white,
          side: filled ? null : BorderSide(color: AppColors.primary500),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: TextWidget(
          text: text,
          type: AppTextType.small,
          color: filled ? AppColors.white : AppColors.primary500,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class ProductDetailsPlaceholder extends StatelessWidget {
  const ProductDetailsPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 48,
            color: AppColors.neutral400,
          ),
          const SizedBox(height: 12),
          TextWidget(
            text: "Product details will appear here",
            type: AppTextType.body,
            color: AppColors.neutral500,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
