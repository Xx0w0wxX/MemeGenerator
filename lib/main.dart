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
  final _imageUrlController = TextEditingController();
  final _vocabularyController = TextEditingController();
  final _descriptionController = TextEditingController();
  String imageurl = '';
  String vocabulary = '';
  String description = '';
//
//  _incrementCounter() {
//    setState(() {
//      _counter = 's';
//    });
//  }

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
//                onChanged: (value) {},
                  decoration: const InputDecoration(
                    hintText: 'image url',
                  ),
                  controller: _imageUrlController,
                ),
              ),
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
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
                      controller: _vocabularyController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                    child: TextField(
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        hintText: 'description',
                      ),
                      controller: _descriptionController,
                    ),
                  ),
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
            description = _descriptionController.text;
          },
        ),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
