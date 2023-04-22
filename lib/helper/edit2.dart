import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:recipe/Bloc/UserId_Bloc/userid_cubit.dart';
import '../Bloc/PInfo_Bloc/pinfo_cubit.dart';
import '../model/firebasecollection.dart';

import 'package:recipe/model/Storagemodel.dart';
import '../authentication/authenticationServices.dart';

class change2 extends StatefulWidget {
  change2({super.key, required this.nameclass});
  final Currentpinfo? nameclass;

  @override
  State<change2> createState() => _change2State();
}

class _change2State extends State<change2> {
  String? name;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Currentpinfo? user = widget.nameclass;
    if (user != null) {
      return BlocBuilder<PinfoCubit, Stream<Currentpinfo?>?>(
        builder: (context, state) {
          return StreamBuilder(
            stream: state,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Currentpinfo? ud = snapshot.data;
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 18.0,
                        ),
                        TextFormField(
                          initialValue: ud!.name.toString(),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter a name' : null,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            labelText: 'Name',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          onChanged: (val) {
                            setState(() => name = val);
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Update',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                          ),
                          onPressed: () async {
                            if (_formkey.currentState!.validate()) {
                              // await DatabaseService(fid: user.fid)
                              //     .updateid(id ?? ud.userid);
                              context
                                  .read<PinfoCubit>()
                                  .changename(name ?? ud.name);
                              Navigator.pop(context);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Text('error');
              }
            },
          );
        },
      );
    } else {
      return Text('Sign in first');
    }
  }
}
