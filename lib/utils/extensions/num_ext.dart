extension NumExt on num {
  bool get isZero => this == 0;
  bool get isPositive => this > 0;
  bool get isNegative => this < 0;

  num clampMin(num min) => this < min ? min : this;
  num clampMax(num max) => this > max ? max : this;

  String get percent => '$this%';
  String get rupee => '₹$this';
}
