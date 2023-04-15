import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DatabaseService {
  final String? uid;

  DatabaseService({this.uid});

  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection('Users');

  Future updateid(int? id) async {
    return await usercollection.doc(uid).set({
      'id': id,
    });
  }

  Stream<currentuserid> get current {
    return usercollection.doc(uid).snapshots().map(_idupdater);
  }

  currentuserid _idupdater(DocumentSnapshot snapshot) {
    return currentuserid(
      uid: uid,
      userid: snapshot.get('id'),
    );
  }
}

class currentuserid {
  final String? uid;
  final int userid;
  currentuserid({this.uid, required this.userid});
}

