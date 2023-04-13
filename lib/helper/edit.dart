import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/firebasecollection.dart';

import 'package:recipe/model/Storagemodel.dart';
import '../authentication/authenticationServices.dart';


class change extends StatefulWidget {
    @override
  State<change> createState() => _changeState();
}

class _changeState extends State<change> {

  int? id;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Userid? user =Provider.of<Userid?>(context);
    if(user!=null){
      return StreamBuilder<currentuserid>(
        stream: DatabaseService(uid: user.uid).current,
        builder: (context,snapshot){
          if(snapshot.hasData){
            currentuserid? ud = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Form(
                key:_formkey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 18.0,),
                    TextFormField(
                      initialValue: ud!.userid.toString(),
                      validator:(val)=> val!.isEmpty ? 'Enter a name': null,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide( color: Theme.of(context).primaryColor),
                        ),
                        labelText: 'ID',
                        labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onChanged: (val){
                        setState(()=>id =int.parse(val));
                      },
                    ),
                    SizedBox(height: 20.0,),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Update',style: TextStyle(fontSize: 20.0,color: Colors.white),),
                      ),
                      onPressed: ()async{
                        if(_formkey.currentState!.validate()) {
                          await DatabaseService(uid: user.uid).updateid(
                              id  ?? ud.userid
                              );
                          Navigator.pop(context);
                        }
                      },
                    ),

                  ],
                ),
              ),
            );
          }
          else { return Text('error');}
        },

      );
    }
    else{
      return Text('Sign in first');
    }
  }
}
