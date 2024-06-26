import 'package:back_in_black/back_in_black.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final colors = BackColors.of(context);
    return Scaffold(
      backgroundColor: colors.darkBG,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: colors.darkBG,
        elevation: 0,
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.maxFinite,
                  height: 50,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(color: colors.primary),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: colors.primary,
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: LineTextField(
                            status: TextFieldStatus.enabled,
                            hintText: 'Tour city'),
                      )
                    ],
                  ),
                ),
              ),
              const BackLogos.logoText(
                height: 180,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Schedule',
                    style: text.headlineMedium,
                  ),
                ),
              ),
              Flexible(child: LayoutBuilder(
                builder: (context, constraints) {
                  return SizedBox(
                    width: constraints.maxWidth,
                    height: constraints.maxHeight,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                        child: Column(
                          children: List.generate(3, (index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, '/weatherDetai'),
                                child: Container(
                                  color: Colors.transparent,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '23/04',
                                                style: text.titleMedium,
                                              ),
                                              Text(
                                                'Silverstone',
                                                style: text.titleLarge,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              BackIcons.weatherClear(
                                                height: 30,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                '9˚',
                                                style: text.titleLarge,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Container(
                                        width: double.maxFinite,
                                        height: 1,
                                        color: colors.primary.withOpacity(0.3),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
