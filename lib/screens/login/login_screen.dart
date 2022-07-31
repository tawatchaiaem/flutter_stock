import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stock_v3/services/rest_api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_stock_v3/themes/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email, password;

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            'Tawatchai',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEmailRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: mailController,
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: appTheme().primaryColor,
            ),
            labelText: 'E-mail'),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.lock,
            color: appTheme().primaryColor,
          ),
          labelText: 'Password',
        ),
      ),
    );
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextButton(
          onPressed: () {},
          child: Text(
            "Forgot Password",
            style: TextStyle(color: appTheme().primaryColor),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: ElevatedButton(
            style: style,
            onPressed: _login,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildOrRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            '- OR -',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSocialBtnRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: appTheme().primaryColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0)
              ],
            ),
            child: Icon(
              FontAwesomeIcons.facebookF,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0)
              ],
            ),
            child: Icon(
              FontAwesomeIcons.google,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  // การรวม Widget ด้านบนทั้งหมดเข้ามา
  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6 + 200,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ],
                ),
                _buildEmailRow(),
                _buildPasswordRow(),
                _buildForgetPasswordButton(),
                _buildLoginButton(),
                _buildOrRow(),
                _buildSocialBtnRow()
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Alert Dialog
  showAlertDialog(BuildContext context, String msg) {
    AlertDialog alert = AlertDialog(
      title: Text('Login Status'),
      content: Text(msg),
      actions: <Widget>[
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'))
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

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
                          _buildLogo(),
                          _buildContainer(),
                        ],
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    // สร้างตัวเก็บ SharedPreferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    // แสดง Loading
    setState(() {
      _isLoading = true;
    });

    // รับค่ามาเก็บลอง list
    var userData = {
      'email': mailController.text,
      'password': passwordController.text
    };

    // CALL API
    var response = await CallAPI().postData(userData, 'login');
    var body = json.decode(response.body);
    print(body);

    if (body['success']) {
      setState(() {
        _isLoading = false;
      });
      print('Login success');

      showAlertDialog(context, 'Login Success');

      // sharedPreferences
      sharedPreferences.setString('storeName', body['data']['name']);
      sharedPreferences.setString('storeEmail', body['data']['email']);

      Navigator.pushNamed(context, '/dashboard');
    } else {
      setState(() {
        _isLoading = false;
      });
      print('Login fail');
      showAlertDialog(context, 'Login Fail!');
    }
  }
}
