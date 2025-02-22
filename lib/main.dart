import 'package:flutter/material.dart';
import 'package:funfact_app/mainScreen.dart';
import 'package:funfact_app/provider/themeProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => Themeprovider(),
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<Themeprovider>(context, listen: false).loadMode();
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<Themeprovider>(context);
    return MaterialApp(
        theme: themeProvider.isDarkModeChecked
            ? ThemeData.dark(useMaterial3: true)
            : ThemeData.light(useMaterial3: true),
        home: Mainscreen());
  }
}
