import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaNaMeMe',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyVocabularyText(title: 'MaNaMeMe'),
    );
  }
}

class MyVocabularyText extends StatefulWidget {
  const MyVocabularyText({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyVocabularyTextState createState() => _MyVocabularyTextState();
}

class _MyVocabularyTextState extends State<MyVocabularyText> {
  // variable to hold image to be displayed
  Uint8List uploadedImage;
  bool isSet = false;

  // method to load image and update `uploadedImage`
  Future _startFilePicker() async {
    final uploadInput = FileUploadInputElement()
      ..click();

    uploadInput.onChange.listen((e) {
      // read file content as dataURL
      final files = uploadInput.files;
      if (files.length == 1) {
        final file = files[0];
        final reader =  FileReader();

        reader.onLoadEnd.listen((e) {
          setState(() {
            uploadedImage = reader.result as Uint8List;
            isSet = true;
          });
        });

        reader.onError.listen((fileEvent) {
          setState(() {
            print('Some Error happened while reading the file');
          });
        });

        reader.readAsArrayBuffer(file);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: const Text('Upload Image'),
              shape: const UnderlineInputBorder(),
              onPressed: () {
                print('press');
                _startFilePicker();
              },
            ),
            const SizedBox(height: 20),
            Stack(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(30),
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    child: FittedBox(
                      child: isSet == false
                          ? Text(
                        'ok',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      )
                          : Text(
                        'Image',
                        style: TextStyle(
                            color:
                            Colors.grey[800],
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                  VocabularyText(),
                  VocabularyText(),
                ]
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                  child: TextField(
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      hintText: 'Vocabulary',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                  child: TextField(
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      hintText: 'description',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class VocabularyText extends StatefulWidget {
  @override
  _VocabularyTextState createState() => _VocabularyTextState();
}

class _VocabularyTextState extends State<VocabularyText> {
  Offset offset = Offset.zero;
  String vocabulary = 'vocabulary';
  String description  = 'description';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Positioned(
        left: offset.dx,
        top: offset.dy,
        child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                offset = Offset(
                    offset.dx + details.delta.dx, offset.dy + details.delta.dy);
              });
            },
            child: SizedBox(
              width: 300,
              height: 300,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                      vocabulary,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.red
                      )
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}
