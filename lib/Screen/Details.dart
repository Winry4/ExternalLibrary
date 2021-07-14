import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Class/Pokemon.dart';

TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

class Details extends StatefulWidget {
  final String number;
  final Image pokeImage;

  const Details({
    Key key,
    @required this.number,
    @required this.pokeImage,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState(number, pokeImage);
}

class _MyAppState extends State<Details> {
  Future<Pokemon> pokemonFuture;
  String urlSprite;
  final String number;
  final Image pokeImage;

  _MyAppState(this.number, this.pokeImage);

  @override
  void initState() {
    super.initState();
    pokemonFuture = getDataPokemon(number);
  }

  @override
  Widget build(BuildContext context) {
    var pokeName = FutureBuilder<Pokemon>(
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
    var pokeHeight = FutureBuilder<Pokemon>(
      future: pokemonFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.height.toString());
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
    var pokeweight = FutureBuilder<Pokemon>(
      future: pokemonFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data.weight.toString());
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
    var height = Text('Altura(decimetros): ',
        style: TextStyle(fontWeight: FontWeight.bold));
    var name = Text('Nombre: ', style: TextStyle(fontWeight: FontWeight.bold));
    var weight = Text('Peso(hectogramos): ',
        style: TextStyle(fontWeight: FontWeight.bold));

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
                  children: [height, pokeHeight],
                ),
                SizedBox(height: 15.0),
                Row(
                  children: [weight, pokeweight],
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

Future<Pokemon> getDataPokemon(String number) async {
  final response =
      await http.get('https://pokeapi.co/api/v2/pokemon/' + number + '/');
  return Pokemon.fromJson(jsonDecode(response.body));
}

@override
State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
}
