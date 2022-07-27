// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stock_v3/screens/home/dashboard_screen.dart';
import 'package:flutter_stock_v3/screens/home/home_screen.dart';
import 'package:flutter_stock_v3/screens/login/login_screen.dart';
import 'package:flutter_stock_v3/screens/media_query/medai_layout.dart';
import 'package:flutter_stock_v3/screens/media_query/media_query.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/": (BuildContext context) => LoginScreen(),
  "/login": (BuildContext context) => LoginScreen(),
  "/dashboard": (BuildContext context) => DashboardScreen(),
  // "/register": (BuildContext context) => RegisterScreen(),
  // "/about": (BuildContext context) => AboutScreen(),
  // "/contact": (BuildContext context) => ContactScreen(),
  // "/term": (BuildContext context) => TermScreen(),

  // "/addproduct": (BuildContext context) => AddProductScreen(),
};
