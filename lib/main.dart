import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'data/models/app/index.dart';
import 'ui/screens/index.dart';

void main() => runApp(CherryApp());

/// Builds the app theme & home page
class CherryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeModel()),
        ChangeNotifierProvider(create: (_) => NotificationsModel()),
        ChangeNotifierProvider(create: (_) => ImageModel()),
      ],
      child: Consumer<ThemeModel>(
        builder: (context, model, child) => MaterialApp(
          title: 'SpaceX GO!',
          theme: model.requestTheme(Brightness.light),
          darkTheme: model.requestTheme(Brightness.dark),
          home: StartScreen(),
          debugShowCheckedModeBanner: false,
          routes: <String, WidgetBuilder>{
            '/about': (_) => const AboutScreen(),
            '/settings': (_) => const SettingsScreen(),
          },
          localizationsDelegates: [
            FlutterI18nDelegate(fallbackFile: 'en'),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
        ),
      ),
    );
  }
}
