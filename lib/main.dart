import 'package:animated_align/images.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff569fe1),
        primaryColorLight: Color(0xfff9f769),
        accentColor: Color(0xfffb6262),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = 'AnimatedAlign';

  static const _alignments = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomLeft,
    Alignment.bottomRight,
  ];

  var _index = 0;
  AlignmentGeometry get _alignment => _alignments[_index % _alignments.length];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            AnimatedAlign(
              alignment: _alignment,
              duration: Duration(seconds: 2),
              curve: Curves.easeIn,
              child: Stack(
                children: [
                  SizedBox(
                    width: 200.0,
                    height: 200.0,
                    child: Image(
                      image: AssetImage(car),
                    ),
                  ),
                ],
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  _index++;
                });
              },
              elevation: 0.0,
              backgroundColor: Color(0xfff6e062),
              tooltip: 'Play',
              heroTag: 'Align',
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 36.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
