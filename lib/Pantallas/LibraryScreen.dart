// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:projecte/Pantallas/GameDetailsScreen.dart';
import 'package:projecte/widgets/Joc.dart';

class LibraryScreen extends StatefulWidget {
  final List<Joc> all, fav;

  const LibraryScreen({Key? key, required this.all, required this.fav})
      : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  late bool mode_favorit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LibraryAppBar(),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return GameContainer(index);
              },
              itemCount: mode_favorit ? widget.fav.length : widget.all.length,
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
                (mode_favorit ? "Favourits" : "All"),
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
                      color: Colors.red[900],
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
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
            setState(() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GameDetailsScreen(
                      joc: mode_favorit ? widget.fav[index] : widget.all[index],
                      fav: widget.fav,
                      all: widget.all),
                ),
              );
            });
          },
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 0,
                    blurRadius: 5,
                  )
                ],
                image: DecorationImage(
                    image: NetworkImage(mode_favorit
                        ? widget.fav[index].background_image
                        : widget.all[index].background_image),
                    fit: BoxFit.cover),
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (mode_favorit) {
                            widget.fav.remove(widget.fav[index]);
                          } else {
                            widget.all.remove(widget.all[index]);
                          }
                        });
                      },
                      child: Icon(Icons.cancel_outlined)),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                            mode_favorit
                                ? widget.fav[index].name
                                : widget.all[index].name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
