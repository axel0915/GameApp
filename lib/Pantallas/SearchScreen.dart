import 'package:flutter/material.dart';
import 'package:projecte/Pantallas/GameDetailsScreen.dart';
import 'package:projecte/widgets/Joc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<Joc>? searchgames = [];
  late TextEditingController search_controller;

  @override
  void initState() {
    super.initState();
    search_controller = TextEditingController(
      text: "",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        title: Text(
          "Search",
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Search...",
                    suffix: GestureDetector(
                      child: Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.grey,
                      ),
                      onTap: () {
                        search_controller.clear();
                      },
                    ),
                  ),
                  controller: search_controller,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  child: Text("Search"),
                  onPressed: () {
                    setState(() {
                      loadSearchGames(search_controller.text).then((result) {
                        setState(() => searchgames = result);
                      });
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(
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
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                GameDetailsScreen(joc: searchgames![index]),
                          ));
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
                                image: searchgames![index].background_image ==
                                        null
                                    ? NetworkImage(
                                        "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg")
                                    : NetworkImage(
                                        searchgames![index].background_image!),
                                fit: BoxFit.cover),
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Align(
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
                                child: Text(searchgames![index].name,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              itemCount: searchgames!.length,
            ),
          ),
        ],
      ),
    );
  }
}
