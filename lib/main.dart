import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: "Teste de tomate", home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _info_text = "Ta safe!";

  void _change_people(int delta) {
    setState(() {
      _people += delta;
      
      if (_people < 0)
      {
        _info_text = "Bundas negativas";
      }
      else if (_people <= 10)
      {
        _info_text = "Ta safe!";
      }
      else
      {
        _info_text = "Não cabe mais bundas!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "images/restaurant.jpg",
          fit: BoxFit.cover,
          height: 1000,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "BUNDAS: $_people",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextButton(
                      onPressed: () {
                        _change_people(1);
                      },
                      child: const Text(
                        "+1",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextButton(
                      onPressed: () {
                        _change_people(-1);
                      },
                      child: const Text(
                        "-1",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      )),
                ),
              ],
            ),
            Text(
              _info_text,
              style: const TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30),
            )
          ],
        ),
      ],
    );
  }
}
