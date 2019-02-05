
import 'package:flutter_app2/Data/Database_Helper.dart';
import 'package:flutter_app2/Data/Database_handler.dart';
import 'package:flutter_app2/Data/MockDatabase.dart';

enum Choice{MOCKTESTING ,PRODTESTING}

class DependencyInjector{
  static final DependencyInjector _Singlton = new DependencyInjector._internal();
  static Choice _choice;

  static void configure(Choice choice){
    _choice=choice;
  }

  factory DependencyInjector(){
    return _Singlton;
  }

  DependencyInjector._internal();

  DatabaseHelper get databasehelper{
    switch(_choice){
      case Choice.MOCKTESTING:
        return new MockDatabase();
      default:
        return new DatabaseHandler();
    }
  }

}