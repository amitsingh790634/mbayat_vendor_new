import '../../Utils/AllExport.dart';

extension WidgetExt on Widget {
  Widget padAll(double v) => Padding(padding: EdgeInsets.all(v), child: this);

  Widget padSymmetric({double h = 0, double v = 0}) => Padding(
    padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
    child: this,
  );

  Widget center() => Center(child: this);

  Widget visible(bool value) => value ? this : const SizedBox.shrink();

  Widget onTap(VoidCallback onTap) =>
      GestureDetector(onTap: onTap, child: this);
}
