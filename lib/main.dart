// Flutter code sample for AnimatedList

// This sample application uses an [AnimatedList] to create an effect when
// items are removed or added to the list.

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_pokedex/network/poke_dex_client.dart';

import 'data/pokemon_lists.dart';

void main() {
  runApp(AnimatedListSample());
}

class AnimatedListSample extends StatefulWidget {
  @override
  _AnimatedListSampleState createState() => _AnimatedListSampleState();
}

class _AnimatedListSampleState extends State<AnimatedListSample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<PokemonLists> _pokemonList;

  @override
  void initState() {
    super.initState();
    Future<List<PokemonLists>> _list = PokeDexClient().fetchPokemonList();
    _list.then((value) {
      setState(() {
        _pokemonList = value;
      });
    });
  }

  String getName(int index){
    if(_pokemonList == null){
      return "";
    }
    final pokemonMap = _pokemonList.asMap();
    return pokemonMap[index].name;
  }

  void printText(){
    print("aaaaa");
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
                child: GridView.builder(
                  key: _listKey,
                  itemCount: 20,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2
                  ),
                  itemBuilder:(context,index) {
                    int imageIndex = index+1;
                    return SafeArea(
                      minimum: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: FlatButton(
                        color: Colors.amberAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                          child: Container(
                            width: 180,
                            height: 180,
                            margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                            child: Column(
                              children: [
                                ExtendedImage.network(
                                  "https://pokeres.bastionbot.org/images/pokemon/$imageIndex.png",
                                  width: 130,
                                  height: 130,
                                  fit: BoxFit.fitWidth,
                                  cache: true,
                                  shape: BoxShape.rectangle,
                                ),
                              Container(margin : EdgeInsets.only(top: 10),child: Text(getName(index)  ,style: TextStyle(color: Colors.white)))],
                            ),
                          ),
                        onPressed: printText,
                      ),
                    );
                  },
                   ),
                )));
  }
}
