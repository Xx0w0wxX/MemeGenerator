import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Meme Generator'),
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
  Offset offset2 = Offset.zero;

  Color textColor1 = Colors.pinkAccent;
  Color textColor2 = Colors.lightGreen;

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
              Padding(
                padding: const EdgeInsets.fromLTRB(60, 30, 60, 10),
                child: TextField(
                  onChanged: (value) {
                    setState(
                      () {
                        imageurl = _imageUrlController.text;
                        vocabulary = _vocabularyController.text;
                      },
                    );
                  },
                  decoration: const InputDecoration(
                    hintText: 'here is image url',
                  ),
                  controller: _imageUrlController,
                ),
              ),
              Stack(
                children: <Widget>[
                  Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
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
                            offset = Offset(
                              offset.dx + details.delta.dx,
                              offset.dy + details.delta.dy,
                            );
                          });
                        },
                        child: SizedBox(
                          width: 300,
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Center(
                              child: Text(
                                vocabulary,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                  color: textColor1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Positioned(
                      left: offset2.dx,
                      top: offset2.dy + 200,
                      child: GestureDetector(
                        onPanUpdate: (details) {
                          setState(() {
                            offset2 = Offset(
                              offset2.dx + details.delta.dx,
                              offset2.dy + details.delta.dy,
                            );
                          });
                        },
                        child: SizedBox(
                          width: 300,
                          height: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Center(
                              child: Text(
                                description,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                  color: textColor2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
                          setState(
                            () => textColor1 = Color(
                                    (Random().nextDouble() * 0xFFFFFF)
                                            .toInt() <<
                                        0)
                                .withOpacity(1),
                          );
                        },
                        child: const Text('RANDOM'),
                        color: Colors.lightBlueAccent,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                    child: TextField(
                      onChanged: (value) {
                        setState(
                          () {
                            vocabulary = value;
                          },
                        );
                      },
                      decoration: const InputDecoration(
                        hintText: 'Vocabulary',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                    child: TextField(
                      onChanged: (value) {
                        setState(
                          () {
                            description = value;
                          },
                        );
                      },
                      decoration: const InputDecoration(
                        hintText: 'Description',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
