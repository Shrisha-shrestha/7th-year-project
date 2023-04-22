import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Bloc/FId_Bloc/fid_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.toogle});
  final Function toogle;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool load = false;
  bool _passwordVisible = false;
  String error = '';
  AutovalidateMode val = AutovalidateMode.disabled;

  bool isEnabled = false;

  @override
  void initState() {
    super.initState();
    _getSP();
  }

  final emailcontroller = TextEditingController();
  final pwcontroller = TextEditingController();

  final animationDuration = const Duration(milliseconds: 500);
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  void _getSP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isEnabled = prefs.getBool('rememberMe') ?? false;
      emailcontroller.text =
          isEnabled == true ? prefs.getString('email') ?? "" : "";
      pwcontroller.text = isEnabled == true ? prefs.getString('pw') ?? "" : "";
    });
  }

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
                  body: CustomScrollView(slivers: <Widget>[
                    SliverAppBar(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40.0),
                          bottomRight: Radius.circular(40.0),
                        ),
                      ),
                      expandedHeight: 250.0,
                      pinned: true,
                      snap: false,
                      floating: false,
                      flexibleSpace: FlexibleSpaceBar(
                          centerTitle: true,
                          titlePadding: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 10.0),
                          title: Text(
                            'Sign In',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          background: Stack(
                            children: [
                              Container(
                                  width: 1500,
                                  height: 270,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(40.0),
                                      ),
                                      color: Colors.white,
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              AssetImage('assets/login.jpg')))),
                            ],
                          )),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                        color: Colors.black,
                        child: Stack(children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40.0)),
                              color: Colors.white,
                            ),
                            width: MediaQuery.of(context).size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                              autovalidateMode: val,
                                              controller: emailcontroller,
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
                                                focusedBorder:
                                                    OutlineInputBorder(
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
                                              onChanged: (val) {},
                                              onSaved: (input) {},
                                            ),
                                            SizedBox(
                                              height: 20.0,
                                            ),
                                            TextFormField(
                                              autovalidateMode: val,
                                              controller: pwcontroller,
                                              validator: (val) => val!.length <
                                                      6
                                                  ? 'Enter a  password 6 characters long'
                                                  : null,
                                              decoration: InputDecoration(
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    _passwordVisible
                                                        ? Icons.visibility
                                                        : Icons.visibility_off,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _passwordVisible =
                                                          !_passwordVisible;
                                                    });
                                                  },
                                                ),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
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
                                              obscureText: !_passwordVisible,
                                              onSaved: (input) {},
                                              onChanged: (val) {},
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
                                                      isEnabled = !isEnabled;
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
                                                                  .circular(30),
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
                                                              color:
                                                                  Colors.white,
                                                              width: 2),
                                                        ),
                                                        child: AnimatedAlign(
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
                                                            child: Container(
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
                                                        'Remember me',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Theme.of(
                                                                    context)
                                                                .colorScheme
                                                                .secondary),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    if (emailcontroller.text !=
                                                        "") {
                                                      print(
                                                          emailcontroller.text);
                                                      Fluttertoast.showToast(
                                                          msg:
                                                              "Password reset email sent to ${emailcontroller.text}",
                                                          toastLength:
                                                              Toast.LENGTH_LONG,
                                                          gravity: ToastGravity
                                                              .BOTTOM,
                                                          timeInSecForIosWeb: 1,
                                                          backgroundColor:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .primary,
                                                          textColor: Colors
                                                              .black
                                                              .withOpacity(0.6),
                                                          fontSize: 12.0);
                                                      context
                                                          .read<FireidCubit>()
                                                          .forgotpw(
                                                            emailcontroller
                                                                .text,
                                                          );
                                                    }
                                                  },
                                                  child: Text(
                                                    'Forgot password?',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Theme.of(context)
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
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
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
                                                  SharedPreferences prefs =
                                                      await SharedPreferences
                                                          .getInstance();
                                                  await prefs.setBool(
                                                      'rememberMe', isEnabled);
                                                  await prefs.setString('email',
                                                      emailcontroller.text);
                                                  await prefs.setString(
                                                      'pw', pwcontroller.text);
                                                  print(pwcontroller.text);
                                                  context
                                                      .read<FireidCubit>()
                                                      .login(
                                                          emailcontroller.text,
                                                          pwcontroller.text);
                                                  setState(() {
                                                    load = false;
                                                  });
                                                } else {
                                                  setState(() {
                                                    val =
                                                        AutovalidateMode.always;
                                                  });
                                                }
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                            Text.rich(TextSpan(
                                                text:
                                                    'Don\'t have an account? ',
                                                style: TextStyle(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                    fontSize: 15.0),
                                                children: [
                                                  TextSpan(
                                                    text: 'Sign Up',
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                    recognizer:
                                                        TapGestureRecognizer()
                                                          ..onTap = () {
                                                            widget.toogle();
                                                          },
                                                  ),
                                                ])),
                                            SizedBox(
                                              height: 50.0,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ]),
                ),
              ),
      ),
    );
  }
}
