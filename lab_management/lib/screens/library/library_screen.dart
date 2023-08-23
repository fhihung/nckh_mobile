// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:flutter/material.dart';
// import 'package:lab_management/constant.dart';
// import 'book_list_screen.dart';
// import 'add_book_screen.dart';

// class LibraryScreen extends StatelessWidget {
//   const LibraryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(backgroundColor: kPrimaryColor),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ButtonCustom(
//               textBtn: 'Book List',
//               press: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => BookListScreen()),
//                 );
//               },
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ButtonCustom(
//               textBtn: 'Add Book',
//               press: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => AddBookScreen()),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ButtonCustom extends StatelessWidget {
//   VoidCallback press;
//   String textBtn;
//   ButtonCustom({
//     Key? key,
//     required this.press,
//     required this.textBtn,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(onPressed: press, child: Text(textBtn));
//   }
// }
