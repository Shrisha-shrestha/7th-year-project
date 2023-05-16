import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:recipe/Bloc/UserId_Bloc/userid_cubit.dart';
import '../model/firebasecollection.dart';

import 'package:recipe/model/Storagemodel.dart';
import '../authentication/authenticationServices.dart';

class changeid extends StatefulWidget {
  changeid({super.key, required this.idclass});
  final Currentuserid? idclass;

  @override
  State<changeid> createState() => _changeidState();
}

class _changeidState extends State<changeid> {
  int? id;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Currentuserid? user = widget.idclass;
    if (user != null) {
      return BlocBuilder<UseridCubit, Stream<Currentuserid?>?>(
        builder: (context, state) {
          return StreamBuilder(
            stream: state,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                Currentuserid? ud = snapshot.data;
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
                          initialValue: ud!.userid.toString(),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter a id' : null,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor),
                            ),
                            labelText: 'ID',
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                          onChanged: (val) {
                            setState(() => id = int.parse(val));
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
                              await DatabaseService(fid: user.fid)
                                  .updateid(id ?? ud.userid);
                              // context
                              //     .read<UseridCubit>()
                              //     .changeid(id ?? ud.userid);

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
