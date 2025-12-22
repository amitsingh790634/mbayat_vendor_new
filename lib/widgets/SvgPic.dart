import '../Utils/AllExport.dart';

class SvgPic extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double? width;

  final double? height;
  final Color? color;

  const SvgPic({
    super.key,
    required this.image,
    this.fit = BoxFit.none,
    this.width,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      fit: fit,
      color: color,
      height: height,
      width: width,
      image,
    );
  }
}
