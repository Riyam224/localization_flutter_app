// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_app/generated/l10n.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MultiLangApp());
}

class MultiLangApp extends StatelessWidget {
  const MultiLangApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar'),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      // todo
      home: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(
            S.of(context).title,
            style: const TextStyle(
              color: Colors.white,
            ),
          )),
      body: Row(
        children: [
          Text(
            S.of(context).hello,
            style: const TextStyle(fontSize: 30),
          ),
          Padding(
            padding: EdgeInsets.only(
              // todo
              left: isArabic() ? 0 : 16,
              right: isArabic() ? 16 : 0,
              //
            ),
            child: Text(
              S.of(context).yoora,
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}

// todo
bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}

// This widget is the root of your application.
