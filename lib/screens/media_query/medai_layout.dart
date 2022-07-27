import 'package:flutter/material.dart';

class MediaLayoutScreen extends StatefulWidget {
  MediaLayoutScreen({Key? key}) : super(key: key);

  @override
  State<MediaLayoutScreen> createState() => _MediaLayoutScreenState();
}

class _MediaLayoutScreenState extends State<MediaLayoutScreen> {
  gridViewForPhone(Orientation orientation) {
    return GridView.count(
      crossAxisCount: 2,
      childAspectRatio: 1.0,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: List.generate(100, (index) {
        return Card(
          child: Container(
            alignment: Alignment.center,
            color: Colors.red,
            child: Text('$index'),
          ),
        );
      }),
    );
  }

  gridViewForTablet(Orientation orientation) {
    return GridView.count(
      crossAxisCount: orientation == Orientation.portrait ? 4 : 6,
      childAspectRatio: 1.0,
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: List.generate(100, (index) {
        return Card(
          child: Container(
            alignment: Alignment.center,
            color: Colors.red,
            child: Text('$index'),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600.0;
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text('Media Layout Grid'),
      ),
      body: useMobileLayout
          ? gridViewForPhone(orientation)
          : gridViewForTablet(orientation),
    );
  }
}
