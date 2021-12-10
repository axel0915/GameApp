// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            ClaseJoc(joc: Ori),
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_rounded,
                          size: 40, color: Colors.white),
                      Spacer(),
                      Icon(Icons.search_rounded, size: 40, color: Colors.white),
                    ],
                  ),
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.home_outlined,
                      size: 35,
                      color: Colors.white,
                    ),
                    SizedBox(width: 80),
                    Icon(Icons.format_align_left_sharp,
                        size: 35, color: Colors.white),
                    SizedBox(width: 80),
                    Icon(Icons.person_outline_rounded,
                        size: 35, color: Colors.white),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ClaseJoc extends StatelessWidget {
  final Joc joc;
  const ClaseJoc({
    Key? key,
    required this.joc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/${joc.nom}.jpg"),
                    fit: BoxFit.cover)),
          ),
          flex: 40,
        ),
        Expanded(
          child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey[900],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white24, width: 1)),
                          child: Center(
                              child: Icon(Icons.favorite_border_rounded,
                                  size: 25, color: Colors.white)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.white24, width: 1)),
                          child: Center(
                              child: Icon(Icons.bookmark_border_rounded,
                                  size: 25, color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("${joc.nom}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Text("${joc.companyia}, ${joc.any}",
                            style:
                                TextStyle(fontSize: 20, color: Colors.white30)),
                        SizedBox(height: 10),
                        Text(
                          "${joc.descripcio}",
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                          textAlign: TextAlign.justify,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  "Genero:",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                SizedBox(height: 5),
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey[800],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Center(
                                        child: Text(
                                          "${joc.genere}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white70),
                                        ),
                                      ),
                                    )),
                                SizedBox(height: 10),
                                Text(
                                  "Plataforma:",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                SizedBox(height: 5),
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey[800],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(25),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Center(
                                        child: Text(
                                          "${joc.nomPlataforma}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white70),
                                        ),
                                      ),
                                    ))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )),
          flex: 60,
        ),
      ],
    );
  }
}
