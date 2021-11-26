// ignore: file_names
// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:projecte/widgets/Usuari.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  late Usuari user;
  late bool mode_favorit = false;

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
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 35),
                  child: Text(
                    (mode_favorit ? "Els meus favorits" : "Els meus jocs"),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            mode_favorit = false;
                          });
                        },
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Icon(
                            (mode_favorit ? Icons.games_outlined : Icons.games),
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            mode_favorit = true;
                          });
                        },
                        child: Container(
                          height: 75,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: Icon(
                            (mode_favorit
                                ? Icons.favorite
                                : Icons.favorite_border),
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: ListView.separated(
                  itemCount: 100, //user.biblioteca.length
                  itemBuilder: (context, index) {
                    return ListTile(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      tileColor: Colors.white,
                      title: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Joc numero $index"),
                      ), //user.biblioteca[index].nom
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            child: Icon(Icons.delete_rounded),
                            onTap: () {
                              setState(() {});
                            },
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.red[900],
                          )
                        ],
                      ),
                      subtitle:
                          Text("$index"), //user.biblioteca[index].companyia
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 1,
                      height: 5,
                      indent: 72,
                    );
                  },
                ),
              ),
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
            ),
          )
        ],
      ),
    );
  }
}
