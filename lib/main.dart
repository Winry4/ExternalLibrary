import 'package:flutter/material.dart';
import 'Screen/Details.dart';
import 'Screen/Principal.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TextFieldDemoPage(),
    );
  }
}

class TextFieldDemoPage extends StatefulWidget {
  @override
  _TextFieldDemoPageState createState() => _TextFieldDemoPageState();
}

class _TextFieldDemoPageState extends State<TextFieldDemoPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  var name = '';
  var pass = '';
  @override
  Widget build(BuildContext context) {
    final myControllerEmail = TextEditingController();
    final myControllerPass = TextEditingController();
    /* Definimos dos TextField, uno para el usuario y otro para la contraseña y un button */
    final emailField = TextField(
      controller: myControllerEmail,
      obscureText: false,
      style: style,
      onChanged: (value) {
        name = value;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20.0),
          hintText: "Enter your username",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      controller: myControllerPass,
      obscureText: true,
      style: style,
      onChanged: (value) {
        pass = value;
      },
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20.0),
          hintText: "Enter your password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xFF05D8B2),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(15.0),
        onPressed: () {
          if (emailField != null && passwordField != null) {
            if (myControllerEmail.text == "entrenadorPokemon@gmail.com" &&
                myControllerPass.text == "1234") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Principal()),
              );
            } else {
              showAlertMethod(context);
            }
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final textLogin = Text("Login",
        textAlign: TextAlign.left,
        style: style.copyWith(
            color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold));
    //DC4A38
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                textLogin,
                SizedBox(height: 40.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 50.0,
                ),
                loginButon,
                SizedBox(
                  height: 90.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void showAlertMethod(BuildContext context) {
  var alert = AlertDialog(
    title: Text('Error'),
    content: Text('La contraseña o el email son incorrectos'),
    actions: <Widget>[
      FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Yes :)'))
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
