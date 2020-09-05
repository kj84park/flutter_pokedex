// Flutter code sample for AnimatedList

// This sample application uses an [AnimatedList] to create an effect when
// items are removed or added to the list.

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_pokedex/network/poke_dex_client.dart';

void main() {
  runApp(AnimatedListSample());
}

class AnimatedListSample extends StatefulWidget {
  @override
  _AnimatedListSampleState createState() => _AnimatedListSampleState();
}

class _AnimatedListSampleState extends State<AnimatedListSample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<int> _list;

  @override
  void initState() {
    super.initState();
    _list = [10, 9, 8, 7, 6, 5, 34, 123, 536, 234324, 23635, 239, 1];
    PokeDexClient().fetchPokemonList();
  }


  void printText(){
    print("aaaaa");
  }

  int realIndex(int index){
    return index+1;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.blueGrey,
            appBar: AppBar(
              title: const Text('Pokedex'),
              backgroundColor: Colors.red,
              actions: <Widget>[],
            ),
            body: Padding(
                padding: const EdgeInsets.all(1.0),
                child: GridView.count(
                  key: _listKey,
                  crossAxisCount: 2,
                  children: List.generate(
                    20,
                    (index) => SafeArea(
                      minimum: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: FlatButton(
                        color: Colors.amberAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                          child: Container(
                            width: 180,
                            height: 180,
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Column(
                              children: [
                                ExtendedImage.network(
                                  "https://pokeres.bastionbot.org/images/pokemon/$index.png",
                                  width: 130,
                                  height: 130,
                                  fit: BoxFit.fitWidth,
                                  cache: true,
                                  shape: BoxShape.rectangle,
                                ),
                              Container(margin : EdgeInsets.only(top: 15),child: Text("HELLO"  ,style: TextStyle(color: Colors.white)))],
                            ),
                          ),
                        onPressed: printText,
                      ),
                    ),
                    growable : true),
                ))));
  }
}
