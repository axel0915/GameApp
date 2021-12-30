// ignore_for_file: file_names, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projecte/widgets/Joc.dart';

class GameDetailsScreen extends StatefulWidget {
  final Joc joc;
  final List<Joc> all, fav;
  const GameDetailsScreen(
      {Key? key, required this.joc, required this.fav, required this.all})
      : super(key: key);

  @override
  _GameDetailsScreenState createState() => _GameDetailsScreenState();
}

class _GameDetailsScreenState extends State<GameDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Column(
        children: [
          Expanded(
            child: ImageContainer(game: widget.joc),
            flex: 35,
          ),
          Expanded(
            child: DetailsContainer(
                game: widget.joc, fav: widget.fav, all: widget.all),
            flex: 65,
          ),
        ],
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final Joc? game;
  const ImageContainer({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (game == null)
      return SizedBox(
          height: 200, child: Center(child: CircularProgressIndicator()));
    else
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(game!.background_image),
                fit: BoxFit.cover)),
      );
  }
}

class DetailsContainer extends StatefulWidget {
  final Joc game;
  final List<Joc> all, fav;
  const DetailsContainer({
    Key? key,
    required this.game,
    required this.fav,
    required this.all,
  }) : super(key: key);

  @override
  State<DetailsContainer> createState() => _DetailsContainerState();
}

class _DetailsContainerState extends State<DetailsContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.grey[850]),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white24, width: 1)),
                        child: Center(
                            child: Icon(
                                widget.all.contains(widget.game)
                                    ? Icons.gamepad_rounded
                                    : Icons.gamepad_outlined,
                                size: 30,
                                color: Colors.white)),
                      ),
                      onTap: () {
                        setState(() {
                          if (!widget.all.contains(widget.game)) {
                            widget.all.add(widget.game);
                          } else {
                            widget.all.remove(widget.game);
                            widget.fav.remove(widget.game);
                          }
                        });
                      }),
                ),
                Expanded(
                  child: GestureDetector(
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.white24, width: 1)),
                        child: Center(
                            child: Icon(
                                widget.fav.contains(widget.game)
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                size: 30,
                                color: Colors.red[900])),
                      ),
                      onTap: () {
                        setState(() {
                          if (!widget.fav.contains(widget.game)) {
                            widget.all.add(widget.game);
                            widget.fav.add(widget.game);
                          } else {
                            widget.fav.remove(widget.game);
                          }
                        });
                      }),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(widget.game.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                      Text(widget.game.released,
                          textAlign: TextAlign.center,
                          style:
                              TextStyle(fontSize: 20, color: Colors.white30)),
                      SizedBox(height: 10),
                      Text("Description"),
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
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
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
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
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
                                          platform.name,
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
              ),
            )
          ],
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
