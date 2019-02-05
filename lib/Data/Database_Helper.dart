

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app2/model/Record_data.dart';

abstract class DatabaseHelper{
  void deleteData(String docId);
  Future<QuerySnapshot> fetchdata();
  void updatedata(Record record);
  void AddData(String name);
}