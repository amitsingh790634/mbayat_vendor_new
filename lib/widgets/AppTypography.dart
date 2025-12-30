import '../Utils/AllExport.dart';

class AppTypography {
  // Font families
  static const String cabinet = 'CabinetGrotesk';
  static const String host = 'HostGrotesk';
  static const String h1Font = 'Plus Jakarta Sans';
  static const String h2Font = 'Source Sans Pro';
  static const String restFont = 'Inter';


  // Font sizes
  static double h1 = 32.sp;
  static double h2 = 28.sp;
  static double h3 = 24.sp;
  static double title = 20.sp;
  static double subtitle = 18.sp;
  static double body = 16.sp;
  static double small = 14.sp;
  static double tiny = 12.sp;
  static double button = 15.sp;

  // ---------- CABINET GROTESK ----------
  static TextStyle h1Style({Color? color}) => TextStyle(
    fontFamily: h1Font,
    fontSize: h1,
    fontWeight: FontWeight.w700,
    color: color ?? Colors.black,
  );

  static TextStyle h2Style({Color? color}) => TextStyle(
    fontFamily: h2Font,
    fontSize: h2,
    fontWeight: FontWeight.w600,
    color: color ?? Colors.black,
  );

  static TextStyle h3Style({Color? color}) => TextStyle(
    fontFamily: restFont,
    fontSize: h3,
    fontWeight: FontWeight.w600,
    color: color ?? Colors.black,
  );

  static TextStyle titleStyle({Color? color}) => TextStyle(
    fontFamily: restFont,
    fontSize: title,
    fontWeight: FontWeight.w600,
    color: color ?? Colors.black,
  );

  static TextStyle buttonStyle({Color? color}) => TextStyle(
    fontFamily: restFont,
    fontSize: button,
    fontWeight: FontWeight.w600,
    color: color ?? Colors.white,
  );

  // ---------- HOST GROTESK ----------
  static TextStyle subtitleStyle({Color? color}) => TextStyle(
    fontFamily: restFont,
    fontSize: subtitle,
    fontWeight: FontWeight.w500,
    color: color ?? Colors.black54,
  );

  static TextStyle bodyStyle({Color? color}) => TextStyle(
    fontFamily: restFont,
    fontSize: body,
    fontWeight: FontWeight.w400,
    color: color ?? Colors.black,
  );

  static TextStyle smallStyle({Color? color}) => TextStyle(
    fontFamily: restFont,
    fontSize: small,
    fontWeight: FontWeight.w400,
    color: color ?? Colors.black54,
  );

  static TextStyle tinyStyle({Color? color}) => TextStyle(
    fontFamily: restFont,
    fontSize: tiny,
    fontWeight: FontWeight.w400,
    color: color ?? Colors.black45,
  );

  static TextStyle errorStyle({Color? color}) => TextStyle(
    fontFamily: host,
    fontSize: body,
    fontWeight: FontWeight.w400,
    color: color ?? Colors.red,
  );

  static TextStyle linkStyle({Color? color}) => TextStyle(
    fontFamily: host,
    fontSize: body,
    fontWeight: FontWeight.w500,
    color: color ?? Colors.blue,
    decoration: TextDecoration.underline,
  );
}
