import 'package:flutter/material.dart';

import 'icons_constant.dart';

class BackIcons extends StatelessWidget {
  final String asset;
  final double? height;
  final double? width;

  const BackIcons.weatherClear({
    super.key,
    this.height,
    this.width,
  }) : asset = BackIconsConstant.weatherClear;

  const BackIcons.weatherClouds({
    super.key,
    this.height,
    this.width,
  }) : asset = BackIconsConstant.weatherClouds;

  const BackIcons.weatherDrizzle({
    super.key,
    this.height,
    this.width,
  }) : asset = BackIconsConstant.weatherDrizzle;

  const BackIcons.weatherMist({
    super.key,
    this.height,
    this.width,
  }) : asset = BackIconsConstant.weatherMist;

  const BackIcons.weatherRein({
    super.key,
    this.height,
    this.width,
  }) : asset = BackIconsConstant.weatherRein;

  const BackIcons.weatherSnow({
    super.key,
    this.height,
    this.width,
  }) : asset = BackIconsConstant.weatherSnow;

  const BackIcons.weatherThunderstorm({
    super.key,
    this.height,
    this.width,
  }) : asset = BackIconsConstant.weatherThunderstorm;

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
