import 'package:flutter/material.dart';
import 'package:flutter_stock_v3/screens/home/dashboard_screen.dart';
import 'package:flutter_stock_v3/screens/login/login_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  "/login": (BuildContext context) => LoginScreen(),
  "/dashboard": (BuildContext context) => DashboardScreen(),
  // "/register": (BuildContext context) => RegisterScreen(),
  // "/about": (BuildContext context) => AboutScreen(),
  // "/contact": (BuildContext context) => ContactScreen(),
  // "/term": (BuildContext context) => TermScreen(),

  // "/addproduct": (BuildContext context) => AddProductScreen(),
};
