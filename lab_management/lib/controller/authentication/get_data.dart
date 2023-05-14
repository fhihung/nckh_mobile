import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/users.dart';

class FirestoreService {
  Future<Users> getData(String email) async {
    final userCollection = FirebaseFirestore.instance.collection('Number');
    final querySnapshot =
        await userCollection.where('email', isEqualTo: email).get();

    if (querySnapshot.docs.isNotEmpty) {
      final userData = querySnapshot.docs.first.data();

      return Users(
        email: userData['email'],
        name: userData['name'],
        day: userData['day'],
        month: userData['month'],
        year: userData['year'],
      );
    } else {
      // Không tìm thấy dữ liệu
      print('No data found for email: $email');
      return Users(
        email: email,
        name: '',
        day: '',
        month: '',
        year: '',
      );
    }
  }
}
// class FirestoreService {
//   Future<User> getData(String email) async {
//     final userCollection = FirebaseFirestore.instance.collection('Number');
//     final querySnapshot =
//         await userCollection.where('email', isEqualTo: email).get();

//     if (querySnapshot.docs.isNotEmpty) {
//       final userData = querySnapshot.docs.first.data();
//       // Hiển thị dữ liệu lên màn hình
//       String year = userData['year'];
//       // print('User data: $userData');
//       print('User data: $year');
//     } else {
//       // Không tìm thấy dữ liệu
//       print('No data found for email: $email');
//     }
//   }
// }
