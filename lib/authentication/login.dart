import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/authentication/forgot_password.dart';
import 'package:recipe/choices/choices.dart';
import 'package:recipe/helper/wrapper.dart';
import 'package:recipe/home/homeprovider.dart';
import 'package:recipe/pages/home.dart';

import '../Bloc/UserId_Bloc/userid_cubit.dart';
import '../Splash/loading.dart';
import '../model/Storagemodel.dart';
import '../model/firebasecollection.dart';
import 'authenticationServices.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.toogle});
  // final Store store;
  final Function toogle;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool load = false;
  String password = '';
  String email = '';
  String error = '';
  final AuthService _auth = AuthService();
  var isEnabled = false;
  final animationDuration = Duration(milliseconds: 500);
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
      return Material(
        child: SafeArea(
          child: load
              ? Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 80,
                    width: 80,
                    child: Center(
                      child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Scaffold(
                    appBar: AppBar(
                      actions: [
                        TextButton(
                            onPressed: () {
                              widget.toogle();
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(color: Colors.grey),
                            ))
                      ],
                      centerTitle: true,
                      backgroundColor: Colors.white,
                      title: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.black),
                      ),
                      iconTheme: IconThemeData(color: Colors.black),
                      elevation: 0,
                    ),
                    body: Container(
                      color: Colors.black,
                      child: Stack(children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/login.jpg'))),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.3),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0)),
                            child: SingleChildScrollView(
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 240.0,
                                          child: Text(
                                            'Welcome back to Good Food',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                                fontSize: 30),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Container(
                                          child: Form(
                                            key: _formkey,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                TextFormField(
                                                  validator: (val) =>
                                                      val!.isEmpty
                                                          ? 'Enter an email'
                                                          : null,
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary),
                                                    ),
                                                    labelText: 'Email',
                                                    labelStyle: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondary
                                                            .withOpacity(0.5)),
                                                  ),
                                                  onChanged: (val) {
                                                    setState(() => email = val);
                                                  },
                                                  onSaved: (input) {},
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                TextFormField(
                                                  validator: (val) => val!
                                                              .length <
                                                          6
                                                      ? 'Enter a  password 6 characters long'
                                                      : null,
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary),
                                                    ),
                                                    labelText: 'Password',
                                                    labelStyle: TextStyle(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondary
                                                            .withOpacity(0.5)),
                                                  ),
                                                  obscureText: true,
                                                  onSaved: (input) {},
                                                  onChanged: (val) {
                                                    setState(
                                                        () => password = val);
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 40.0,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          isEnabled =
                                                              !isEnabled;
                                                        });
                                                      },
                                                      child: Row(
                                                        children: [
                                                          AnimatedContainer(
                                                            height: 30,
                                                            width: 50,
                                                            duration:
                                                                animationDuration,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              color: isEnabled
                                                                  ? Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .secondary
                                                                  : Theme.of(
                                                                          context)
                                                                      .colorScheme
                                                                      .primary,
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .white,
                                                                  width: 2),
                                                            ),
                                                            child:
                                                                AnimatedAlign(
                                                              duration:
                                                                  animationDuration,
                                                              alignment: isEnabled
                                                                  ? Alignment
                                                                      .centerRight
                                                                  : Alignment
                                                                      .centerLeft,
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            2),
                                                                child:
                                                                    Container(
                                                                  width: 20,
                                                                  height: 20,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5.0,
                                                          ),
                                                          Text(
                                                            'Remember',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .secondary),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Otp()));
                                                      },
                                                      child: Text(
                                                        'Forgot password?',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .secondary),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 30.0,
                                                ),
                                                TextButton(
                                                  style: TextButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .secondary,
                                                  ),
                                                  onPressed: () async {
                                                    if (_formkey.currentState!
                                                        .validate()) {
                                                      setState(() {
                                                        load = true;
                                                      });
                                                      // dynamic result =
                                                      //     await _auth.signIn(
                                                      //         email, password);
                                               context.read<UseridCubit>().login(
                                                              email, password);
                                                               setState(() {
                                                          load = false;
                                                        });
                                                      // if (result == null) {
                                                      //   setState(() {
                                                      //     load = false;
                                                      //   });
                                                      //   error =
                                                      //       'couldnt sign in with that';
                                                      // }
                                                      // setState(() {
                                                      //   load = false;
                                                      // });
                                                      // final user =
                                                      //     Provider.of<SigningUser?>(
                                                      //         context,
                                                      //         listen: false);
                                                      // // user!.updateUser(1);

                                                      // Navigator.of(context).push(
                                                      //     MaterialPageRoute(
                                                      //         builder: (context) =>
                                                      //             wrapper()));
                                                    }
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 120.0,
                                                        vertical: 5.0),
                                                    child: const Text(
                                                      'Log In',
                                                      style: TextStyle(
                                                          fontSize: 17,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 25,
                                                ),
                                                Text(
                                                  error,
                                                  style: TextStyle(
                                                      color: Colors.red),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        )
                      ]),
                    ),
                  ),
                ),
        ),
      );
    
  }
}
