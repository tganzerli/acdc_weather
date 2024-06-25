import 'package:flutter/material.dart';

import 'logos_constant.dart';

class BackLogos extends StatelessWidget {
  final String asset;
  final double? height;
  final double? width;

  const BackLogos.logo({
    super.key,
    this.height,
    this.width,
  }) : asset = BackLogosConstant.logo;

  const BackLogos.logoBG({
    super.key,
    this.height,
    this.width,
  }) : asset = BackLogosConstant.logoBG;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      package: 'back_in_black',
      height: height,
      width: width,
    );
  }
}
