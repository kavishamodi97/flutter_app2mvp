import 'package:flutter/material.dart';
import 'package:flutter_app2/main.dart';
import 'package:flutter_app2/Local/Localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main()
{
  MaterialApp app = MaterialApp(
    localizationsDelegates: [
      AppLocalizationsDelegate(),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ],
    supportedLocales: [Locale('en'),Locale('es'),Locale('ja')],
    home: Column(
      children: <Widget>[
        Text('Baby Name Votes'),
      ],
    ),
  );

  testWidgets('Localization Testing', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    await tester.pumpAndSettle();
    expect(find.text('Baby Name Votes'), findsOneWidget);
  });
}

