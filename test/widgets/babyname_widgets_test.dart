import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_app2/main.dart';
import 'package:flutter_app2/Homepage/Myhomepage.dart';
import 'package:path/path.dart';
import 'package:flutter_app2/Addpage/Add_name.dart';


void main() {
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  testWidgets("To Display Floatting Button", (WidgetTester tester) async {
    //BuildContext context;
    bool didPressButton = false;
        await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                didPressButton = true;
                //navigatorKey.currentState.pushNamed('/second');

              }

          ),
        ),
      ),
    );

    expect(didPressButton, isFalse);
    await tester.tap(find.byType(Icon));
    expect(didPressButton, isTrue);
  });


  testWidgets('Floating Action Button tooltip', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: null,
            tooltip: 'Add a more item',
            child: Icon(Icons.add),
          ),
        ),
      ),
    );

    await tester.tap(find.byType(Icon));
    expect(find.byTooltip('Add a more item'), findsOneWidget);
  });


   testWidgets('Can navigator navigate to and from a stateful widget', (
      WidgetTester tester) async {
    final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
      '/': (BuildContext context) => MyHomePage(),
      '/second': (BuildContext context) => Anothername(),
    };

    await tester.pumpWidget(MaterialApp(routes: routes));
    expect(find.text('hi'), findsNothing);
    expect(find.text('hello', skipOffstage: false), findsNothing);
  });
}
