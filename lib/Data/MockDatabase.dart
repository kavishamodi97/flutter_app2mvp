import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app2/Data/Database_Helper.dart';
import 'package:flutter_app2/model/Record_data.dart';

class MockDatabase implements DatabaseHelper{
  @override
  void AddData(String name) {
    // TODO: implement AddData
  }

  @override
  void deleteData(String docId) {
    // TODO: implement deleteData
  }

  @override
  Future<QuerySnapshot> fetchdata() {
    // TODO: implement fetchdata
    return null;
  }

  @override
  void updatedata(Record record) {
    // TODO: implement updatedata
  }

}