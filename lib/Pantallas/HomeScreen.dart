// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projecte/widgets/Joc.dart';

import 'LibraryScreen.dart';
//import 'package:projecte/widgets/Usuari.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //late Usuari user;
  List? movies;

  @override
  void initState() {
    super.initState();
    loadMovies().then((result) {
      setState(() => movies = result);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(color: Colors.black, spreadRadius: 5, blurRadius: 5)
              ],
              color: Colors.grey[850],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'GameApp',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: Text(
                    'Últims jocs',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Aqui van los últimos juegos',
                    style: TextStyle(color: Colors.black),
                  ),
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black, spreadRadius: 5, blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: Text(
                    'Per a tu',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                if (movies == null)
                  Container(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()))
                else
                  Container(
                    height: 200,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (final movie in movies!)
                          Container(
                            height: 150,
                            width: 80,
                            child: Column(
                              children: [
                                Image.network(movie['background_image']),
                                Text(
                                  movie['name'],
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.black, spreadRadius: 5, blurRadius: 5)
                ],
                color: Colors.grey[850],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.home_rounded,
                      color: Colors.grey,
                      size: 35,
                    ),
                    GestureDetector(
                      child: Icon(
                        Icons.grid_view_outlined,
                        color: Colors.grey,
                        size: 35,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LibraryScreen()));
                      },
                    ),
                    Icon(
                      Icons.person_rounded,
                      color: Colors.grey,
                      size: 35,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
