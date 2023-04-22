import 'package:cloud_firestore/cloud_firestore.dart';

class Currentuserid {
  final String? fid;
  final int userid;
  Currentuserid({this.fid, required this.userid});
}

class Currentbook {
  final String? fid;
  final List? favs;
  Currentbook({this.fid, this.favs});
}

class Currentpinfo {
  final String? fid;
  final String name;
  Currentpinfo({this.fid, required this.name});
}

class DatabaseService {
  final String? fid;
  DatabaseService({this.fid});

  final CollectionReference usercollection =
      FirebaseFirestore.instance.collection('Users');
  final CollectionReference cookbookcollection =
      FirebaseFirestore.instance.collection('CookBook');
  final CollectionReference personalinfocollection =
      FirebaseFirestore.instance.collection('Personal_Info');

  Future updateid(int? id) async {
    return await usercollection.doc(fid).set({'id': id});
  }

  Future updatecookbook(List? favs) async {
    final data = {'favs': favs};
    return await cookbookcollection.doc(fid).set(data);
  }

  Future updatepersonalinfo(String Name) async {
    return await personalinfocollection.doc(fid).set({'Name': Name});
  }

  Stream<Currentuserid> get currentID {
    return usercollection.doc(fid).snapshots().map(_idupdater);
  }

  Currentuserid _idupdater(DocumentSnapshot snapshot) {
    return Currentuserid(fid: fid, userid: snapshot.get('id'));
  }

  Stream<Currentbook> get currentbook {
    return cookbookcollection.doc(fid).snapshots().map(_bookupdater);
  }

  Currentbook _bookupdater(DocumentSnapshot snapshot) {
    return Currentbook(fid: fid, favs: snapshot.get('favs'));
  }

  Stream<Currentpinfo> get current_pinfo {
    return personalinfocollection.doc(fid).snapshots().map(_pinfoupdater);
  }

  Currentpinfo _pinfoupdater(DocumentSnapshot snapshot) {
    return Currentpinfo(fid: fid, name: snapshot.get('Name'));
  }
}
