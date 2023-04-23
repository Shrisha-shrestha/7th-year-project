import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:recipe/authentication/login.dart';
import 'package:recipe/authentication/register.dart';
import '../model/firebasecollection.dart';
import '../model/Storagemodel.dart';

class Toggler extends StatefulWidget {
  @override
  State<Toggler> createState() => _TogglerState();
}

class _TogglerState extends State<Toggler> {
  bool showsignin = true;
  void toggle() {
    setState(() {
      showsignin = !showsignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showsignin) {
      return LoginScreen(
        toogle: toggle,
      );
    } else {
      return RegisterScreen(
        toogle: toggle,
      );
    }
  }
}

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Userid? _userFromfireuser(User? user) {
    return user != null ? Userid(uid: user.uid) : null;
  }

  Stream<Userid?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromfireuser(user));
  }

  Future regwithEandP(String email, String password, String id,String Name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? comingUser = result.user;

      await DatabaseService(fid: comingUser!.uid).updateid(int.parse(id));
      await DatabaseService(fid: comingUser.uid).updatecookbook([]);
      await DatabaseService(fid: comingUser.uid)
          .updatepersonalinfo(Name);
      return _userFromfireuser(comingUser);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? alrUser = result.user;
      return _userFromfireuser(alrUser!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
