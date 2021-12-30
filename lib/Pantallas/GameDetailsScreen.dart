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
      body: Column(
        children: [
          Expanded(
            child: ImageContainer(game: widget.joc),
            flex: 35,
          ),
          Expanded(
            child: DetailsContainer(game: widget.joc),
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

class DetailsContainer extends StatelessWidget {
  final Joc game;
  const DetailsContainer({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: Colors.grey[850]),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white24, width: 1)),
                    child: Center(
                        child: Icon(Icons.gamepad_outlined,
                            size: 25, color: Colors.white)),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white24, width: 1)),
                    child: Center(
                        child: Icon(Icons.favorite_border_rounded,
                            size: 25, color: Colors.white)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(game.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Text(game.released,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white30)),
                  SizedBox(height: 20),
                  ListScreenshots(game: game),
                  SizedBox(height: 10),
                  Text(
                    "Genre:",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[800],
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            game.slug,
                            style:
                                TextStyle(fontSize: 12, color: Colors.white70),
                          ),
                        ),
                      )),
                  SizedBox(height: 10),
                  Text(
                    "Plataform:",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[800],
                        borderRadius: BorderRadius.all(
                          Radius.circular(25),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Center(
                          child: Text(
                            game.platform,
                            style:
                                TextStyle(fontSize: 12, color: Colors.white70),
                          ),
                        ),
                      ))
                ],
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
      return Container(
          height: 200, child: Center(child: CircularProgressIndicator()));
    else
      return Container(
        width: 250,
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            for (final screenshots in game.screenshots!)
              Padding(
                padding: const EdgeInsets.all(8.0),
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
                          image: NetworkImage(screenshots.image),
                          fit: BoxFit.cover)),
                  width: 200,
                ),
              )
          ],
        ),
      );
  }
}
