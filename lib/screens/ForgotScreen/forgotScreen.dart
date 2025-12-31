import 'package:mbayat_user_app/utils/allExport.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return CustomScaffold(
      backgroundColor: AppColors.primary500,
      title: "no_worries",
      showBackButton: true,
      isCenterTitle: true,
      titleColor: AppColors.white,
      body: Column(
        children: [
          kHeightGap(20),
          SvgPic(image: AppImages.loginImageUrl, fit: BoxFit.contain),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: CustomPadding(
                horizontal: true,
                size: PaddingSize.sm,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHeightGap(30.sp),
                    GestureDetector(
                      onTap: () {
                        // NavigationService.push( const RegisterScreen());
                      },
                      child: TextWidget(
                        text: "forgot_password",
                        type: AppTextType.h1,
                        fontSize: 22.sp,
                      ),
                    ),
                    kHeightGap(10),
                    CustomTextFormField(
                      prefixIconWidget: Icon(
                        Icons.email_outlined,
                        color: AppColors.primary500,
                        size: 24.sp,
                      ),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Email",
                      enabled: true,
                    ),
                    Padding(
                      padding: .symmetric(horizontal: 10, vertical: 16),
                      child: Row(
                        children: [
                          const TextWidget(
                            text: "remember_password",
                            type: AppTextType.small,
                            fontWeight: FontWeight.w600,
                            color: AppColors.navyBlueColor,
                          ),
                          kWidthGap(4),
                          const TextWidget(
                            text: "login",
                            type: AppTextType.body,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                    AppButton(
                      text: "send_code",
                      type: AppButtonType.primary,
                      onTap: () {
                        NavigationService.push(
                          OTPScreen(email: emailController.text),
                        );
                      },
                    ),
                    // const SizedBox(height: 10), // Add your login form here
                    kHeightGap(30),

                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextWidget(text: "or", type: AppTextType.body),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    kHeightGap(30),
                    Center(
                      child: SvgPicture.asset(
                        AppImages.logo,
                        height: MediaQuery.sizeOf(context).height * 0.1,
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
          ),
        ],
      ),
    );
  }
}
