import 'package:flutter/material.dart';
import 'package:flutter_stock_v3/themes/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email, password;

  // Loading...
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: _isLoading
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          CircularProgressIndicator(),
                          SizedBox(height: 20),
                          Text('กำลังตรวจสอบข้อมูล')
                        ],
                      ),
                    ),
                  )
                : Stack(
                    children: <Widget>[
                      Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          decoration: BoxDecoration(
                            color: appTheme().primaryColor,
                            borderRadius: BorderRadius.only(
                              bottomLeft: const Radius.circular(70),
                              bottomRight: const Radius.circular(70),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // _buildLogo(),
                          // _buildContainer(),
                        ],
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
    ;
  }
}
