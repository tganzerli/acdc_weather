import 'package:back_in_black/back_in_black.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    final colors = BackColors.of(context);
    return Scaffold(
      backgroundColor: colors.darkBG,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: colors.darkBG,
        elevation: 0,
      ),
      body: Center(
        child: BackLogos.logoBG(
          width: 300,
        ),
      ),
    );
  }
}
