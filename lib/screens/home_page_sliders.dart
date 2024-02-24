// import 'package:flutter/material.dart';
// import 'package:flutter_card_swiper/flutter_card_swiper.dart';

// class CardSliders extends StatelessWidget {
//   CardSliders({super.key});

//   List<Widget> cards = [
//     const CustomCard(
//       title: 'Card 1',
//       color: Colors.blue,
//     ),
//     const CustomCard(
//       title: 'Card 2',
//       color: Colors.red,
//     ),
//     const CustomCard(
//       title: 'Card 3',
//       color: Colors.purple,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: CardSwiper(
//         cardsCount: cards.length,
//         cardBuilder: (context, index, percentThresholdX, percentThresholdY) =>
//             GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => DetailPage(index: index + 1),
//               ),
//             );
//           },
//           child: cards[index],
//         ),
//       ),
//     );
//   }
// }

// class CustomCard extends StatelessWidget {
//   final String title;
//   final Color color;

//   const CustomCard({
//     super.key,
//     required this.title,
//     required this.color,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 30.0,
//       shadowColor: Colors.blue,
//       shape: const RoundedRectangleBorder(
//         side: BorderSide(color: Colors.blue),
//         borderRadius: BorderRadiusDirectional.all(Radius.circular(10)),
//       ),
//       child: Container(
//         alignment: Alignment.center,
//         color: color,
//         height: 200,
//         child: Text(title),
//       ),
//     );
//   }
// }

// class DetailPage extends StatelessWidget {
//   final int index;

//   const DetailPage({Key? key, required this.index}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Detail Page'),
//       ),
//       body: Center(
//         child: Text('Detail of Card $index'),
//       ),
//     );
//   }
// }
