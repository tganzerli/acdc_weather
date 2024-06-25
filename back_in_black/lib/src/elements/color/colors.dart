import 'package:flutter/material.dart';

class BackColors extends ThemeExtension<BackColors> {
  final Color darkBG;

  const BackColors({
    this.darkBG = const Color(0xff171826),
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
    );
  }

  @override
  BackColors copyWith({
    Color? darkBG,
  }) {
    return BackColors(
      darkBG: darkBG ?? this.darkBG,
    );
  }
}
