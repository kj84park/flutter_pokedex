import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class DetailedPage extends StatefulWidget {
  final int index;

  DetailedPage(this.index);

  @override
  _DetailedPageState createState() => _DetailedPageState(this.index);
}

class _DetailedPageState extends State<DetailedPage> {
  final int index;

  _DetailedPageState(this.index);

  @override
  Widget build(BuildContext context) {
    int imageIndex = index + 1;

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
        body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Center(
            child: Container(
                width: 180,
                height: 180,
                margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                child: ExtendedImage.network(
                  "https://pokeres.bastionbot.org/images/pokemon/$imageIndex.png",
                  width: 130,
                  height: 130,
                  fit: BoxFit.fitWidth,
                  cache: true,
                  shape: BoxShape.rectangle,
                ))),
      ),
    );
  }
}
