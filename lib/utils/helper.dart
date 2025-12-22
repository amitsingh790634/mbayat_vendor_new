import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:mbayat_user_app/Utils/AllExport.dart';

DateTime? currentBackPressTime;

// ---------------- KEYBOARD ----------------
Future<void> closeKeyBoard({required BuildContext context}) async {
  FocusScope.of(context).unfocus();
}

// ---------------- SPACING ----------------
SizedBox kWidthGap(double width) => SizedBox(width: width.w);
SizedBox kHeightGap(double height) => SizedBox(height: height.h);

// ---------------- DEVICE ----------------
double deviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double deviceWidth(BuildContext context) => MediaQuery.of(context).size.width;

// ---------------- LOADER ----------------
void hideLoader(BuildContext context) => Navigator.of(context).pop();

void showLoaderDialog({required BuildContext context}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (_) => Stack(
      children: [
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Container(color: AppColors.neutral900.withOpacity(0.3)),
          ),
        ),
        Center(
          child: Platform.isIOS
              ? CupertinoActivityIndicator(radius: 22.r, color: AppColors.white)
              : CircularProgressIndicator(
                  strokeWidth: 3.w,
                  color: AppColors.primary500,
                ),
        ),
      ],
    ),
  );
}

// ---------------- RICH TEXT ----------------
Widget richText({
  required BuildContext context,
  required String firstText,
  required String secondText,
  String? third,
  TextAlign? textAlign,
  TextStyle? firstStyle,
  TextStyle? secondStyle,
  TextStyle? thirdStyle,
  double? firstWidth,
  double? secondWidth,
  Function()? onTap,
}) {
  return Text.rich(
    TextSpan(
      style: firstStyle,
      children: [
        TextSpan(text: firstText.tr()),
        WidgetSpan(child: SizedBox(width: firstWidth ?? 4.w)),
        TextSpan(
          text: secondText.tr(),
          style: secondStyle,
          recognizer: TapGestureRecognizer()..onTap = onTap,
        ),
        if (third != null) ...[
          WidgetSpan(child: SizedBox(width: secondWidth ?? 4.w)),
          TextSpan(text: third.tr(), style: thirdStyle),
        ],
      ],
    ),
    textAlign: textAlign ?? TextAlign.center,
  );
}

// ---------------- SNACKBAR ----------------
void showSnackBar({
  required BuildContext context,
  required String message,
  bool isSuccess = true,
}) {
  showTopSnackBar(
    Overlay.of(context),
    Material(
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: isSuccess ? AppColors.success500 : AppColors.danger500,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(
              isSuccess ? Icons.check_circle : Icons.error_outline,
              color: AppColors.white,
              size: 22.sp,
            ),
            kWidthGap(10.w),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 15.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    ),
    displayDuration: const Duration(seconds: 2),
  );
}

// ---------------- BACK EXIT ----------------
Future<bool> onWillPop(BuildContext context) async {
  DateTime now = DateTime.now();

  if (currentBackPressTime == null ||
      now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
    currentBackPressTime = now;
    showSnackBar(
      context: context,
      message: "Please press back again",
      isSuccess: false,
    );
    return false;
  }
  return true;
}

// ---------------- DATE / TIME ----------------
String formatDate(String isoDate) {
  try {
    return DateFormat("dd MMMM yyyy").format(DateTime.parse(isoDate));
  } catch (_) {
    return "-";
  }
}

String formatTime(String dateString) {
  try {
    return DateFormat('hh:mm a').format(DateTime.parse(dateString));
  } catch (_) {
    return '-';
  }
}

String formatTime1(String dateString) {
  try {
    return DateFormat('hh:mm a').format(
      DateTime.parse(dateString).add(const Duration(hours: 5, minutes: 30)),
    );
  } catch (_) {
    return '-';
  }
}

// ---------------- STORAGE ----------------
Future<void> removeUserInfo() async {
  sharedPrefs?.clear();
}

// ---------------- LOGS ----------------
void logDebug(String message) {
  if (kDebugMode) log(message);
}

void logError(String title, dynamic data) {
  logDebug("❌ ERROR: $title");
  logDebug("🛑 Details: ${data.toString()}");
}

// ---------------- COLOR PARSER ----------------
Color parseRgbColor(String rgbString) {
  final regex = RegExp(r'rgb\((\d+),\s*(\d+),\s*(\d+)\)');
  final match = regex.firstMatch(rgbString);

  if (match != null) {
    return Color.fromARGB(
      255,
      int.parse(match.group(1)!),
      int.parse(match.group(2)!),
      int.parse(match.group(3)!),
    );
  }
  return AppColors.neutral300;
}

// ---------------- URL ----------------
Future<void> openExternalUrl({
  required BuildContext context,
  required String url,
}) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    showSnackBar(
      context: context,
      message: "Unable to open link",
      isSuccess: false,
    );
  }
}

// ---------------- MAP ----------------
Future<void> openMap({
  required double latitude,
  required double longitude,
}) async {
  final url = Platform.isIOS
      ? Uri.parse("http://maps.apple.com/?q=$latitude,$longitude")
      : Uri.parse(
          "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
        );

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw "Could not open map";
  }
}

// ---------------- CONTEXT EXT ----------------
extension ContextExtensions on BuildContext {
  Size get mediaSize => MediaQuery.of(this).size;
}
