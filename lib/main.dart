
import 'package:flutter/material.dart';
import 'package:news/providers/settings_provider.dart';
import 'package:news/screens/home/home_screen.dart';
import 'package:news/screens/home/my_theme.dart';
import 'package:news/screens/home/tabs/news/article_details_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(ChangeNotifierProvider(
      create:(_) => SettingsProvider() ,
      child: MyApp()));
}
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routName :(context) => HomeScreen(),
        ArticleDetails.routeName:(context)=>ArticleDetails()
      },
      initialRoute: HomeScreen.routName,
      theme: MyTheme.light,
     supportedLocales: [Locale("ar"),Locale("en")],
     locale: Locale(Provider.of<SettingsProvider>(context).currentLocale),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      themeMode: Provider.of<SettingsProvider>(context).currentMode,
    );
  }

}
