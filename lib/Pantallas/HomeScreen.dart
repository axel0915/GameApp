// ignore: file_names
// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:projecte/widgets/Usuari.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Usuari user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        mainAxisSize: MainAxisSize.max,
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
                    Expanded(
                      child: Text(
                        'GameApp',
                        style: TextStyle(fontSize: 30),
                      ),
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 65,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black, spreadRadius: 5, blurRadius: 5)
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
                          Icon(
                            Icons.grid_view_outlined,
                            color: Colors.grey,
                            size: 35,
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
          ),
        ],
      ),
    );
  }
}
