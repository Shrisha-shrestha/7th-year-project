import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/Splash/loading.dart';
import 'package:recipe/authentication/login.dart';
import 'package:recipe/home/homeprovider.dart';
import 'package:recipe/model/Storagemodel.dart';
import 'package:recipe/pages/home.dart';

import '../authentication/authenticationServices.dart';
import '../helper/edit.dart';
import '../helper/wrapper.dart';
import '../model/firebasecollection.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key, required this.id1});
  final Userid? id1;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final AuthService _auth = AuthService();
  String id = '';

  @override
  Widget build(BuildContext context) {
    Userid? user = widget.id1;

    void _showSettingsPanel(Userid? user) {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: change(id: user),
            );
          });
    }

    if (user != null) {
      return StreamBuilder<currentuserid>(
        stream: DatabaseService(uid: user.uid).current,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            currentuserid? ud = snapshot.data;
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
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context, false),
                  ),
                ),
                body: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 75,
                              backgroundColor: Colors.grey.shade200,
                              child: CircleAvatar(
                                radius: 70,
                                backgroundImage:
                                    AssetImage('assets/splash.jpg'),
                              ),
                            ),
                            Positioned(
                              bottom: 1,
                              right: 1,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Icon(Icons.edit, color: Colors.black),
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 3,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        50,
                                      ),
                                    ),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(2, 4),
                                        color: Colors.black.withOpacity(
                                          0.3,
                                        ),
                                        blurRadius: 3,
                                      ),
                                    ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'User ID: ${ud!.userid.toString()}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
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
                          _showSettingsPanel(user);
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
                            onTap: () async {
                              await _auth.signout();
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
                // body: Padding(
                //   padding: const EdgeInsets.all(2.0),
                //   child: ListView(
                //     padding: EdgeInsets.all(5),
                //     children: <Widget>[
                //       UserAccountsDrawerHeader(
                //         decoration: BoxDecoration(color: Colors.black54),
                //         accountName: Text(ud!.userid.toString()),
                //         accountEmail: Text('${FirebaseAuth.instance.currentUser!.email}'),
                //         currentAccountPicture: CircleAvatar(
                //           radius: 20.0,
                //           backgroundColor: Colors.white,
                //           child: Text(
                //             '${ud.userid}',
                //             style: TextStyle(fontSize: 40.0,color: Colors.black54),
                //           ),
                //         ),
                //       ),
                //       ListTile(
                //         leading: Icon(Icons.account_circle_outlined), title: Text("Sign in"),
                //         onTap: () {Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //             builder: (context) => wrapper(),
                //           ),
                //         );
                //         },
                //       ),
                //       ListTile(
                //         leading: Icon(Icons.edit), title: Text("Change Username"),
                //         onTap: () {
                //           _showSettingsPanel();
                //         },
                //       ),
                //     ],
                //   ),
                // ),
              ),
            );
          } else {
            return Loading();
          }
        },
      );
    } else {
      return Material(
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(5),
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('assets/splash.jpg'),
              ),
              ListTile(
                leading: Icon(Icons.account_circle_outlined),
                title: Text("Sign in"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => wrapper(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text("Change User Id"),
                onTap: () {
                  // _showSettingsPanel();
                },
              ),
            ],
          ),
        ),
      );
    }
  }
}

// Scaffold(
//         appBar: AppBar(
//             backgroundColor: Colors.white,
//             elevation: 0.0,
//             title: Text(
//               'Profile',
//               style: TextStyle(color: Colors.black, letterSpacing: 1.5),
//             ),
//             centerTitle: true,
//             actions: []),
//         body: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             //crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: 20.0,
//               ),
//               Center(
//                 child: Stack(
//                   children: [
//                     CircleAvatar(
//                       radius: 75,
//                       backgroundColor: Colors.grey.shade200,
//                       child: CircleAvatar(
//                         radius: 70,
//                         backgroundImage: AssetImage('assets/splash.jpg'),
//                       ),
//                     ),
//                     Positioned(
//                       bottom: 1,
//                       right: 1,
//                       child: Container(
//                         child: Padding(
//                           padding: const EdgeInsets.all(5.0),
//                           child: Icon(Icons.edit, color: Colors.black),
//                         ),
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                               width: 3,
//                               color: Colors.white,
//                             ),
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(
//                                 50,
//                               ),
//                             ),
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                 offset: Offset(2, 4),
//                                 color: Colors.black.withOpacity(
//                                   0.3,
//                                 ),
//                                 blurRadius: 3,
//                               ),
//                             ]),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   'Shrisha Shrestha',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
//                 ),
//               ),
//               Text(
//                 'shrishashrestha101@gmail.com',
//                 style: TextStyle(letterSpacing: 1.5),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               TextButton(
//                 style: ButtonStyle(
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                       RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(18.0),
//                           side: BorderSide(
//                               color: Colors.black.withOpacity(0.2)))),
//                   backgroundColor: MaterialStatePropertyAll<Color>(
//                       Colors.amber.withOpacity(0.5)),
//                 ),
//                 onPressed: () {},
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Text(
//                     'Edit Profile',
//                     style: TextStyle(fontSize: 15, color: Colors.black),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
//                 child: Container(
//                   decoration: new BoxDecoration(
//                     borderRadius: new BorderRadius.circular(10.0),
//                     color: Colors.white,
//                     boxShadow: [
//                       new BoxShadow(
//                           color: Colors.grey,
//                           blurRadius: 3.0,
//                           offset: new Offset(1.0, 1.0))
//                     ],
//                   ),
//                   child: ListTile(
//                     leading: CircleAvatar(
//                         radius: 16.0,
//                         backgroundColor: Colors.amber.withOpacity(0.5),
//                         child: Icon(
//                           Icons.android,
//                           size: 16.0,
//                           color: Colors.black,
//                         )),
//                     title: Text('About App'),
//                     trailing: Icon(
//                       Icons.arrow_forward_ios,
//                       size: 15.0,
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8.0),
//                 child: Container(
//                   decoration: new BoxDecoration(
//                     borderRadius: new BorderRadius.circular(10.0),
//                     color: Colors.white,
//                     boxShadow: [
//                       new BoxShadow(
//                           color: Colors.grey,
//                           blurRadius: 3.0,
//                           offset: new Offset(1.0, 1.0))
//                     ],
//                   ),
//                   child: ListTile(
//                     onTap: () async {
//                       await _auth.signout();
//                     },
//                     leading: CircleAvatar(
//                         radius: 16.0,
//                         backgroundColor: Colors.amber.withOpacity(0.5),
//                         child: Icon(
//                           Icons.logout,
//                           size: 15.0,
//                           color: Colors.black,
//                         )),
//                     title: Text('Log Out'),
//                     // trailing: Icon(Icons.more_vert),
//                   ),
//                 ),
//               )
//             ]),
//       ),
