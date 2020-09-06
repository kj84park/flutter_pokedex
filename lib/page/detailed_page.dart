import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/data/pokemon_lists.dart';
import 'package:intl/intl.dart';

class DetailedPage extends StatefulWidget {
  final int index;
  final PokemonLists pokemon;

  DetailedPage(this.index, this.pokemon);

  @override
  _DetailedPageState createState() =>
      _DetailedPageState(this.index, this.pokemon);
}

class _DetailedPageState extends State<DetailedPage> {
  final int index;
  final PokemonLists pokemon;

  _DetailedPageState(this.index, this.pokemon);

  @override
  Widget build(BuildContext context) {
    int imageIndex = index + 1;

    print("BC : " + pokemon.backGroundColor.toString());
    final formatter = NumberFormat("000");
    final indexString = formatter.format(index);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Pokedex"),
          Container(
              margin: EdgeInsets.only(right: 5), child: Text("#$indexString"))
        ]),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(),
        child: Container(
          color: Colors.black,
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                      color: pokemon.backGroundColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60))),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 80),
                      child: ExtendedImage.network(
                        "https://pokeres.bastionbot.org/images/pokemon/$imageIndex.png",
                        fit: BoxFit.fitWidth,
                        cache: true,
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Text(pokemon.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40)),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text("To be continue..",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 40)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text("------",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 40)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text("------",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 40)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text("------",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 40)),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
