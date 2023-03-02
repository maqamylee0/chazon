
import 'package:chazon/features/auth/pages/VerifyPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../features/auth/models/user.dart';
import '../../features/auth/pages/checkmail.dart';
import '../../features/dashboard/pages/dashboard.dart';

class AuthService{
  String? errorMessage;
  final _auth = FirebaseAuth.instance;

  Future signUp(String email, String password,userModel,context) async {
    // if (_formKey.currentState!.validate()) {
    // final directory = await getApplicationDocumentsDirectory();
    // box1 = await Hive.openBox('personaldata');


    try {
      showDialog(context: context,barrierDismissible: false,
          builder: (context) => const Center(child: CircularProgressIndicator()));
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => { postDetailsToFirestore(userModel,context)})
          .catchError((e) {
        Navigator.pop(context);

        Fluttertoast.showToast(msg: e!.message);

      });
    } on FirebaseAuthException catch (error) {

      switch (error.code) {
        case "invalid-email":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "wrong-password":
          errorMessage = "Your password is wrong.";
          break;
        case "user-not-found":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "user-disabled":
          errorMessage = "User with this email has been disabled.";
          break;
        case "too-many-requests":
          errorMessage = "Too many requests";
          break;
        case "operation-not-allowed":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }

      Fluttertoast.showToast(msg: errorMessage!);
      Navigator.pop(context);

      print(error.code);
    }
    // navigatorKey.currentState!.popUntil((route)=>route.isFirst);
  }
  postDetailsToFirestore(Users users,context) async {
    User? user=_auth.currentUser;
    users?.email = users!.email;
    users?.uid = users!.uid;

    // sendVerificationCode(context, userModel.email );

    //save uid of user in local storage
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setString('userid', '${user!.uid}');
    // await prefs.setString('username', '${users.name}');
    // await prefs.setString('photoUrl', '${user!.photoURL}');
    Navigator.pop(context);

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  VerifyOne())

    );
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // box1.put('userid', user!.uid);

    await firebaseFirestore
        .collection("users")
        .doc(users.uid)
        .set(users.toJson());

    Fluttertoast.showToast(msg: "Account created successfully :) ");

  }
  Future signIn(context,email,password) async {

    showDialog(context: context,barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.trim(), password:password.trim());
        if(FirebaseAuth.instance.currentUser?.emailVerified == true){
          Navigator.pop(context);

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  DashboardPage())

          );
        }else{
          Navigator.pop(context);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>  VerifyOne())

          );
        }

    } on FirebaseException catch(e){
      // navigatorKey.currentState!.popUntil((route)=>route.isFirst);
      Navigator.pop(context);
      if (kDebugMode) {
        print(e);
      }
      Fluttertoast.showToast(msg:'${e.message}');

    }

    // navigatorKey.currentState!.popUntil((route)=>route.isFirst);
  }

  Future<void> passwordReset(String? email,context) async {
    showDialog(context: context,barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    final _auth = FirebaseAuth.instance;
    try {
      // _formKey.currentState?.save();

      await _auth.sendPasswordResetEmail(email: email!);

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return CheckEmail();
        }),
      );
    } catch (e) {
      print(e);
    }
  }

  Future<Users> getUserDetails() async {
    late Users doc ;
    //     builder: (context) => const Center(child: CircularProgressIndicator()));
    // final prefs = await SharedPreferences.getInstance();
    // final userid = prefs.getString('userid');
    // final username = prefs.getString('username');
    // final photoUrl = prefs.getString('photoUrl');
    User? user=_auth.currentUser;

    try{
      FirebaseFirestore mFirebaseFirestore = FirebaseFirestore.instance;

      await mFirebaseFirestore.collection('users')
          .where('uid', isEqualTo: user?.uid)
          .get()
          .then((snapshot)  async {
        doc =  Users.fromJson(snapshot.docs[0].data()) ;
      });

    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    // navigatorKey.currentState!.popUntil((route)=>route.);
    // print(doc['nin']);
    return doc;
  }

}