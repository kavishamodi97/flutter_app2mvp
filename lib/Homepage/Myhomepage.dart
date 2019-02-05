import 'package:flutter/material.dart';
import 'package:flutter_app2/Addpage/Add_name.dart';
import 'package:flutter_app2/Homepage/Babyname_Presenter.dart';
import 'package:flutter_app2/Local/Localizations.dart';
import 'package:flutter_app2/model/Record_data.dart';
import 'package:flutter_app2/main.dart';

class MyHomePage extends StatefulWidget {
  static const navigateToDetailsButtonKey = Key('navigateToDetails');
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }

  currentState() {}
}

class _MyHomePageState extends State<MyHomePage> implements viewpagecontact {
  String popResult;

  //StreamSubscription streamSubscription;
  //static const navigateToDetailsButtonKey = Key('navigateToDetails');
  babynamePresenter _presenter;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _isloading;
  List<Record> _records = new List<Record>();

  _MyHomePageState() {
    _presenter = new babynamePresenter(this);
    //static const navigateToDetailsButtonKey = Key('navigateToDetails');
  }

  void navigateToDetailsPage(BuildContext context) async {
    final route = MaterialPageRoute(builder: (_) => Anothername());
    final result = await Navigator.of(context).push(route);

    setState(() {
      popResult = result;
    });
  }

  void initState() {
    super.initState();
    _isloading = true;
    //streamSubscription = Bloc.of(context).myStream.listen((value) {
    //build(context);
    //print(value);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey =
        new GlobalKey<NavigatorState>();
    _presenter.fetchData();
    return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context).title)),
        body: _isloading
            ? new Center(
                child: new CircularProgressIndicator(),
              )
            : _buildBody(context),
        key: scaffoldKey,
        floatingActionButton: FloatingActionButton(
          key: MyHomePage.navigateToDetailsButtonKey,
          onPressed: () {
            navigateToDetailsPage(context);
            Text('Pop result: $popResult');
            //navigatorKey.currentState.pushNamed('/second');
          },
          child: Icon(Icons.add),
          tooltip: 'Add one more item',
        ));
  }

  Widget _buildBody(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: _records.map((data) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Record record) {
    print('inside _buildlistitem');

    return Padding(
      key: ValueKey(record.name),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(record.name),
          subtitle: Text(record.votes.toString()),
          onTap: () {
            _presenter.updateData(record);
          },
          trailing: GestureDetector(
              child: Icon(
                Icons.delete,
                color: Colors.indigoAccent,
              ),
              onTap: () {
                _AlertDialoge(context, record);
              }),
        ),
      ),
    );
  }

  void _AlertDialoge(BuildContext context, Record record) {
    var alert = AlertDialog(
      title: Text(AppLocalizations.of(context).alertTitle),
      actions: <Widget>[
        FlatButton(
          child: Text(AppLocalizations.of(context).okButton),
          onPressed: () {
            Navigator.pop(context);
            _presenter.deleteData(record);
          },
        ),
        FlatButton(
          child: Text(AppLocalizations.of(context).cancelButton),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
      //content:
    );

    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  @override
  void showSnackbar(String s) {
    scaffoldKey.currentState.showSnackBar(new SnackBar(
      content: new Text(s),
    ));
  }

  @override
  void showRecords(List<Record> records) {
    setState(() {
      _records = records;
      _isloading = false;
    });
  }
}

void _processIndicator(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    child: new Dialog(
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          new CircularProgressIndicator(),
          new Text("Process running"),
        ],
      ),
    ),
  );
}
