import 'package:flutter/material.dart';
import 'package:projecte/Pantallas/HomeNavigatorBar.dart';
import 'package:projecte/Pantallas/SignUp.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/home_screen.png"),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.darken),
              fit: BoxFit.cover,
            ),
          ),
          child: ColumnWidget()),
    );
  }
}

class ColumnWidget extends StatelessWidget {
  const ColumnWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 50),
          Center(
            child: Text(
              "GAME APP",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Center(
            child: Text(
              "Welcome back!",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomeNavigatorBar()));
                },
                child: Text("Play!",
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey[900],
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    shape: StadiumBorder()),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "New user?",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: Text("Let's start",
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    shape: StadiumBorder()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
