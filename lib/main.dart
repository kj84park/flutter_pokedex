// Flutter code sample for AnimatedList

// This sample application uses an [AnimatedList] to create an effect when
// items are removed or added to the list.

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/network/poke_dex_client.dart';
import 'package:palette_generator/palette_generator.dart';

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
  Color color = Colors.transparent;

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

  String _getName(int index){
    if(_pokemonList == null){
      return "";
    }
    final pokemonMap = _pokemonList.asMap();
    return pokemonMap[index].name;
  }

  Future<Color> _getImagePalette (ImageProvider imageProvider) async {
    final PaletteGenerator paletteGenerator = await PaletteGenerator
        .fromImageProvider(imageProvider);
      return paletteGenerator.dominantColor.color;
  }

  void _printText(){
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
                    var image = ExtendedImage.network(
                      "https://pokeres.bastionbot.org/images/pokemon/$imageIndex.png",
                      width: 130,
                      height: 130,
                      fit: BoxFit.fitWidth,
                      cache: true,
                      shape: BoxShape.rectangle,
                    );

                    return SafeArea(
                      minimum: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: FutureBuilder(
                        future: _getImagePalette(image.image),
                        builder: (context, snapshot){

                          Color color;
                          if(snapshot.hasData){
                            color = snapshot.data;
                          } else {
                            color = Colors.transparent;
                          }

                          return FlatButton(
                          color:color,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)),
                            child: Container(
                              width: 180,
                              height: 180,
                              margin: EdgeInsets.fromLTRB(20, 10, 10, 10),
                              child: Column(
                                children: [
                                  image,
                                Container(margin : EdgeInsets.only(top: 10),child: Text(_getName(index)  ,style: TextStyle(color: Colors.white)))],
                              ),
                            ),
                          onPressed: _printText,
                        );},
                      ),
                    );
                  },
                   ),
                )));
  }
}
