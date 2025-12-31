import 'package:mbayat_user_app/utils/allExport.dart';

class SetBoxDetailsScreen extends StatelessWidget {
  const SetBoxDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      showBackButton: true,
      appBarBgColor: AppColors.primary500,
      backButtonColor: AppColors.white.withOpacity(0.1),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  AppImages.image2png,
                  width: double.infinity,
                  height: 220,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 8,
                          color: AppColors.primary500,
                        ),
                        const SizedBox(width: 6),
                        TextWidget(
                          text: "active",
                          type: AppTextType.small,
                          color: AppColors.success600,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            CustomPadding(
              // horizontal: true,
              size: PaddingSize.sm,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "valentine_box",
                    type: AppTextType.h1,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  kHeightGap(12),

                  Row(
                    children: const [
                      Expanded(
                        child: _InfoCard(
                          icon: AppImages.priceTag,
                          title: "PRICE",
                          value: "5 KD",
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _InfoCard(
                          icon: AppImages.inventoryIcon,
                          title: "INVENTORY",
                          value: "5 Units",
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: _InfoCard(
                          icon: AppImages.orderBagIcon,
                          title: "Orders",
                          value: "20",
                        ),
                      ),
                    ],
                  ),
                  kHeightGap(10),
                  TextWidget(
                    text: "description",
                    type: AppTextType.body,
                    fontWeight: FontWeight.w500,
                  ),
                  kHeightGap(5),
                  TextWidget(
                    text: "description_content",
                    maxLines: 9,
                    type: AppTextType.small,
                  ),
                  kHeightGap(10),
                  TextWidget(
                    text: "whats_inside",
                    type: AppTextType.body,
                    fontWeight: FontWeight.w500,
                  ),
                  kHeightGap(12),
                  SizedBox(
                    height: 160,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        return const _InsideItemCard();
                      },
                    ),
                  ),
                  kHeightGap(30),

                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: AppButton(
                            text: "edit_details",
                            type: AppButtonType.primary,
                            radius: 6,
                            onTap: () {},
                          ),
                        ),
                      ),
                      kWidthGap(10),
                      Expanded(
                        child: SizedBox(
                          height: 48,
                          child: AppButton(
                            text: "deactivate",
                            type: AppButtonType.secondary,
                            radius: 6,
                            onTap: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String icon;
  final String title;
  final String value;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon(icon, color: AppColors.primary500),
          SvgPic(
            image: icon,
            height: 20,
            width: 20,
            color: AppColors.primary500,
            fit: BoxFit.contain,
          ),
          kHeightGap(8),
          TextWidget(
            text: title,
            type: AppTextType.small,
            color: AppColors.neutral500,
            fontSize: 10,
          ),
          kHeightGap(4),
          TextWidget(
            text: value,
            type: AppTextType.h1,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primary500,
          ),
          kHeightGap(20),
        ],
      ),
    );
  }
}

class _InsideItemCard extends StatelessWidget {
  const _InsideItemCard();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              AppImages.image2png,
              width: 120,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          TextWidget(
            text: "Finger Ring",
            type: AppTextType.small,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
          TextWidget(
            text: "Ladies ring",
            type: AppTextType.tiny,
            color: AppColors.neutral400,
          ),
        ],
      ),
    );
  }
}
