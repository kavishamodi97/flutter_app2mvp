import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app2/Data/Database_handler.dart';
import 'package:flutter_app2/model/Record_data.dart';
import 'package:path/path.dart';

abstract class viewpagecontact {
  void showSnackbar(String s);

  void showRecords(List<Record> records);
//Widget linerProgessindicator();
}

abstract class PresenterContract {
  void deleteData(Record record);

  void fetchData();

  void updateData(Record record);
}

class babynamePresenter implements PresenterContract {
  viewpagecontact _view;

  DatabaseHandler databaseHepler = new DatabaseHandler();

  babynamePresenter(this._view);

  void deleteData(Record record) {
    print('before delete');
    databaseHepler.deleteData(record.reference.documentID);
    _view.showSnackbar('Successfully deleted');
    print('after delete');
  }

  void fetchData() {
    Future<QuerySnapshot> querysnapshot = databaseHepler.fetchdata();

    print('inside fetchdata');

    List<DocumentSnapshot> snapshot = new List<DocumentSnapshot>();
    List<Record> records = new List<Record>();
    print('after snapshot');
    querysnapshot.then((query) {
      snapshot = query.documents;
      print(snapshot.length);
      print('before Records');
      for (DocumentSnapshot doc in snapshot) {
        records.add(Record.fromSnapshot(doc));
      }
      print('before view');
      _view.showRecords(records);
      print('after view');
    });
  }

  void updateData(Record record) {
    databaseHepler.updatedata(record);
  }

  currentState() {}
}
