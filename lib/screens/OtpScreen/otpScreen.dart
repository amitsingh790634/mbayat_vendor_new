import '../../Utils/allExport.dart';

class OTPScreen extends StatefulWidget {
  final String email;
  const OTPScreen({super.key, required this.email});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  void initState() {
    super.initState();
    // Todo Start the timer as soon as the screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authProvider = Provider.of<OtpProvider>(context, listen: false);
      authProvider.startTimer();
    });
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final defaultPinTheme = PinTheme(
      width: screenWidth * 0.25,
      height: screenHeight * 0.08,
      textStyle: TextStyle(
        fontSize: screenWidth * 0.06,
        fontWeight: FontWeight.w500,
        color: AppColors.primary500,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary100,
        border: Border.all(color: AppColors.primary500),
        borderRadius: BorderRadius.circular(5),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: AppColors.white,
      border: Border.all(color: AppColors.primary500),
      borderRadius: BorderRadius.circular(5),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColors.white,
        border: Border.all(color: AppColors.primary500),
      ),
    );

    return Consumer<OtpProvider>(
      builder: (context, authProvider, child) {
        return Form(
          key: formKey,
          child: CustomScaffold(
            showBackButton: true,
            iconColor: AppColors.primary500,
            backgroundColor: AppColors.white,
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: CustomPadding(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    kHeightGap(deviceHeight(context) * .1),
                    const Align(
                      alignment: Alignment.center,
                      child: TextWidget(
                        text: "We have send you Code",
                        type: AppTextType.h3,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextWidget(
                      text: "Enter the Security code we have sent you on",
                      type: AppTextType.small,
                      fontWeight: FontWeight.w500,
                      color: AppColors.neutral400,
                    ),

                    TextWidget(
                      text: "${widget.email}",
                      type: AppTextType.body,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary500,
                    ),

                    // kHeightGap(deviceHeight(context) * .1),

                    Align(
                      alignment: Alignment.centerLeft,
                      child: richText(
                        firstStyle: GoogleFonts.albertSans(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          letterSpacing: 1,
                        ),
                        secondStyle: GoogleFonts.albertSans(
                          color: AppColors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 14,
                          letterSpacing: 1,
                        ),
                        context: context,
                        firstText: 'Please verify the otp sent to',
                        secondText: '${widget.email}',
                        onTap: () {},
                      ),
                    ),

                    kHeightGap(20),
                    Pinput(
                      validator: (value) =>
                          Validations.instance.otpValidation(value ?? ''),
                      closeKeyboardWhenCompleted: true,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      length: 4,
                      controller: authProvider.pinController,
                      showCursor: true,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      onCompleted: (pin) async {
                        // authProvider.sendOTP(
                        //   context: context,
                        //   phoneNumber: widget.phoneNumber,
                        // );
                      },
                      onChanged: (value) {},
                    ),

                    kHeightGap(30),

                    AppButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          logDebug(
                            "Valid name: ${authProvider.pinController.text}",
                          );
                        }
                      },
                      text: "send_code",
                    ),
                    kHeightGap(screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const TextWidget(
                          color: AppColors.white,
                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w600,
                          text: AppStrings.didReceive,
                        ),
                        kWidthGap(8.0),
                        GestureDetector(
                          onTap: () {
                            if (authProvider.start == 0 ||
                                authProvider.start == 60) {
                              authProvider.startTimer();
                            }
                          },
                          child: TextWidget(
                            color: authProvider.start == 0
                                ? AppColors.white
                                : AppColors.white,
                            textAlign: TextAlign.center,

                            fontWeight: FontWeight.w600,

                            fontSize: 15,
                            text: authProvider.start == 0
                                ? AppStrings.resendOTP
                                : "00 : ${authProvider.start}",
                          ),
                        ),
                      ],
                    ),
                    kHeightGap(30),
                    Align(alignment: Alignment.bottomCenter,
                      child: SvgPicture.asset(
                        AppImages.logo,
                        height: MediaQuery.sizeOf(context).height * 0.1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget socialLoginButton({required IconData icon, required Color iconColor}) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: AppColors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Center(child: FaIcon(color: iconColor, icon, size: 28)),
    );
  }
}
