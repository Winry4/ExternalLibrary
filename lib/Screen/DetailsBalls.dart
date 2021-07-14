import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tornus/Class/PokeBalls.dart';
import '../Class/Pokemon.dart';

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

class DetailsBalls extends StatefulWidget {
  final String name;
  final Image pokeImage;

  const DetailsBalls({
    Key key,
    @required this.name,
    @required this.pokeImage,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState(name, pokeImage);
}

class _MyAppState extends State<DetailsBalls> {
  Future<PokeBalls> pokemonFuture;
  String urlSprite;
  final String name;
  final Image pokeImage;

  _MyAppState(this.name, this.pokeImage);

  @override
  void initState() {
    super.initState();
    pokemonFuture = getDataPokeBalls(name);
  }

  @override
  Widget build(BuildContext context) {
    var pokeName = FutureBuilder<PokeBalls>(
      future: pokemonFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.name);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
    var pokeCost = FutureBuilder<PokeBalls>(
      future: pokemonFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.cost.toString());
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
    var cost = Text('Coste: ', style: TextStyle(fontWeight: FontWeight.bold));
    var name = Text('Nombre: ', style: TextStyle(fontWeight: FontWeight.bold));

    final buttonBack = RaisedButton(
      padding: EdgeInsets.all(20.0),
      color: Color(0xFF05D8B2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text('Go back!',
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    );

    return Scaffold(
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                pokeImage,
                SizedBox(height: 25.0),
                Row(
                  children: [name, pokeName],
                ),
                SizedBox(height: 15.0),
                Row(
                  children: [cost, pokeCost],
                ),
                SizedBox(height: 55.0),
                buttonBack,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<PokeBalls> getDataPokeBalls(String name) async {
  final response =
      await http.get('https://pokeapi.co/api/v2/item/' + name + '/');
  return PokeBalls.fromJson(jsonDecode(response.body));
}

@override
State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
}
