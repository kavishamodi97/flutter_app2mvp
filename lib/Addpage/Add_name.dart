

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/Local/Localizations.dart';
import 'package:flutter_app2/Addpage/Addname_Presenter.dart';
import 'package:flutter_app2/Homepage/Babyname_Presenter.dart';
import 'package:flutter_app2/Homepage/Myhomepage.dart';
import 'package:flutter_app2/main.dart';

class Anothername extends StatefulWidget {
 // final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  static const popWithResultButtonKey = Key('popWithResult');

  State<StatefulWidget> createState() => Addname();
}

class Addname extends State<Anothername> implements AddviewContact {
//  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  static const popWithResultButtonKey = Key('popWithResult');
  @override
  AddnamePresenter _presenter;
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  Addname() {
    _presenter = new AddnamePresenter(this);
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("test nn")),
      body: _BuildName(context),
      key: scaffoldKey,

    );
  }

  Widget _BuildName(BuildContext context) {
    final TextEditingController namecontroller = TextEditingController();

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: namecontroller,
            decoration: InputDecoration.collapsed(
                filled: true, hintText: "Add a new name"),
          ),
          SizedBox(height: 20.0),
          ButtonBar(
            children: <Widget>[
              RaisedButton(
                key: popWithResultButtonKey,
                child: Text("addButton"),
                onPressed: () {
                  _presenter.addName(namecontroller.text);
                  Navigator.pop(context);
                  namecontroller.clear();
                },
              ),
              RaisedButton(
                key: popWithResultButtonKey,
                child: Text("clearButton"),
                onPressed: () {
                  Navigator.pop(context);
                  namecontroller.clear();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  void showSnackbar(String s) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(s),
    ));
  }
}
