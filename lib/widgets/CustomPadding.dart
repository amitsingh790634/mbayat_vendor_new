import '../Utils/AllExport.dart';

enum PaddingSize {
  xs,
  sm,
  md,
  lg,
  xl,
}

class CustomPadding extends StatelessWidget {
  final Widget child;

  /// Manual padding (highest priority)
  final EdgeInsetsGeometry? padding;

  /// Responsive preset padding using enum
  final PaddingSize? size;

  /// Shortcuts
  final bool all;
  final bool horizontal;
  final bool vertical;

  /// Optional scaling multiplier
  final double scale;

  /// Optional background styling
  final Color? backgroundColor;
  final double borderRadius;

  const CustomPadding({
    super.key,
    required this.child,
    this.padding,
    this.size,
    this.all = false,
    this.horizontal = false,
    this.vertical = false,
    this.scale = 1.0,
    this.backgroundColor,
    this.borderRadius = 0,
  });

  /// Convert enum → responsive padding value
  double _getBasePadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    switch (size) {
      case PaddingSize.xs:
        return width * 0.02; // very small
      case PaddingSize.sm:
        return width * 0.03; // small
      case PaddingSize.md:
        return width * 0.05; // medium
      case PaddingSize.lg:
        return width * 0.07; // large
      case PaddingSize.xl:
        return width * 0.10; // extra large
      default:
        return 15; // ⭐ default padding = 15
    }
  }

  @override
  Widget build(BuildContext context) {
    final base = _getBasePadding(context) * scale;

    final resolvedPadding = padding ??
        (all
            ? EdgeInsets.all(base)
            : horizontal
                ? EdgeInsets.symmetric(horizontal: base)
                : vertical
                    ? EdgeInsets.symmetric(vertical: base)
                    : EdgeInsets.all(base)); // default all sides

    return Container(
      padding: resolvedPadding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
