// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projecte/Pantallas/GameDetailsScreen.dart';
import 'package:projecte/Pantallas/SearchScreen.dart';
import 'package:projecte/widgets/Joc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Joc>? lastgames;
  List<Joc>? Nintendogames;
  List<Joc>? Sonygames;
  List<Joc>? Xboxgames;
  List<Joc>? yourgames = [];
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
            child: GestureDetector(
              child: Icon(Icons.search_rounded, size: 30),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
              },
            ),
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .doc("/Usuaris/${FirebaseAuth.instance.currentUser!.uid}")
            .snapshots(),
        builder: (
          BuildContext context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot,
        ) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final doc = snapshot.data!;
          final data = doc.data()!;
          loadyourGames("${data['genere_preferit']}").then((result) {
            setState(() => yourgames = result);
          });
          return GamesColumn(
              lastgames: lastgames,
              nextgames: nextgames,
              yourgames: yourgames,
              Nintendogames: Nintendogames,
              Xboxgames: Xboxgames,
              Sonygames: Sonygames,
              ratinggames: ratinggames,
              widget: widget);
        },
      ),
    );
  }
}

class GamesColumn extends StatelessWidget {
  const GamesColumn({
    Key? key,
    required this.lastgames,
    required this.widget,
    required this.nextgames,
    required this.yourgames,
    required this.Nintendogames,
    required this.Xboxgames,
    required this.Sonygames,
    required this.ratinggames,
  }) : super(key: key);

  final List<Joc>? lastgames;
  final HomeScreen widget;
  final List<Joc>? nextgames;
  final List<Joc>? yourgames;
  final List<Joc>? Nintendogames;
  final List<Joc>? Xboxgames;
  final List<Joc>? Sonygames;
  final List<Joc>? ratinggames;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  padding: const EdgeInsets.only(left: 5, top: 10, bottom: 5),
                  child: Text(
                    'Last games:',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListWidget(games: lastgames),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 10, bottom: 5),
                  child: Text(
                    'Coming soon:',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListWidget(games: nextgames),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 10, bottom: 5),
                  child: Text(
                    'For you:',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListWidget(games: yourgames),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 10, bottom: 5),
                  child: Text(
                    'Nintendo games:',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListWidget(games: Nintendogames),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 10, bottom: 5),
                  child: Text(
                    'Xbox games:',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListWidget(games: Xboxgames),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 10, bottom: 5),
                  child: Text(
                    'Playstation games:',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListWidget(games: Sonygames),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 10, bottom: 5),
                  child: Text(
                    'Top 2021:',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                ListWidget(games: ratinggames),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({Key? key, required this.games}) : super(key: key);

  final List<Joc>? games;

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
                        builder: (context) => GameDetailsScreen(joc: game),
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
                          image: game.background_image == null
                              ? NetworkImage(
                                  "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg")
                              : NetworkImage(game.background_image!),
                          fit: BoxFit.cover),
                    ),
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
