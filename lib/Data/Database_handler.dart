import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/Data/Database_Helper.dart';
import 'package:flutter_app2/model/Record_data.dart';

class DatabaseHandler implements DatabaseHelper{
  @override
  void deleteData(String docId) async {
    try {
      print(docId);
      var document = Firestore.instance.collection('baby').document(docId);
      await document.delete().then((result) {
        print('in delete data');
      });
    } catch (error) {
      print('error:$error');
    } //Firestore.instance.collection('baby').document(Firestore.i).
  }

  @override
  void AddData(String name) async {
    var document = Firestore.instance.collection('baby').document();
    var map = new Map<String, dynamic>();
    map['name'] = name;
    map['votes'] = 0;
    return await document.setData(map);
  }

  @override
  Future<QuerySnapshot> fetchdata() async{

    return await Firestore.instance.collection('baby').getDocuments();

  }


  @override
  void updatedata(Record record) {
    Firestore.instance.runTransaction((transaction) async {
      final freshSnapshot = await transaction.get(record.reference);
      final fresh = Record.fromSnapshot(freshSnapshot);
      await transaction.update(record.reference, {'votes': fresh.votes + 1});
    });
  }

}
