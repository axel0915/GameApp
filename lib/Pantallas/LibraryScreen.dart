import 'package:flutter/material.dart';
import 'package:projecte/widgets/Usuari.dart';

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
    Widget body = Center(child: CircularProgressIndicator());
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
                            (mode_favorit
                                ? Icons.favorite
                                : Icons.favorite_border),
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
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.favorite_border_rounded,
                                    color: Colors.red[900],
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          llista_de_prova
                                              .remove(llista_de_prova[index]);
                                        });
                                      },
                                      child: Icon(Icons.cancel_outlined)),
                                ],
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Text("${llista_de_prova[index]}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: llista_de_prova.length,
                ),
                /* ListView.separated(
                  itemCount: 10, //user.biblioteca.length
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                            Text("Joc numero $index",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  child: Icon(Icons.cancel),
                                  onTap: () {
                                    setState(() {
                                      llista_de_prova
                                          .remove(llista_de_prova[index]);
                                    });
                                  },
                                ),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red[900],
                                )
                              ],
                            ),
                          ],
                        ),
                      ), //user.biblioteca[index].nom
                      //user.biblioteca[index].companyia
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 1,
                      height: 5,
                      indent: 72,
                    );
                  },
                ),*/
              ),
            ),
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                  child: Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
                Icon(
                  Icons.grid_view_rounded,
                  color: Colors.white,
                  size: 35,
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
      ),
    );
  }
}
