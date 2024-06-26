import 'package:back_in_black/back_in_black.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.popAndPushNamed(context, '/home');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    final colors = BackColors.of(context);
    return Scaffold(
      backgroundColor: colors.darkBG,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: colors.darkBG,
        elevation: 0,
      ),
      body: const Center(
        child: BackLogos.logoBG(
          width: 300,
        ),
      ),
    );
  }
}
