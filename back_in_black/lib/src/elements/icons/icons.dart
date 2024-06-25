import 'package:flutter/material.dart';

class BackIcons extends StatelessWidget {
  final String asset;
  final double? height;
  final double? width;

  const BackIcons.logo({
    super.key,
    this.height,
    this.width,
  }) : asset = '';

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
