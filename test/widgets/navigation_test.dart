import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_app2/Homepage/Myhomepage.dart';
import 'package:flutter_app2/Addpage/Add_name.dart';
import 'package:flutter_app2/main.dart';
import 'package:flutter_app2/Local/Localizations.dart ' show AppLocalizations;
import 'package:path/path.dart';
import 'package:flutter/foundation.dart';

String get title => Intl.message('Baby Name Votes',
    name: 'title', desc: 'Title of the Application');

class MockNavigatorObserver extends Mock implements NavigatorObserver {
} // Navigation

class MockAppLocalization extends Mock implements AppLocalizations {
} // Applocalization

class Mockapp extends Mock implements AppLocalizations {} // Title

class Mockcon extends Mock implements BuildContext {} // Context

//class MockText extends Mock implements MaterialApp{}


void main() {
  group('Navigation tests', () {
    NavigatorObserver mockObserver;
    AppLocalizations mockLocalisation;
    BuildContext mockContext;
    //MockText mockText;

    setUp(() {
      mockObserver = MockNavigatorObserver();
      mockContext = Mockcon(); // Context
      mockLocalisation = new MockAppLocalization(); // Applocalization
      //mockText = MockText();

    });



    Future<Null> buildMainPage(WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(

        //title: 'Baby Name Votes',


        home: MyHomePage(),

        /// This mocked observer will now receive all navigation events
        /// that happen in our app.
        navigatorObservers: [mockObserver],
      ));

      /// The tester.pumpWidget() call above just built our app widget
      /// and triggered the pushObserver method on the mockObserver once.
      verify(mockObserver.didPush(any, any));
    }


    Future<Null> navigateToDetailsPage(WidgetTester tester) async {
      /// Tap the button which should navigate to the details page.
      /// By calling tester.pumpAndSettle(), we ensure that all animations
      /// have completed before we continue further.
      await tester.tap(find.byKey(MyHomePage.navigateToDetailsButtonKey));
//      await tester.tap(find.byType(Icon));
      await tester.pumpAndSettle();
    }





    testWidgets(
        'when tapping "navigate to details" button, should navigate to details page',
            (WidgetTester tester) async {
          // when(app.title).thenReturn('Baby Name Votes');
          //expect(app.title, "Baby Name Votes");

          when(mockLocalisation.title).thenReturn("title");

          when(mockLocalisation.title).thenReturn('Baby Name Votes');
          // expect(mockLocalisation.title, 'Baby Name Votes');
          // when(app.title).thenThrow(RangeError('hi'));
          //expect(() => app.title, throwsRangeError);

//   when(AppLocalizations.of()).thenReturn();




          await buildMainPage(tester);
          await navigateToDetailsPage(tester);
          await tester.pumpAndSettle();


          /// By tapping the button, we should've now navigated to the details
          /// page. The didPush() method should've been called...
          verify(mockObserver.didPush(any, any));

          /// ...and there should be a DetailsPage present in the widget tree...
          expect(find.byType(Anothername), findsOneWidget);
        });

    /* testWidgets('my first widget test',
  (WidgetTester tester) async {
    await tester.pumpWidget( new StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return new MyHomePage();
        },
    ),
    );
    }); */
  });



}


