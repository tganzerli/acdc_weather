import 'package:flutter/material.dart';

class BackColors extends ThemeExtension<BackColors> {
  final Color darkBG;
  final Color primary;
  final Color secondary;

  const BackColors({
    this.darkBG = const Color(0xff171826),
    this.primary = const Color(0xfffafbdb),
    this.secondary = const Color(0xff258fbf),
  });

  static BackColors of(BuildContext context) {
    return Theme.of(context).extension<BackColors>()!;
  }

  @override
  ThemeExtension<BackColors> lerp(
    covariant ThemeExtension<BackColors>? other,
    double t,
  ) {
    if (other is! BackColors) {
      return this;
    }

    return BackColors(
      darkBG: Color.lerp(darkBG, other.darkBG, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
    );
  }

  @override
  BackColors copyWith({
    Color? darkBG,
    Color? primary,
    Color? secondary,
  }) {
    return BackColors(
      darkBG: darkBG ?? this.darkBG,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
    );
  }
}
