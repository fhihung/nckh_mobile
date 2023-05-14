// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationFireBase {
  String email;
  String pass;
  AuthenticationFireBase({
    required this.email,
    required this.pass,
  });
  Future signIn() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: pass,
    );
  }

  Future signOut() async {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: pass,
    );
  }
}
