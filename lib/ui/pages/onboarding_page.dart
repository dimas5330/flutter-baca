import 'package:baca_app/shared/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;
  List<String> titles = [
    'Halo!',
    'Ayo Mulai!',
  ];
  List<String> subtitles = [
    'Alami Perjumpaan dengan Tuhan,\nBACA adalah ruang untuk mu\ndan Tuhan berbincang',
    'Mari Berelasi dengan-Nya',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBackgroundColor,
      body: Center(
        child: Column(
          children: [
            CarouselSlider(
              items: [
                Column(
                  children: [
                    Container(
                      width: 78,
                      height: 175,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/img_bintang_bold.png',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    const Stack(
                      alignment: Alignment(0, 0.4),
                      children: [
                        Image(
                          height: 192,
                          width: 192,
                          image: AssetImage(
                            'assets/img_onboarding1.png',
                          ),
                        ),
                        Image(
                          width: 24,
                          height: 38,
                          image: AssetImage(
                            'assets/img_small_salib.png',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Stack(
                  children: [
                    Positioned.fill(
                      top: 200,
                      child: Image(
                        image: AssetImage(
                          'assets/img_salib.png',
                        ),
                      ),
                    ),
                    Positioned(
                      top: 200,
                      right: 145,
                      child: Image(
                        width: 31,
                        height: 36,
                        image: AssetImage(
                          'assets/img_spark3.png',
                        ),
                      ),
                    ),
                    Positioned(
                      top: 380,
                      left: 140,
                      child: Image(
                        width: 31,
                        height: 36,
                        image: AssetImage(
                          'assets/img_spark4.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              options: CarouselOptions(
                height: 417,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      currentIndex = index;
                    },
                  );
                },
              ),
            ),
            const SizedBox(
              height: 49,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    titles[currentIndex],
                    style: opensansGreyTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Text(
                    subtitles[currentIndex],
                    style: robotoSoftGreyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: regular,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  currentIndex == 1
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 45,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                    right: 4,
                                  ),
                                  width: currentIndex == 0 ? 12 : 4,
                                  height: currentIndex == 0 ? 12 : 4,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentIndex == 0
                                        ? greyColor
                                        : softGreyColor,
                                  ),
                                ),
                                Container(
                                  width: currentIndex == 1 ? 12 : 4,
                                  height: currentIndex == 1 ? 12 : 4,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentIndex == 1
                                        ? greyColor
                                        : softGreyColor,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/sign-in');
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: greyColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'Masuk',
                                  style: opensansSoftWhitTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 56,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, '/sign-up');
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor: lightGreyColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'Daftar',
                                  style: opensansGreyTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                right: 4,
                              ),
                              width: currentIndex == 0 ? 12 : 4,
                              height: currentIndex == 0 ? 12 : 4,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == 0
                                    ? greyColor
                                    : softGreyColor,
                              ),
                            ),
                            Container(
                              width: currentIndex == 1 ? 12 : 4,
                              height: currentIndex == 1 ? 12 : 4,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentIndex == 1
                                    ? greyColor
                                    : softGreyColor,
                              ),
                            )
                          ],
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
