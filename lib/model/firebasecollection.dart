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

class CurrentMyrecipe {
  final String? fid;
  final List? mrecipes;
  CurrentMyrecipe({this.fid, this.mrecipes});
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
  final CollectionReference myrecipecollection =
      FirebaseFirestore.instance.collection('MyRecipe');

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

  Future updatemyrecipe(List? mrecipes) async {
    final data = {'myrecipes': mrecipes};
    return await myrecipecollection.doc(fid).set(data);
  }

  // Future updatemyrecipe(
  //     String Name,
  //     String Description,
  //     String Image,
  //     String Servings,
  //     String PrepTime,
  //     String CookTime,
  //     String Ingredients,
  //     String Instructions) async {
  //   return await myrecipecollection.doc(fid).set({
  //     'Name': Name,
  //     'Description': Description,
  //     'Image': Image,
  //     'Servings': Servings,
  //     'PrepTime': PrepTime,
  //     'CookTime': CookTime,
  //     'Ingredients': Ingredients,
  //     'Instructions': Instructions,
  //   });
  // }

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

  Stream<CurrentMyrecipe> get current_mrecipe {
    return myrecipecollection.doc(fid).snapshots().map(_mrecipeupdater);
  }

  CurrentMyrecipe _mrecipeupdater(DocumentSnapshot snapshot) {
    return CurrentMyrecipe(fid: fid, mrecipes: snapshot.get('myrecipes'));
  }
}
