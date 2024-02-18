import 'package:flutter/material.dart';
import 'package:tasbih/utils/library_utils.dart';

class DurudJuma extends StatelessWidget {
  const DurudJuma({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, 'Durud', 'SHARIF'),
      body: const Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Shab e juma durood ki fazilat',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '    Buzurgan e Deen Ne Farmaya Ke Jo Shaks Har Shab E Jumma (Jumuah (Friday) or Jumerat (Thursday) Ke Darmiyani Raat) Is Darood Sharif Ko Pabandi Se kam-az-kam ek martaba (atleast 1 time) padhega to maut (death) k waqt Sarkare Madina ﷺ ki ziyarat karega aur kabr main dakhil hote waqt bhi, yaha tak ki wo dekhega ki sarkare madina Hazrat Muhammad ﷺ use kabr me apne rehmat bhare hatho se utar rahe hain.',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '[Afdal Us Salawat Ala Sayyidis Sadat Page No 151, Al Tagreeb Wat Tarheeb]',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    color: Colors.orange,
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
