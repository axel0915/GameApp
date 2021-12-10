import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:projecte/widgets/Joc.dart';

import 'LibraryScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Joc>? lastgames;
  List<Joc>? yourgames;

  @override
  void initState() {
    super.initState();
    loadlastGames().then((result) {
      setState(() => lastgames = result);
    });
    loadyourGames("adventure").then((result) {
      setState(() => yourgames = result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
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
                  ],
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Últims jocs:',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                if (lastgames == null)
                  Container(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()))
                else
                  ListWidget(games: lastgames),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Per a tu:',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                if (lastgames == null)
                  Container(
                      height: 200,
                      child: Center(child: CircularProgressIndicator()))
                else
                  ListWidget(
                    games: yourgames,
                  ),
              ],
            ),
            Container(
              height: 65,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Colors.black, spreadRadius: 5, blurRadius: 5)
                ],
                color: Colors.grey[900],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.home_rounded,
                    color: Colors.white,
                    size: 35,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LibraryScreen()));
                      });
                    },
                    child: Icon(
                      Icons.grid_view,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  Icon(
                    Icons.person_outline_rounded,
                    color: Colors.white,
                    size: 35,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class ListWidget extends StatelessWidget {
  const ListWidget({
    Key? key,
    required this.games,
  }) : super(key: key);

  final List<Joc>? games;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 250,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (final game in games!)
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
                        image: NetworkImage(game.background_image),
                        fit: BoxFit.cover)),
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Text(
                        (game.metacritic != null ? "${game.metacritic}" : "-"),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Icon(
                        Icons.star_rate_rounded,
                        color: Colors.yellow,
                      ),
                    ]),
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
                          "${game.name}",
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
            )
        ],
      ),
    );
  }
}
