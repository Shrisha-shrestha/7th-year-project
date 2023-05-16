import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:recipe/Bloc/Myrecipes_bloc/mrecipe_cubit.dart';
import 'package:recipe/Bloc/PInfo_Bloc/pinfo_cubit.dart';
import 'package:recipe/Bloc/UserId_Bloc/userid_cubit.dart';
import 'package:recipe/Splash/loading.dart';
import 'package:recipe/authentication/login.dart';
import 'package:recipe/helper/aboutapp.dart';
import 'package:recipe/home/homeprovider.dart';
import 'package:recipe/model/Storagemodel.dart';
import 'package:recipe/pages/addRecipe.dart';
import 'package:recipe/pages/home.dart';

import '../Bloc/FId_Bloc/fid_cubit.dart';
import '../authentication/authenticationServices.dart';
import '../helper/edit.dart';
import '../helper/edit2.dart';
import '../model/firebasecollection.dart';
import 'MyRecipes.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key, required this.fid});
  final String fid;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String id = '';

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel(Currentuserid? user) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: BlocProvider<UseridCubit>.value(
                  value: UseridCubit(widget.fid.toString()),
                  child: changeid(idclass: user)),
            );
          });
    }

    void _showSettingsPanel2(Currentpinfo? info) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: BlocProvider<PinfoCubit>.value(
                  value: PinfoCubit(widget.fid.toString()),
                  child: changeName(nameclass: info)),
            );
          });
    }

    return Scaffold(
      body: StreamBuilder<Currentuserid>(
        stream: DatabaseService(fid: widget.fid).currentID,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Currentuserid? ud = snapshot.data;
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  title: const Text(
                    'Profile',
                    style: TextStyle(color: Colors.black, letterSpacing: 1.5),
                  ),
                  centerTitle: true,
                ),
                body: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      BlocBuilder<PinfoCubit, Stream<Currentpinfo>?>(
                        builder: (context, state) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: StreamBuilder(
                                stream: state,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Column(
                                      children: [
                                        Center(
                                          child: Stack(
                                            children: [
                                              CircleAvatar(
                                                radius: 60.0,
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                child: Text(
                                                  '${snapshot.data!.name[0]}'
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                      fontSize: 50.0,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 1,
                                                right: 1,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    _showSettingsPanel2(
                                                        snapshot.data);
                                                  },
                                                  child: Container(
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5.0),
                                                      child: Icon(Icons.edit,
                                                          size: 18.0,
                                                          color: Colors.black),
                                                    ),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 3,
                                                          color: Colors.white,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(
                                                            30,
                                                          ),
                                                        ),
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            offset:
                                                                Offset(2, 4),
                                                            color: Colors.black
                                                                .withOpacity(
                                                              0.3,
                                                            ),
                                                            blurRadius: 3,
                                                          ),
                                                        ]),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 12.0,
                                        ),
                                        Text(
                                          snapshot.data!.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 20.0),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Text('no name');
                                  }
                                }),
                          );
                        },
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'User ID: ${ud!.userid.toString()}',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15.0),
                        ),
                      ),

                      Text(
                        '${FirebaseAuth.instance.currentUser!.email}',
                        style: TextStyle(letterSpacing: 1.5),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextButton(
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color:
                                              Colors.black.withOpacity(0.2)))),
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              Colors.amber.withOpacity(0.5)),
                        ),
                        onPressed: () {
                          _showSettingsPanel(ud);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'Edit ID',
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 8.0),
                        child: Container(
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3.0,
                                  offset: new Offset(1.0, 1.0))
                            ],
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => About()));
                            },
                            leading: CircleAvatar(
                                radius: 16.0,
                                backgroundColor: Colors.amber.withOpacity(0.5),
                                child: Icon(
                                  Icons.android,
                                  size: 16.0,
                                  color: Colors.black,
                                )),
                            title: Text('About App'),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              size: 15.0,
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       horizontal: 25.0, vertical: 8.0),
                      //   child: Container(
                      //     decoration: new BoxDecoration(
                      //       borderRadius: new BorderRadius.circular(10.0),
                      //       color: Colors.white,
                      //       boxShadow: [
                      //         new BoxShadow(
                      //             color: Colors.grey,
                      //             blurRadius: 3.0,
                      //             offset: new Offset(1.0, 1.0))
                      //       ],
                      //     ),
                      //     child: ListTile(
                      //       onTap: () {
                      //         Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //             builder: (context) => HomeScreen(),
                      //           ),
                      //         );
                      //       },
                      //       leading: CircleAvatar(
                      //           radius: 16.0,
                      //           backgroundColor:
                      //               Colors.amber.withOpacity(0.5),
                      //           child: Icon(
                      //             Icons.home_outlined,
                      //             size: 16.0,
                      //             color: Colors.black,
                      //           )),
                      //       title: Text('Go Home'),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 8.0),
                        child: Container(
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3.0,
                                  offset: new Offset(1.0, 1.0))
                            ],
                          ),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          BlocProvider<MyRecipeCubit>.value(
                                              value: MyRecipeCubit(
                                                  widget.fid.toString()),
                                              child: MyRecipes(
                                                fid: widget.fid,
                                              ))));
                            },
                            leading: CircleAvatar(
                                radius: 16.0,
                                backgroundColor: Colors.amber.withOpacity(0.5),
                                child: Icon(
                                  Icons.book,
                                  size: 15.0,
                                  color: Colors.black,
                                )),
                            title: Text('My Recipes'),
                            // trailing: Icon(Icons.more_vert),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 8.0),
                        child: Container(
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                            color: Colors.white,
                            boxShadow: [
                              new BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 3.0,
                                  offset: new Offset(1.0, 1.0))
                            ],
                          ),
                          child: ListTile(
                            onTap: () {
                              context.read<FireidCubit>().logout();
                            },
                            leading: CircleAvatar(
                                radius: 16.0,
                                backgroundColor: Colors.amber.withOpacity(0.5),
                                child: Icon(
                                  Icons.logout,
                                  size: 15.0,
                                  color: Colors.black,
                                )),
                            title: Text('Log Out'),
                            // trailing: Icon(Icons.more_vert),
                          ),
                        ),
                      )
                    ]),
              ),
            );
          } else {
            return Loading();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider<MyRecipeCubit>.value(
                      value: MyRecipeCubit(widget.fid.toString()),
                      child: AddRecipes())));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
