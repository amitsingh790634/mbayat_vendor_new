import 'package:mbayat_user_app/utils/allExport.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedIndex = 0;

  final List<Widget> screens = const [
    Center(child: Text("Home")),
    Center(child: Text("Order")),
    Center(child: Text("Product")),
    Center(child: Text("Setting")),
  ];

  final List<String> titles = ["Home", "Order", "Product", "Setting"];

  final List<String> icons = [
    AppImages.kHome,
    AppImages.kOrder,
    AppImages.kProduct,
    AppImages.kSetting,
  ];

  void onItemTapped(int index) {
    if (selectedIndex != index) {
      setState(() => selectedIndex = index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarHeight: 0,
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: screens[selectedIndex],
        ),
      ),

      /// ✅ ATTACHED BOTTOM BAR (NOT FLOATING)
      bottomNavigationBar: SafeArea(
        bottom: false,
        child: Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.12),
                blurRadius: 20,
                offset: const Offset(0, -6),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              icons.length,
              (index) => _buildNavItem(
                icon: icons[index],
                title: titles[index],
                index: index,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String icon,
    required String title,
    required int index,
  }) {
    final bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () => onItemTapped(index),
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeInOut,
        height: 42,
        padding: EdgeInsets.symmetric(horizontal: isSelected ? 18 : 0),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary500 : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPic(
              image: icon,
              color: isSelected ? AppColors.white : AppColors.kGrey,
            ),
            if (isSelected) ...[
              const SizedBox(width: 8),
              TextWidget(
                text: title,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
