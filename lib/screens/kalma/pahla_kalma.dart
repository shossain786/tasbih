import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/library_utils.dart';

class PahlaKamla extends StatelessWidget {
  const PahlaKamla({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, 'PAHLA', 'KALMA'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              margin: const EdgeInsets.only(left: 10, right: 10),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Hazrat Jabir(رضی اللہ تعالی عنہ) se riwayat hai ki pyare Nabi(ﷺ) ne farmaya - ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Sab zikron me badhkar aur sabse afzal zikr لَآ اِلٰهَ اِلَّا اللّٰهُ مُحَمَّدٌ رَّسُوْلُ اللّٰهِ hai',
                        style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: '\n\nHawala: Bukhari Sharif',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.only(left: 10, right: 10),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Hazrat Abdullah bin mar(رضی اللہ تعالی عنہ) bayan karte hai ki Aaqa madani صلی اللہ تعالی علیہ وسلم ke farman hai ki - ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Saaton aasman aur saaton zamin me jo kuch bhi hai ye sab ek palde me rakhi jaye aur dusre palde me Kalma Tayyiba ho to yakinan kalme wala palda bhari hai.',
                        style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: '\n\nHawala: Takhte Firdous',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.only(left: 10, right: 10),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Paigambar e khuda صلی اللہ تعالی علیہ وسلم ke irshad hai ki - ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Jo Shakhsh sachhe dil se kalma sharif ko padhe to woh yakinan bahisht me jaega.',
                        style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: '\n\nHawala: Bukhari, Muslim sharif',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.only(left: 10, right: 10),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Rasul e arabi صلی اللہ تعالی علیہ وسلم ne farmaya ki - ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Jo shaksh kalma taiyyaba ko har raj 100 martaba padne ka aadi ho jae to qiyamat ke din chaudahwi(14th) raat ke chand ke manind chamakta rahega.',
                        style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: '\n\nHawala: Takhte Firdous',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.only(left: 10, right: 10),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Hadise paak me aya hai ki - ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Jo shaksh kalma sharif ko padta rahega to use kabr mei koi dar aur dahshat na hogi.',
                        style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: '\n\nHawala: Takhte Firdous',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.only(left: 10, right: 10),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Tajdare Madina صلی اللہ تعالی علیہ وسلم ne farmaya ke farmaane aaliya hai ki - ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text:
                            'لَآ اِلٰهَ اِلَّا اللّٰهُ مُحَمَّدٌ رَّسُوْلُ اللّٰهِ padne walon ki dozakh se nikal dia jayega',
                        style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: '\n\nHawala: Takhte Firdous',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.only(left: 10, right: 10),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Pyare Nabi صلی اللہ تعالی علیہ وسلم ke payare qaul hai ki - ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Jo shakhash marte waqat kalma taiyyaba لَآ اِلٰهَ اِلَّا اللّٰهُ مُحَمَّدٌ رَّسُوْلُ اللّٰهِ ko padte hue iss dunia se kuch kia to mani wo apne pichle gunahon ka kaffara ada kar lia. Islie Khudae zallejalal uske tamam umr(complete life) ke gunahon ko maaf kar deta hai aur uska thikana bahishat me ata kar deta hai.',
                        style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: '\n\nHawala: Takhte Firdous',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.only(left: 10, right: 10),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Hazrat e Abu Zar(رضی اللہ تعالی عنہ) bayan karte hai ki ek baar me paigambare Khuda صلی اللہ تعالی علیہ وسلم ke khidmat me hazir hua. Uss waqat Aap(ﷺ) ek safed chadar ode so rahe the. Ye dekh mai wapas ho gaya. Fir mai dobara unke huzur hazir hua to app(ﷺ) jaag chuke the aur mujhse farmaya - ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Jo shaksh لَآ اِلٰهَ اِلَّا اللّٰهُ مُحَمَّدٌ رَّسُوْلُ اللّٰهِ ko padha aur usi yekin ke sath mar gaya to yekinan woh jannat me jayega. ',
                        style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text:
                            '\n\nYe sunkar maine arz kia "Ya Rasul Allah(ﷺ)! agar woh zina kia ho, usne chori ki ho tab bhi...?" \n\n Rasul e khuda(ﷺ) ne farmaya - ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: 'Han, usne zina kia ho ya chori ki ho.',
                        style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text:
                            '\n\n"Mai dubara fir arz kia - agar usne zina kia ho ya chori ki ho...?"',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: '\n"Han, usne zina kia ho ya chori ki ho."',
                        style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: ', Nabi(ﷺ) ne jawab dia.',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text:
                            '\n\n Maine tisri baar fir wahi zumla duhraya - "Kya agar usne zina kia ho ya chori kia ho...?"',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text:
                            '\n"Han, agar usne zina kia ho agar usne chori ki ho."',
                        style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Aap(ﷺ) musalsal yahi jawab dete rahe. \n\n Mujhse raha nahi gaya aur fir chauthi bar bade chambhe mei maine arz kia - "Ya Rasul Allah(ﷺ)! agar usne zina kia ho, agarche usne chori ki ho tab bhi woh jannat me jayega?" \n\n Aaqa madani(ﷺ) ne jawab dia - ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text:
                            '\n"Han, beshak woh jannat me jayega agarche usne zina kia ho, agarche usne chori ki ho. Chahe Abu Zar tum use mano ya na mano."',
                        style: TextStyle(
                          color: Colors.blue,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      TextSpan(
                        text: '\n\nHawala: Takhte Firdous',
                        style: TextStyle(
                          color: Color.fromARGB(255, 1, 30, 53),
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
