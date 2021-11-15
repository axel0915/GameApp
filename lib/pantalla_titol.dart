import 'package:flutter/material.dart';

class First_Screen extends StatefulWidget {
  const First_Screen({Key? key}) : super(key: key);

  @override
  _First_ScreenState createState() => _First_ScreenState();
}

class _First_ScreenState extends State<First_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/home_screen.png"),
                colorFilter: ColorFilter.mode(
                    Colors.blue.withOpacity(0.5), BlendMode.darken),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 100),
                  Text(
                    "HOLAAAAAA",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 200),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Registra't", style: TextStyle(fontSize: 20)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.grey[900],
                        padding: EdgeInsets.all(20),
                        shape: StadiumBorder()),
                  ),
                  Text(
                    "IEEEE AXEEL",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
