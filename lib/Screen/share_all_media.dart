import 'package:flutter/material.dart';
import 'package:share/share.dart';

class DemoApp extends StatefulWidget {
  @override
  DemoAppState createState() => DemoAppState();
}

class DemoAppState extends State<DemoApp> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Share text:',
                    hintText: 'Enter some text and/or link to share',
                  ),
                  maxLines: 2,
                  onChanged: (String value) => setState(() {
                    text = value;
                  }),
                ),

          const Padding(padding: EdgeInsets.only(top: 24.0)),
          Builder(
            builder: (BuildContext context) {
              return RaisedButton(
                child: const Text('Share'),
                onPressed: text.isEmpty ? null : () {
                        final RenderBox box = context.findRenderObject();
                        Share.share(text,
                            sharePositionOrigin:
                                box.localToGlobal(Offset.zero) & box.size);
                      },
              );
            },
          ),
        ],
      ),
    ));
  }
}
