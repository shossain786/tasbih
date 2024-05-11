import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tasbih/appdrawer.dart';
import 'package:tasbih/counter_items.dart';
import 'package:tasbih/screens/dua1.dart';
import 'package:tasbih/screens/durud_sharif.dart';
import 'package:tasbih/screens/namaz/namaz_screen.dart';
import 'package:tasbih/screens/shab_e_berat.dart';
import 'package:tasbih/utils/library_utils.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    loadItems();
  }

  void loadItems() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/json_files/maqsus_hadis.json');
    final decodedData = json.decode(data);
    if (decodedData is List) {
      setState(() {
        items = decodedData.cast<Map<String, dynamic>>();
      });
    }
  }

  Map<String, dynamic> getRandomItem() {
    if (items.isEmpty) return {};
    Random random = Random();
    return items[random.nextInt(items.length)];
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> item = getRandomItem();

    return Scaffold(
      appBar: myCustomAppBar(context, 'Tasbih', 'APP'),
      drawer: const MyAppDrawer(),
      body: SingleChildScrollView(
        child: Container(
          constraints: const BoxConstraints(minHeight: 0, minWidth: 0),
          child: Column(
            children: [
              Image.asset(
                'assets/madina_pic.png',
                width: double.infinity,
              ),
              const SizedBox(height: 4),
              Card(
                shadowColor: Colors.blue,
                elevation: 10.0,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue),
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(10)),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item['title'] ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Visibility(
                          visible: item['subtitle'].toString().isNotEmpty,
                          child: const SizedBox(height: 10),
                        ),
                        Visibility(
                          visible: item['subtitle'].toString().isNotEmpty,
                          child: Text(
                            item['subtitle'] ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Visibility(
                          visible: item['hawala'].toString().isNotEmpty,
                          child: Text(
                            item['hawala'] ?? '',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 4),
              const Card(
                elevation: 3,
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue),
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(10)),
                ),
                child: SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Center(
                    child: Text(
                      'Shab e Juma ki durud sharif',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 1),
              Padding(
                padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                child: Card(
                  elevation: 3.0,
                  shadowColor: Colors.blue,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.blue),
                    borderRadius:
                        BorderRadiusDirectional.all(Radius.circular(10)),
                  ),
                  child: GestureDetector(
                    child: Image.asset(
                      'assets/juma_durud.png',
                      width: double.infinity,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DurudJuma(),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Card(
                elevation: 3.0,
                shadowColor: Colors.blue,
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue),
                  borderRadius:
                      BorderRadiusDirectional.all(Radius.circular(10)),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.orange),
                                  elevation: const MaterialStatePropertyAll(4),
                                  shadowColor:
                                      MaterialStateProperty.all(Colors.blue),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const CounterHome(),
                                    ),
                                  );
                                },
                                child: const Text('Go To Tasbih'),
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DuaScreen(),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.orange),
                                  elevation: const MaterialStatePropertyAll(4),
                                  shadowColor:
                                      MaterialStateProperty.all(Colors.blue),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                ),
                                child: const Text('Duain'),
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NamaazScreen(),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.orange),
                                  elevation: const MaterialStatePropertyAll(4),
                                  shadowColor:
                                      MaterialStateProperty.all(Colors.blue),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                ),
                                child: const Text('Namaaz'),
                              ),
                              const Padding(padding: EdgeInsets.only(left: 10)),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const ShabeBaraatScreen(),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all(Colors.orange),
                                  elevation: const MaterialStatePropertyAll(4),
                                  shadowColor:
                                      MaterialStateProperty.all(Colors.blue),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.black),
                                ),
                                child: const Text('Shab E Barat'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
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
                                        decorationColor:
                                            Colors.white.withOpacity(0.9),
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
                            autoPlayAnimationDuration:
                                const Duration(seconds: 1),
                            viewportFraction: 0.8,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
