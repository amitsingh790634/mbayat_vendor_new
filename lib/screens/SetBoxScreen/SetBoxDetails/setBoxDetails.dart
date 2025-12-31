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
            Image.asset(
              AppImages.image2png,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
