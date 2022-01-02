// ignore_for_file: file_names, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projecte/widgets/Joc.dart';

class GameDetailsScreen extends StatefulWidget {
  final Joc joc;

  const GameDetailsScreen({Key? key, required this.joc}) : super(key: key);

  @override
  _GameDetailsScreenState createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          image: DecorationImage(
              image: widget.joc.background_image == null
                  ? NetworkImage(
                      "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg")
                  : NetworkImage(widget.joc.background_image!),
              fit: BoxFit.cover),
        )),
        toolbarHeight: 300,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: DetailsContainer(game: widget.joc),
          ),
        ],
      ),
    );
  }
}

class DetailsContainer extends StatefulWidget {
  final Joc game;

  const DetailsContainer({Key? key, required this.game}) : super(key: key);

  @override
  State<DetailsContainer> createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<DetailsContainer> {
  dynamic? details;

  @override
  void initState() {
    super.initState();
    loadDetails(widget.game.slug!).then((result) {
      setState(() => details = result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.grey[900]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 325),
                Text(widget.game.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
                Text(
                    widget.game.tba!
                        ? "TBA"
                        : widget.game.released == null
                            ? "-"
                            : widget.game.released!,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white30)),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (widget.game.metacritic != null
                              ? "${widget.game.metacritic}"
                              : "-"),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(width: 2),
                        SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.network(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Metacritic.svg/1024px-Metacritic.svg.png",
                          ),
                        ),
                      ]),
                ),
                SizedBox(height: 10),
                Center(
                    child: Text(
                  details['description'],
                  style: TextStyle(color: Colors.white),
                )),
                SizedBox(height: 10),
                ListScreenshots(game: widget.game),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Genre:",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        for (final genre in widget.game.genre!)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey[800],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    genre.name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white70),
                                  ),
                                )),
                          )
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Plataforms:",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        for (final platform in widget.game.platform!)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blueGrey[800],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(25),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    platform.name == null
                                        ? "-"
                                        : platform.name!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white70),
                                  ),
                                )),
                          )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class ListScreenshots extends StatelessWidget {
  final Joc game;
  const ListScreenshots({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (game.screenshots == null)
      return SizedBox(
          height: 200, child: Center(child: CircularProgressIndicator()));
    else
      return Column(
        children: [
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 1; i < game.screenshots!.length; i++)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              image: NetworkImage(game.screenshots![i].image),
                              fit: BoxFit.cover)),
                      width: 350,
                    ),
                  )
              ],
            ),
          ),
        ],
      );
  }
}
