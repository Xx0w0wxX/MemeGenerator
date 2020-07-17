import 'package:flutter/material.dart';

class VocabularyText extends StatefulWidget {
  final String text;

  // ignore: sort_constructors_first
  const VocabularyText ({ Key key, this.text }): super(key: key);

  @override
  _VocabularyTextState createState() => _VocabularyTextState();
}

class _VocabularyTextState extends State<VocabularyText> {
  Offset offset = Offset.zero;

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
            child: const SizedBox(
              width: 300,
              height: 300,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text(
                      '${widget.text}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                          color: Colors.red
                      )
                  ),
                ),
              ),
            )),
      ),
    );
  }
}

class ServerIpText extends StatefulWidget {
  final String serverIP;

  // ignore: sort_constructors_first
  const ServerIpText ({ Key key, this.serverIP }): super(key: key);

  @override
  _ServerIpTextState createState() => _ServerIpTextState();
}

class _ServerIpTextState extends State<ServerIpText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.serverIP);
  }
}