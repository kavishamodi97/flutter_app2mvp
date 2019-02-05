import 'package:flutter/material.dart';
import 'package:flutter_app2/Addpage/Add_name.dart';
import 'package:flutter_app2/Dependency_Injection.dart';
import 'package:flutter_app2/Homepage/Myhomepage.dart';
import 'package:flutter_app2/Local/Localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  DependencyInjector.configure(Choice.PRODTESTING);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale('en'), Locale('es'), Locale('ja')],
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context).title,

      title: 'Baby Names',
      initialRoute: '/',
      routes: {
        // When we navigate to the "/" route, build the FirstScreen Widget
        '/': (context) => MyHomePage(),
        // When we navigate to the "/second" route, build the SecondScreen Widget
        '/second': (context) => Anothername(),
      },
      //onGenerateRoute: generateRoute,
      navigatorKey: key,
      // home: MyHomePage(),
    );
  }
}
