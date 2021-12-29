// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  // late Usuari user;
  late bool mode_favorit = false;
  List<String> llista_de_prova = [
    "JOC 1",
    "JOC 2",
    "JOC 3",
    "JOC 4",
    "JOC 5",
    "JOC 6",
    "JOC 7",
    "JOC 8",
  ];
  List<String> llistafavorits_de_prova = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LibraryAppBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return GameContainer(index);
                },
                itemCount: llista_de_prova.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container LibraryAppBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black, spreadRadius: 5, blurRadius: 5)
        ],
        color: Colors.grey[900],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                (mode_favorit ? "Favorits" : "Tots els jocs"),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
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
                    height: 65,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: Icon(
                      (mode_favorit ? Icons.games_outlined : Icons.games),
                      size: 30,
                      color: Colors.white,
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
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(color: Colors.grey, width: 1)),
                      color: Colors.transparent,
                    ),
                    child: Icon(
                      (mode_favorit ? Icons.favorite : Icons.favorite_border),
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Center GameContainer(int index) {
    return Center(
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 0,
                blurRadius: 5,
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.red[900],
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          llista_de_prova.remove(llista_de_prova[index]);
                        });
                      },
                      child: Icon(Icons.cancel_outlined)),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text(llista_de_prova[index],
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
