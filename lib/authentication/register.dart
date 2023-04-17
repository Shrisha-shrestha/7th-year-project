import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/home/homeprovider.dart';

import '../Bloc/UserId_Bloc/userid_cubit.dart';
import '../model/Storagemodel.dart';
import 'authenticationServices.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.toogle});
  // final Store store;
  final Function toogle;
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String password = '';
  String email = '';
  String error = '';
  bool load = false;
  final AuthService _auth = AuthService();

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return load
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
                        'Sign in',
                        style: TextStyle(color: Colors.grey),
                      ))
                ],
                centerTitle: true,
                backgroundColor: Colors.white,
                title: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.black),
                ),
                iconTheme: IconThemeData(color: Colors.black),
                elevation: 0,
              ),
              body: Container(
                color: Colors.black,
                child: Stack(children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            fit: BoxFit.fitWidth,
                            image: AssetImage('assets/soup.jpg'))),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 240.0,
                                    child: Text(
                                      'Let\'s start making good meals',
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
                                            validator: (val) => val!.isEmpty
                                                ? 'Enter an email'
                                                : null,
                                            decoration: InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
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
                                            validator: (val) => val!.length < 6
                                                ? 'Enter a  password 6 characters long'
                                                : null,
                                            decoration: InputDecoration(
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Theme.of(context)
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
                                              setState(() => password = val);
                                            },
                                          ),
                                          SizedBox(
                                            height: 30.0,
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
                                            ),
                                            onPressed: () async {
                                              if (_formkey.currentState!
                                                  .validate()) {
                                                setState(() {
                                                  load = true;
                                                });
                                                context.read<UseridCubit>().register(
                                                              email, password);
                                                               setState(() {
                                                          load = false;
                                                        });
                                              }
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 70.0,
                                                      vertical: 5.0),
                                              child: const Text(
                                                'Create Account',
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
                                            style: TextStyle(color: Colors.red),
                                          ),
                                          SizedBox(
                                            height: 15.0,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.73,
                                            child: OutlinedButton(
                                              style: OutlinedButton.styleFrom(
                                                  side: BorderSide(
                                                      width: 1.0,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                  ),
                                                  backgroundColor:
                                                      Colors.white),
                                              onPressed: () {
                                                // Navigator.of(context).push(
                                                // MaterialPageRoute(
                                                //     builder: (context) =>
                                                //         RegisterScreen(
                                                //         )
                                                //         ));
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 35.0,
                                                        vertical: 5.0),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.facebook_sharp,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                    ),
                                                    SizedBox(
                                                      width: 8.0,
                                                    ),
                                                    Text(
                                                      'Sign up with facebook',
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 35.0,
                                          ),
                                          Text.rich(TextSpan(children: [
                                            TextSpan(
                                              text: 'Terms of Use',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  // Navigator.of(context).push(Materias
                                                },
                                            ),
                                            TextSpan(
                                              text: ' and ',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 15.0),
                                            ),
                                            TextSpan(
                                              text: 'Privacy Policy',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                              recognizer: TapGestureRecognizer()
                                                ..onTap = () {
                                                  // Navigator.of(context).push(Materias
                                                },
                                            ),
                                          ]))
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
          );
  }
}
