import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe/helper/Terms.dart';
import 'package:recipe/helper/privacy.dart';
import '../Bloc/FId_Bloc/fid_cubit.dart';
import 'authenticationServices.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.toogle});
  final Function toogle;
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailcontroller = TextEditingController();
  final pwcontroller = TextEditingController();
  final idcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  bool _passwordVisible = false;
  bool isagreed = false;

  AutovalidateMode val = AutovalidateMode.disabled;
  String error = '';
  bool load = false;
  List<String> roles = ['Admin', 'Client'];
  String? dropdownvalue;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
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
            child: SafeArea(
              child: Scaffold(
                body: CustomScrollView(
                  slivers: [
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
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        background: Container(
                            width: 1500,
                            height: 270,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40.0),
                                ),
                                color: Colors.white,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/login.jpg')))),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Container(
                          color: Colors.black,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40.0)),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        height: 10.0,
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
                                                controller: idcontroller,
                                                validator: (val) => val!.isEmpty
                                                    ? 'Enter a id'
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
                                                  labelText: 'ID',
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
                                              DropdownButtonFormField(
                                                validator: (val) => val == null
                                                    ? 'Select a role please'
                                                    : null,
                                                menuMaxHeight: 250.0,
                                                decoration: InputDecoration(
                                                  labelText: 'Role',
                                                  labelStyle: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary
                                                          .withOpacity(0.5)),
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
                                                ),
                                                value: dropdownvalue,
                                                icon: const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.grey,
                                                ),
                                                items: roles.map((String val) {
                                                  return DropdownMenuItem(
                                                    alignment: Alignment.center,
                                                    value: val,
                                                    child: Text(
                                                      val,
                                                      style:TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                    ),
                                                  ));
                                                }).toList(),
                                                onChanged: (newValue) {
                                                   dropdownvalue = newValue!;
                                                },
                                                onSaved: (value) {
                                                   dropdownvalue = value!;
                                                },
                                              ),
                                              SizedBox(
                                                height: 20.0,
                                              ),
                                              TextFormField(
                                                autovalidateMode: val,
                                                controller: namecontroller,
                                                validator: (val) => val!.isEmpty
                                                    ? 'Enter your name'
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
                                                  labelText: 'Full Name',
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
                                                validator: (val) => val!
                                                            .length <
                                                        6
                                                    ? 'Enter a  password 6 characters long'
                                                    : null,
                                                decoration: InputDecoration(
                                                  suffixIcon: IconButton(
                                                    icon: Icon(
                                                      _passwordVisible
                                                          ? Icons.visibility
                                                          : Icons
                                                              .visibility_off,
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
                                                height: 20.0,
                                              ),
                                              Row(
                                                children: [
                                                  Checkbox(
                                                      value: isagreed,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          isagreed = !isagreed;
                                                          error = '';
                                                        });
                                                      }),
                                                  Text.rich(TextSpan(children: [
                                                    TextSpan(
                                                      text: ' I agree to all ',
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 15.0),
                                                    ),
                                                    TextSpan(
                                                      text: 'Terms of Use',
                                                      style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              Terms()));
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
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      recognizer:
                                                          TapGestureRecognizer()
                                                            ..onTap = () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              Privacy()));
                                                            },
                                                    ),
                                                  ])),
                                                ],
                                              ),
                                              Text(
                                                error,
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
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
                                                          .validate() &&
                                                      isagreed == true) {
                                                    setState(() {
                                                      load = true;
                                                    });
                                                    context
                                                        .read<FireidCubit>()
                                                        .register(
                                                            emailcontroller
                                                                .text,
                                                            pwcontroller.text,
                                                            idcontroller.text,
                                                            namecontroller
                                                                .text,dropdownvalue!);
                                                    setState(() {
                                                      load = false;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      error =
                                                          'You have to agree to our terms, conditions and privacy policy to proceed.';
                                                      val = AutovalidateMode
                                                          .always;
                                                    });
                                                  }
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
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
                                                height: 8.0,
                                              ),
                                              // SizedBox(
                                              //   width: MediaQuery.of(context)
                                              //           .size
                                              //           .width *
                                              //       0.73,
                                              //   child: OutlinedButton(
                                              //     style: OutlinedButton.styleFrom(
                                              //         side: BorderSide(
                                              //             width: 1.0,
                                              //             color: Theme.of(context)
                                              //                 .colorScheme
                                              //                 .secondary),
                                              //         shape:
                                              //             RoundedRectangleBorder(
                                              //           borderRadius:
                                              //               BorderRadius.circular(
                                              //                   30),
                                              //         ),
                                              //         backgroundColor:
                                              //             Colors.white),
                                              //     onPressed: () {
                                              //       // Navigator.of(context).push(
                                              //       // MaterialPageRoute(
                                              //       //     builder: (context) =>
                                              //       //         RegisterScreen(
                                              //       //         )
                                              //       //         ));
                                              //     },
                                              //     child: Padding(
                                              //       padding: const EdgeInsets
                                              //               .symmetric(
                                              //           horizontal: 35.0,
                                              //           vertical: 5.0),
                                              //       child: Row(
                                              //         children: [
                                              //           Icon(
                                              //             Icons.facebook_sharp,
                                              //             color: Theme.of(context)
                                              //                 .colorScheme
                                              //                 .secondary,
                                              //           ),
                                              //           SizedBox(
                                              //             width: 8.0,
                                              //           ),
                                              //           Text(
                                              //             'Sign up with facebook',
                                              //             style: TextStyle(
                                              //                 fontSize: 15,
                                              //                 color: Theme.of(
                                              //                         context)
                                              //                     .colorScheme
                                              //                     .secondary),
                                              //           ),
                                              //         ],
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),
                                              SizedBox(
                                                height: 15.0,
                                              ),
                                              Text.rich(TextSpan(
                                                  text:
                                                      'Already have an account? ',
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary,
                                                      fontSize: 15.0),
                                                  children: [
                                                    TextSpan(
                                                      text: 'Sign In',
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
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
