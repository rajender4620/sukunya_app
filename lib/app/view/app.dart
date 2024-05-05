import 'package:flutter/material.dart';
import 'package:sukunya/homepage/view/homepage_view.dart';
import 'package:sukunya/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          dialogBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(color: Colors.white),
          colorScheme: ColorScheme.fromSwatch(
            accentColor: Colors.white,
          ),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const FirstScreen(),
      ),
    );
  }
}
