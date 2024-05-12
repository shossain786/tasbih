import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class KalmaShariff extends StatelessWidget {
  const KalmaShariff({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 380,
              child: CarouselSlider(
                items: [
                  GestureDetector(
                    onTap: () {
                      debugPrint('Tapped on first card');
                      Navigator.pushNamed(context, '/pahlakalma');
                    },
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(10, 10),
                            color: Colors.grey.withOpacity(0.6),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'PAHLA KALMA TAIYYABAH | كَلِمَةُ اَلطَّيِّبَة',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            Text(
                              'لَآ اِلٰهَ اِلَّا اللّٰهُ مُحَمَّدٌ رَّسُوْلُ اللّٰهِ',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Divider(
                              color: Colors.black,
                            ),
                            Text(
                              'اللہ کے سوا کوئی معبود نہیں اور حضرت محمد(ﷺ) اللہ کے رسول ہیں\n\n Allah(عزوجل) ke siwa koi ma\'bud nahi aur hazrat Muhammad(ﷺ) Allah(عزوجل) ke rasul hai.',
                              style: TextStyle(
                                fontSize: 18,
                                wordSpacing: 2,
                                letterSpacing: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(10, 10),
                          color: Colors.grey.withOpacity(0.6),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'DOOSRA KALMA SHAHADAT | كَلِمَاتْ اَلشَّهَادَة',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black.withOpacity(0.9),
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'أَشْهَدُ أَنْ لَّآ إِلٰهَ إِلَّا اللّٰهُ وَحْدَهُ لَا شَرِيكَ لَهٗ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهٗ وَرَسُولُهٗ',
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Divider(
                            color: Colors.black,
                          ),
                          const Text(
                            'Mai Gawahi deta hun ke Allah(عزوجل) siwa koi ebadat ke laiq nahi. Woh eik(single) hai aur uska koi sharik nahi. Aur mai gawahi deta hun ke Muhammad(ﷺ) Allah(عزوجل) ke bande aur uske rasul hai.',
                            style: TextStyle(
                              color: Colors.black,
                              wordSpacing: 2,
                              letterSpacing: 1.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 250,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal.shade800,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(10, 10),
                          color: Colors.grey.withOpacity(0.6),
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'TISRA KALMA TAMJID | كَلِمَاتْ اَلتَّمْجِيدْ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.yellow,
                            ),
                          ),
                          Text(
                            'سُبْحَانَ اللّٰهِ وَالْحَمْدُلِلّٰهِ وَلَآ إِلٰهَ إِلَّا اللّٰهُ وَاللّٰهُ أكْبَرُ وَلَا حَوْلَ وَلاَ قُوَّةَ إِلَّا بِاللّٰهِ الْعَلِيِّ الْعَظِيْمِ',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Divider(
                            color: Colors.black,
                          ),
                          Text(
                            'Allah(عزوجل) har aib se paak hai. Allah(عزوجل) hi ke lie saari khubia hai. Allah(عزوجل) ke siwa koi ebadat ke laiq nahi. Aur Allah(عزوجل) sab se bada hai aur Allah(عزوجل) buzurg wo bartarhi taqat wo quwwat dene wala hai.',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 280,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(10, 10),
                          color: Colors.grey.withOpacity(0.6),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'CHAUTHA KALMA TAUHEED | كَلِمَاتْ اَلتَّوْحِيدْ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white.withOpacity(0.9),
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white.withOpacity(0.9),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Text(
                            'لَآ اِلٰهَ اِلَّا اللّٰهُ وَحْدَهٗ لَا شَرِيْكَ لَهٗ لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ يُحْىٖ وَيُمِيْتُ ؕ وَهُوَ حَئٌّ لَّا يَمُوْتُ اَبَدًا اَبَدًا ؕ ذُوالْجَلَالِ وَالْاِكْرَامِ ؕ بِيَدِهِ الْخَيْرُ ؕ وَهُوَ عَلٰى كُلِّ شَىْءٍ قَدِیْرٌ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                              color: Colors.amberAccent,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Divider(
                            color: Colors.white,
                          ),
                          const Text(
                            'Allah(عزوجل) ke siwa koi ebadat ke laiq nahi, woh akela hai, uska koi sharik nahi, usiki badshahat hai, usi ke lie sari khubian hai, wohi zindagi aur maut deta hai. Woh zindah hai kabhibhi nahi marega. Wo azmat aur buzurgi wala hai. Usi ke haath me har tarah ki bhalai hai, aur woh har cheez par qadir hai.',
                            style: TextStyle(
                              color: Colors.amberAccent,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Container(
                  //   height: 250,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: Colors.green,
                  //     boxShadow: [
                  //       BoxShadow(
                  //         offset: const Offset(10, 10),
                  //         color: Colors.grey.withOpacity(0.6),
                  //       ),
                  //     ],
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Column(
                  //       children: [
                  //         Text(
                  //           'Doosra Kalma Shahadat | كَلِمَاتْ اَلشَّهَادَة',
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.yellow.withOpacity(0.9),
                  //           ),
                  //         ),
                  //         const Text(
                  //           'أَشْهَدُ أَنْ لَّآ إِلٰهَ إِلَّا اللّٰهُ وَحْدَهُ لَا شَرِيكَ لَهٗ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهٗ وَرَسُولُهٗ',
                  //           style: TextStyle(
                  //             fontSize: 30,
                  //             fontWeight: FontWeight.w500,
                  //             color: Colors.white,
                  //           ),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         const Divider(
                  //           color: Colors.black,
                  //         ),
                  //         const Text(
                  //             'میں گواہی دیتا ہوں کہ اللہ کے سوا کوئی معبود نہیں، وہ اکیلا ہے، اس کا کوئی شریک نہیں اور میں گواہی دیتا ہوں کہ محمد (ﷺ) اللہ کے بندے اور رسول ہیں۔'),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   height: 250,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(10),
                  //     color: Colors.purple,
                  //     boxShadow: [
                  //       BoxShadow(
                  //         offset: const Offset(10, 10),
                  //         color: Colors.grey.withOpacity(0.6),
                  //       ),
                  //     ],
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Column(
                  //       children: [
                  //         Text(
                  //           'Doosra Kalma Shahadat | كَلِمَاتْ اَلشَّهَادَة',
                  //           style: TextStyle(
                  //             fontWeight: FontWeight.bold,
                  //             color: Colors.yellow.withOpacity(0.9),
                  //           ),
                  //         ),
                  //         const Text(
                  //           'أَشْهَدُ أَنْ لَّآ إِلٰهَ إِلَّا اللّٰهُ وَحْدَهُ لَا شَرِيكَ لَهٗ وَأَشْهَدُ أَنَّ مُحَمَّدًا عَبْدُهٗ وَرَسُولُهٗ',
                  //           style: TextStyle(
                  //             fontSize: 30,
                  //             fontWeight: FontWeight.w500,
                  //             color: Colors.white,
                  //           ),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //         const Divider(
                  //           color: Colors.black,
                  //         ),
                  //         const Text(
                  //             'میں گواہی دیتا ہوں کہ اللہ کے سوا کوئی معبود نہیں، وہ اکیلا ہے، اس کا کوئی شریک نہیں اور میں گواہی دیتا ہوں کہ محمد (ﷺ) اللہ کے بندے اور رسول ہیں۔'),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
                options: CarouselOptions(
                  height: 320.0,
                  disableCenter: true,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  viewportFraction: 0.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
