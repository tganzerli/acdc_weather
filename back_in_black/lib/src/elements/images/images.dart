import 'package:flutter/material.dart';

import 'images_constant.dart';

class BackImages extends StatelessWidget {
  final String asset;
  final double? height;
  final double? width;

  const BackImages.wind({
    super.key,
    this.height,
    this.width,
  }) : asset = BackImagesConstant.wind;

  const BackImages.arrow({
    super.key,
    this.height,
    this.width,
  }) : asset = BackImagesConstant.arrow;

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
