import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/home_screen.dart';
import '../loading_cubit.dart';
import '../login_screen.dart';

class LoginFunctions {
  final LoadingCubit overLay;
  FirebaseAuth _auth = FirebaseAuth.instance;
  String status = " ";
  UserCredential? usercred;

  LoginFunctions({required this.overLay});

  Future<void> loginuser(context) async {
    overLay.showLoading();
    String mail = email.text.trim();
    String pwd = pw.text.trim();
    try {
      usercred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: mail, password: pwd);
    } on FirebaseException catch (e) {
       if (e.code == 'invalid-email') {
        status = 'Invalid email format.';
      } else if (e.code == 'weak-password') {
        status = 'Password should be at least 6 characters.';
      }if (e.code == "email-already-in-use") {
        try {
          usercred = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: mail,
            password: pwd,
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            status = 'No user found for that email.';
          } else if (e.code == 'wrong-password') {
            status = 'Incorrect password.';
          } else if (e.code == 'invalid-email') {
            status = 'Invalid email format.';
          }
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Something went wrong. Please try again.')),
      );
    }
    overLay.hideLoading();
  }

  Future<void> auth(context) async {
    overLay.showLoading();
    User? currentuser = FirebaseAuth.instance.currentUser;
    if (currentuser != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
    overLay.hideLoading();
  }
}
