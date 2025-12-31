import 'package:mbayat_user_app/utils/allExport.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LoginProvider>();
    final size = MediaQuery.sizeOf(context);

    return CustomScaffold(
      appBarHeight: 0,
      backgroundColor: AppColors.primary500,
      showBackButton: false,
      body: SafeArea(
        bottom: false,
        maintainBottomViewPadding: false,
        minimum: EdgeInsets.zero,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              kHeightGap(30),
              TextWidget(
                text: "welcome_vendor",
                type: AppTextType.h1,
                color: AppColors.white,
                fontWeight: FontWeight.w400,
              ),
              kHeightGap(15),
              SvgPic(image: AppImages.loginImageUrl, fit: BoxFit.contain),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                ),
                child: CustomPadding(
                  horizontal: true,
                  vertical: true,
                  size: PaddingSize.sm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kHeightGap(30),
                      TextWidget(
                        text: "login",
                        type: AppTextType.h1,
                        fontSize: 26.sp,
                        color: AppColors.navyBlueColor,
                        fontWeight: FontWeight.w700,
                      ),

                      CustomTextFormField(
                        enabled: true,
                        label: '',
                        controller: provider.emailController,
                        keyboardType: TextInputType.emailAddress,
                        hintText: "admin@email.com",
                        prefixIconWidget: Icon(
                          Icons.email_outlined,
                          color: AppColors.primary500,
                          size: 22.sp,
                        ),
                      ),
                      kHeightGap(16),
                      CustomTextFormField(
                        enabled: true,
                        label: '',
                        showLabel: false,
                        controller: provider.passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        hintText: "***",
                        isPasswordField: true,
                        prefixIconWidget: Icon(
                          Icons.lock_outline,
                          color: AppColors.primary500,
                          size: 22.sp,
                        ),
                      ),
                      kHeightGap(15),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            NavigationService.push(const ForgotScreen());
                          },
                          child: TextWidget(
                            text: "forgot_password",
                            type: AppTextType.body,
                            color: AppColors.primary500,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      kHeightGap(15),
                      AppButton(text: "enter", onTap: provider.login),
                      kHeightGap(30),
                      const Row(
                        children: [
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12),
                            child: TextWidget(
                              text: "or",
                              type: AppTextType.body,
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      kHeightGap(30),
                      Center(
                        child: SvgPicture.asset(
                          AppImages.logo,
                          height: size.height * 0.1,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).viewInsets.bottom > 0
                            ? 20
                            : MediaQuery.of(context).size.height * 0.09,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
