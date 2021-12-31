// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projecte/Pantallas/GameDetailsScreen.dart';
import 'package:projecte/widgets/Joc.dart';

class HomeScreen extends StatefulWidget {
  final List<Joc> all, fav; //ELIMINAR ESTO

  const HomeScreen({Key? key, required this.all, required this.fav})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Joc>? lastgames;
  List<Joc>? Nintendogames;
  List<Joc>? Sonygames;
  List<Joc>? Xboxgames;
  List<Joc>? yourgames;
  List<Joc>? nextgames;
  List<Joc>? ratinggames;

  @override
  void initState() {
    super.initState();
    loadlastGames().then((result) {
      setState(() => lastgames = result);
    });
    loadnextGames().then((result) {
      setState(() => nextgames = result);
    });
    loadyourGames("puzzle").then((result) {
      setState(() => yourgames = result);
    });
    loadNintendoGames().then((result) {
      setState(() => Nintendogames = result);
    });
    loadXboxGames().then((result) {
      setState(() => Xboxgames = result);
    });
    loadSonyGames().then((result) {
      setState(() => Sonygames = result);
    });
    loadRatingGames().then((result) {
      setState(() => ratinggames = result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Icon(Icons.search_rounded, size: 30),
            )
          ],
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
            "GameApp",
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
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 5, top: 10, bottom: 5),
                      child: Text(
                        'Last games:',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListWidget(
                        games: lastgames, fav: widget.fav, all: widget.all),
                    SizedBox(height: 5),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 5, top: 10, bottom: 5),
                      child: Text(
                        'Coming soon:',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListWidget(
                        games: nextgames, all: widget.all, fav: widget.fav),
                    SizedBox(height: 5),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 5, top: 10, bottom: 5),
                      child: Text(
                        'For you:',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListWidget(
                        games: yourgames, all: widget.all, fav: widget.fav),
                    SizedBox(height: 5),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 5, top: 10, bottom: 5),
                      child: Text(
                        'Nintendo games:',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListWidget(
                        games: Nintendogames, all: widget.all, fav: widget.fav),
                    SizedBox(height: 5),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 5, top: 10, bottom: 5),
                      child: Text(
                        'Xbox games:',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListWidget(
                        games: Xboxgames, all: widget.all, fav: widget.fav),
                    SizedBox(height: 5),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 5, top: 10, bottom: 5),
                      child: Text(
                        'Playstation games:',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListWidget(
                        games: Sonygames, all: widget.all, fav: widget.fav),
                    SizedBox(height: 5),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 5, top: 10, bottom: 5),
                      child: Text(
                        'Top 2021:',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListWidget(
                        games: ratinggames, all: widget.all, fav: widget.fav),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class AppBarcaca extends StatelessWidget {
  const AppBarcaca({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, top: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'GameApp',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Icon(Icons.search)
          ],
        ),
      ),
    );
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget(
      {Key? key, required this.games, required this.fav, required this.all})
      : super(key: key);

  final List<Joc>? games;
  final List<Joc> all, fav;

  @override
  Widget build(BuildContext context) {
    if (games == null)
      return Container(
          height: 200, child: Center(child: CircularProgressIndicator()));
    else
      return Container(
        width: 100,
        height: 250,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (final game in games!)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            GameDetailsScreen(joc: game, fav: fav, all: all),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: 0,
                            blurRadius: 5,
                          )
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image: NetworkImage(game.background_image),
                            fit: BoxFit.cover)),
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  (game.metacritic != null
                                      ? "${game.metacritic}"
                                      : "-"),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                SizedBox(width: 2),
                                Container(
                                  height: 20,
                                  width: 20,
                                  child: Image.network(
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Metacritic.svg/1024px-Metacritic.svg.png",
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          height: 50,
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                            color: Colors.black.withOpacity(0.5),
                          ),
                          child: Center(
                            child: Text(
                              game.name,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
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
