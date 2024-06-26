import 'package:back_in_black/back_in_black.dart';
import 'package:flutter/material.dart';

class WeatherDetailPage extends StatefulWidget {
  const WeatherDetailPage({super.key});

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    final colors = BackColors.of(context);
    return Scaffold(
      backgroundColor: colors.darkBG,
      appBar: AppBar(
        backgroundColor: colors.darkBG,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: colors.primary,
          ),
        ),
        title: Text(
          'Silverstone',
          style: text.displayMedium,
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(
                  '9˚',
                  style: text.displayLarge,
                ),
                Text(
                  'clear sky',
                  style: text.headlineLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'H: 13˚',
                      style: text.headlineSmall,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'L: 3˚',
                      style: text.headlineSmall,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 170,
                  child: ListView.separated(
                    itemCount: 9,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 12);
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        width: 80,
                        height: 160,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: colors.primary),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '14',
                              style: text.headlineSmall!
                                  .copyWith(fontWeight: FontWeight.w800),
                            ),
                            Text(
                              '14/06',
                              style: text.bodyMedium,
                            ),
                            const BackIcons.weatherClear(
                              width: 60,
                            ),
                            Text(
                              '24˚',
                              style: text.headlineSmall!
                                  .copyWith(fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 22,
                        height: MediaQuery.of(context).size.width / 2 - 22,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          border: Border.all(color: colors.primary),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            BackImages.wind(
                              width: MediaQuery.of(context).size.width / 2 - 40,
                            ),
                            RotationTransition(
                              turns: const AlwaysStoppedAnimation(98 / 360),
                              child: BackImages.arrow(
                                height:
                                    MediaQuery.of(context).size.width / 2 - 40,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '13',
                                  style: text.headlineMedium!
                                      .copyWith(fontWeight: FontWeight.w800),
                                ),
                                Text(
                                  'm/s',
                                  style: text.bodyLarge,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 22,
                        height: MediaQuery.of(context).size.width / 2 - 22,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border.all(color: colors.primary),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.wb_twilight,
                                  color: colors.primary,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'SUNRISE',
                                  style: text.titleMedium!
                                      .copyWith(fontWeight: FontWeight.w300),
                                ),
                              ],
                            ),
                            Text(
                              '5:43',
                              style: text.displayMedium,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Sunset:',
                                  style: text.titleMedium,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  '17:21',
                                  style: text.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
