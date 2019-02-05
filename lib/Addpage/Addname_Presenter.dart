import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app2/Data/Database_Helper.dart';
import 'package:flutter_app2/Data/Database_handler.dart';
import 'package:flutter_app2/Dependency_Injection.dart';
import 'package:flutter_app2/model/Record_data.dart';

abstract class AddviewContact {
  void showSnackbar(String s);

}

abstract class AddPresenterContact {
  void addName(String name);

}


class AddnamePresenter implements AddPresenterContact {
  AddviewContact _view;
  DatabaseHelper databaseHelper;


  AddnamePresenter(this._view){
    databaseHelper = new DependencyInjector().databasehelper;
  }

  void addName(String name) {
    databaseHelper.AddData(name);
    _view.showSnackbar('Successfully Added');
  }
}
