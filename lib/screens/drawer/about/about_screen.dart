import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'เกี่ยวกับเรา',
          style: GoogleFonts.kanit(),
        ),
      ),
      body: Center(
        child: Text('เนื้อหาหน้าเกี่ยวกับเรา'),
      ),
    );
  }
}
