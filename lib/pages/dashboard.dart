import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/FId_Bloc/fid_cubit.dart';
import '../Splash/loading.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, required this.fid});
  final String fid;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  String email = " ";

  Future<List<String>> getAllUserIds() async {
    List<String> userIds = [];
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Users')
          .get(); 
          // or use FirebaseDatabase.instance.reference().child('users').once()
      snapshot.docs.forEach((doc) {
        userIds.add(doc.id);
      });
    } catch (e) {
      print(e.toString());
    }
    return userIds;
  }

  @override
  void initState() {
    future = getAllUserIds();
    super.initState();
  }

  Future<List<String>>? future;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Image.asset(
                'assets/fire.jpg',
                width: 50.0,
                height: 50.0,
              ),
              Text(
                'Dashboard',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              IconButton(
                  onPressed: () {
                    context.read<FireidCubit>().logout();
                  },
                  icon: Icon(Icons.logout_rounded))
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Firebase ID: \n${widget.fid}',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w400, fontSize: 15),
          ),
          FutureBuilder(
              future: future,
              builder:
                  (BuildContext ctx, AsyncSnapshot<List<String>?> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  Text('Waiting');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    // return Text(snapshot.data.toString());
                    return Expanded(
                      child: ListView.builder(
                          // physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.length,
                          itemBuilder: ((context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  snapshot.data![index],
                                ),
                                SizedBox(
                                  height: 10.0,
                                )
                              ],
                            );
                          })),
                    );
                  } else if (snapshot.hasError) {
                    return Text('error');
                  } else {
                    return Loading();
                  }
                }
                return CircularProgressIndicator();
              }),
        ]),
      ),
    ));
  }
}
