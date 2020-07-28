import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:manameme/text.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _imageUrlController = TextEditingController();
  TextEditingController _vocabularyController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  String imageurl = '';
  String vocabulary = '';
  String description = '';

  Offset offset = Offset.zero;

  Color textColor1 = Colors.pinkAccent;
  Color textColor2 = Colors.lightGreen;

  GlobalKey<State<StatefulWidget>> scr = GlobalKey();

  @override
  void initState() {
    super.initState();
    _imageUrlController = TextEditingController();
    _vocabularyController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _imageUrlController.dispose();
    _vocabularyController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future takescrshot() async {
    final boundary = scr.currentContext.findRenderObject() as RenderRepaintBoundary;
    final image = await boundary.toImage();
    final byteData = await image.toByteData(format: ImageByteFormat.png);
    final pngBytes = byteData.buffer.asUint8List();
    print(pngBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              const Text(
                'You can set Image URL:',
              ),
              FlatButton(
                onPressed: () {
                  takescrshot();
                },
                child: Text('save'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 30, 60, 10),
                child: TextField(
//                onChanged: (value) {},
                  decoration: const InputDecoration(
                    hintText: 'image url',
                  ),
                  controller: _imageUrlController,
                ),
              ),
              RepaintBoundary(
                key: scr,
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
//                    width: 600,
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(30),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: FittedBox(
                        child: imageurl == ''
                            ? Image.network(
                                'https://2.bp.blogspot.com/-vZRh5cey3yc/WzC-pA4QK8I/AAAAAAABNDw/JObsGPB24p4LNRBSsje-OVP-fzUTX5OFQCLcBGAs/s800/mukiryoku_ojisan.png')
                            : Image.network(
                                imageurl,
                              ),
                      ),
                    ),
                    Container(
                      child: Positioned(
                        left: offset.dx,
                        top: offset.dy,
                        child: GestureDetector(
                            onPanUpdate: (details) {
                              setState(() {
                                offset = Offset(offset.dx + details.delta.dx,
                                    offset.dy + details.delta.dy);
                              });
                            },
                            child: SizedBox(
                              width: 300,
                              height: 300,
                              child: Padding(
                                padding: const EdgeInsets.all(3),
                                child: Center(
                                  child: Text(vocabulary,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 28,
                                          color: textColor1)),
                                ),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RaisedButton(
                        shape: const StadiumBorder(
                          side: BorderSide(color: Colors.black12),
                        ),
                        onPressed: () {
                          setState(() => textColor1 = Colors.black);
                        },
                        child: const Text('BLACK'),
                      ),
                      RaisedButton(
                        onPressed: () {
                          setState(() => textColor1 = Color(
                                  (Random().nextDouble() * 0xFFFFFF).toInt() <<
                                      0)
                              .withOpacity(1));
                        },
                        child: const Text('RANDOM'),
                        color: Colors.lightBlueAccent,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                    child: TextField(
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        hintText: 'Vocabulary',
                      ),
                      controller: _vocabularyController,
                    ),
                  ),
//                  Padding(
//                    padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
//                    child: TextField(
//                      onChanged: (value) {},
//                      decoration: const InputDecoration(
//                        hintText: 'description',
//                      ),
//                      controller: _descriptionController,
//                    ),
//                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(
          () {
            imageurl = _imageUrlController.text;
            vocabulary = _vocabularyController.text;
//            description = _descriptionController.text;
          },
        ),
        tooltip: 'Set',
        child: const Icon(Icons.border_color),
      ),
    );
  }
}
