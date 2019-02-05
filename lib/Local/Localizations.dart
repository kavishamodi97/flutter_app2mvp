import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app2/l10n/messages_all.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        (locale.countryCode == null) ? locale.languageCode : locale.toString();
    final String finalname = Intl.canonicalizedLocale(name);

    return initializeMessages(finalname).then((bool _) {
      Intl.defaultLocale = finalname;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations);

  String get title => Intl.message('Baby Name Votes',
      name: 'title', desc: 'Title of the Application');

  String get alertTitle {
    return Intl.message('Are you sure?', name: 'alertTitle');
  }

  String get addButton {
    return Intl.message('Add', name: 'addButton');
  }

  String get clearButton {
    return Intl.message('Clear', name: 'clearButton');
  }

  String get okButton {
    return Intl.message('Ok', name: 'okButton');
  }

  String get cancelButton => Intl.message('Cancel', name: 'cancelButton');
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ja', 'es'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
