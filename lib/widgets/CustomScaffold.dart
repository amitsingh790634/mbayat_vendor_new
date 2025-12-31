import 'package:easy_localization/easy_localization.dart';
import 'package:mbayat_user_app/widgets/CustomDrawer.dart';

import '../Utils/AllExport.dart';

class CustomScaffold extends StatelessWidget {
  final String? title;
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
  final Color? iconColor;
  final bool? isShowDrawer;
  final Color? appBarBgColor;
  // NEW FIELD

  const CustomScaffold({
    super.key,
    this.title,
    required this.body,
    this.showBackButton = false,
    this.leadingIcon,
    this.bottomNavigationBar,
    this.actions,
    this.backgroundColor,
    this.appBarHeight = 60,
    this.isCenterTitle = false,
    this.backButtonColor,
    this.titleColor,
    this.onLeadingTap,
    this.iconColor,
    this.isShowDrawer = false,
    this.appBarBgColor,
    // NEW FIELD
  });

  @override
  Widget build(BuildContext context) {
    final bool _showAppBar =
        appBarHeight > 0 &&
        (showBackButton ||
            title != null ||
            actions != null ||
            leadingIcon != null);

    return Scaffold(
      backgroundColor: backgroundColor ?? AppColors.white,
      bottomNavigationBar: bottomNavigationBar,
      appBar: _showAppBar
          ? PreferredSize(
              preferredSize: Size.fromHeight(appBarHeight.h),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: backgroundColor ?? AppColors.primary500,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                    ),
                  ),
                  child: AppBar(
                    backgroundColor: appBarBgColor ?? Colors.transparent,
                    elevation: 0,
                    surfaceTintColor: Colors.transparent,
                    systemOverlayStyle: SystemUiOverlayStyle.light,
                    centerTitle: isCenterTitle,

                    leading: showBackButton
                        ? GestureDetector(
                            onTap:
                                onLeadingTap ?? () => NavigationService.pop(),
                            child: leadingIcon ?? _defaultBackButton(),
                          )
                        : null,

                    title: title != null
                        ? TextWidget(
                            text: title!.tr(),
                            type: AppTextType.h1,
                            fontWeight: FontWeight.w400,
                            color: titleColor ?? AppColors.white,
                          )
                        : null,

                    actions: actions,
                  ),
                ),
              ),
            )
          : null,
      drawer: isShowDrawer == true ? CustomAppDrawer() : null,
      body: body,
    );
  }

  // DEFAULT BACK BUTTON
  Widget _defaultBackButton() {
    return Padding(
      padding: EdgeInsets.only(left: 8.h),
      child: Container(
        decoration: BoxDecoration(
          color: backButtonColor ?? Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_back,
          color: iconColor ?? AppColors.white,
          size: 24.sp,
        ),
      ),
    );
  }
}
