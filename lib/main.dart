import 'package:flutter/material.dart';
import 'package:flutter_stock_v3/routes.dart';
import 'package:flutter_stock_v3/themes/styles.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.of(context).locale,
      // builder: DevicePreview.appBuilder,
      theme: appTheme(),
      initialRoute: '/login',
      routes: routes,
    );
  }
}
