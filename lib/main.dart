import 'package:flutter/material.dart';
import 'package:untitled3/core/theme/aplication_theme.dart';
import 'package:untitled3/moduls/Quran/widget/Quran_detalisview.dart';
import 'package:untitled3/moduls/splash_screen.dart';

import 'layout/Home_Layout.dart';
import 'moduls/Hadeth/Hadethdetalis.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const Myapplication());
}

class Myapplication extends StatelessWidget {
  const Myapplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Applicationtheme.lightTheme,
      darkTheme: Applicationtheme.darkTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      initialRoute: Splashscreen.routeName,
      routes: {
        Splashscreen.routeName: (context) => const Splashscreen(),
        HomeLayout.routeName: (context) => const HomeLayout(),
        Quranditails.routeName: (context) => const Quranditails(),
        Hadethdetalis.routeName: (context) => const Hadethdetalis(),
      },
    );
  }
}
