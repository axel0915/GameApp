// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:projecte/Pantallas/GameDetailsScreen.dart';
import 'package:projecte/widgets/Joc.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  late String titol = "All games";
  late bool mode_favorit = false;
  late bool mode_wishlist = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        titol = "All games";
                        mode_favorit = false;
                        mode_wishlist = false;
                      });
                    },
                    child: Container(
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Icon(
                        (mode_favorit || mode_wishlist
                            ? Icons.games_outlined
                            : Icons.games),
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
                        titol = "Favorit games";
                        mode_favorit = true;
                        mode_wishlist = false;
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
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        titol = "Wishlist";
                        mode_favorit = false;
                        mode_wishlist = true;
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
                        Icons.add_shopping_cart_rounded,
                        size: 30,
                        color:
                            (mode_wishlist ? Colors.amberAccent : Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            preferredSize: Size.fromHeight(65)),
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        title: Text(
          titol,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey[900],
      ),
      backgroundColor: Colors.grey[850],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      /*                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => GameDetailsScreen(
                              joc: ),
                        ),
                      );*/
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
                        /*image: DecorationImage(
                            image: NetworkImage(mode_favorit
                                ? widget.fav[index].background_image
                                : widget.all[index].background_image),
                            fit: BoxFit.cover),*/
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
                                  /*
                                  if (mode_favorit) {
                                    widget.fav.remove(widget.fav[index]);
                                  } else {
                                    widget.all.remove(widget.all[index]);
                                  }
                                */
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
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              color: Colors.black.withOpacity(0.5),
                            ),
                            child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                      "Game_title" /*
                                    mode_favorit
                                        ? widget.fav[index].name
                                        : widget.all[index].name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    */
                                      )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount:
              10 /*mode_favorit ? widget.fav.length : widget.all.length*/,
        ),
      ),
    );
  }
}
