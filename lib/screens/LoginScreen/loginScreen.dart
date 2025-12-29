import 'package:mbayat_user_app/utils/allExport.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.primary900,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            TextWidget(text:  "Welcome Vendor",type: AppTextType.body,),
            const Text(
              "Welcome Vendor",
              style: TextStyle(
                color: AppColors.white,
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              child: Center(
                child: SvgPicture.asset(
                  AppImages.loginImageUrl,
                  height: MediaQuery.sizeOf(context).height * 0.2,
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              // height: MediaQuery.sizeOf(context).height * 0.5,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      "Login",
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      controller: provider.emailController,
                      hint: "admin@email.com",
                      icon: Icons.email_outlined,
                    ),
                    const SizedBox(height: 20),
                    _buildTextField(
                      controller: provider.passwordController,
                      hint: "***",
                      icon: Icons.lock_outline,
                      isPassword: true,
                    ),
                    // const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Forgot Password",
                          style: TextStyle(color: AppColors.primary900),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 10), // Add your login form here
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: provider.isLoading
                            ? null
                            : () => provider.login(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3B103F),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: provider.isLoading
                            ? const CircularProgressIndicator(
                                color: AppColors.white,
                              )
                            : const Text(
                                "Enter",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: AppColors.white,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    const Row(
                      children: [
                        Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "or",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Expanded(child: Divider()),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Center(
                      child: SvgPicture.asset(
                        AppImages.logo,
                        height: MediaQuery.sizeOf(context).height * 0.1,
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,

      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textFieldColor),
        prefixIcon: Icon(icon, color: AppColors.primary900),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.neutral100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: AppColors.primary900),
        ),
      ),
    );
  }
}
