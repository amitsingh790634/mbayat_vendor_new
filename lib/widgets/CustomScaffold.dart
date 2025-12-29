

import 'package:easy_localization/easy_localization.dart';

import '../Utils/AllExport.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget? bottomNavigationBar;
  final bool showBackButton;
  final Widget? leadingIcon;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final double appBarHeight;
  final bool isCenterTitle;
  final Color? backButtonColor;
  final Color? titleColor;
  final VoidCallback? onLeadingTap;

  const CustomScaffold({
    super.key,
    required this.title,
    required this.body,
    this.showBackButton = true,
    this.leadingIcon,
    this.bottomNavigationBar,
    this.actions,
    this.backgroundColor,
    this.appBarHeight = 60,
    this.isCenterTitle = false,
    this.backButtonColor,
    this.titleColor,
    this.onLeadingTap, // NEW FIELD
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.primary900,
      bottomNavigationBar: bottomNavigationBar,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight.h),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: backgroundColor ?? AppColors.primary900,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: SystemUiOverlayStyle.light,
              centerTitle: isCenterTitle,
              leading:
                  showBackButton
                      ? GestureDetector(
                        // onTap: onLeadingTap ?? () => Get.back(), // Tap handler
                        child: leadingIcon ?? _defaultBackButton(),
                      )
                      : null,
              title: Text(
                title.tr(),
                style: AppTypography.titleStyle(
                  color: titleColor ?? AppColors.white,
                ),
      
              ),
              actions: actions,
            ),
          ),
        ),
      ),
      body: body,
    );
  }

  // DEFAULT BACK BUTTON
  Widget _defaultBackButton() {
    return Padding(
      padding: EdgeInsets.only(left: 8.h),
      child: Container(
        decoration: BoxDecoration(
          color: backButtonColor ?? AppColors.accent1_100,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.arrow_back, color: AppColors.white, size: 24.sp),
      ),
    );
  }
}