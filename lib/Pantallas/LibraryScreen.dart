import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projecte/widgets/Joc.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  String titol = "All games";
  List<Joc>? llibreria = [];
  List<Joc>? favorits = [];
  List<Joc>? wishlist = [];

  List<Joc>? llista;
  bool mode_favorit = false;
  bool mode_normal = true;
  bool mode_wishlist = false;

  @override
  void initState() {
    super.initState();
    llista = llibreria;
    final db = FirebaseFirestore.instance;
    db
        .collection(
            "/Usuaris/${FirebaseAuth.instance.currentUser!.uid}/Favorits")
        .get()
        .then((value) {
      for (var element in value.docs) {
        setState(() {
          favorits!.add(Joc.fromMap(element.data()));
        });
      }
    });
    db
        .collection(
            "/Usuaris/${FirebaseAuth.instance.currentUser!.uid}/Llibreria")
        .get()
        .then((value) {
      for (var element in value.docs) {
        setState(() {
          llibreria!.add(Joc.fromMap(element.data()));
        });
      }
    });
    db
        .collection(
            "/Usuaris/${FirebaseAuth.instance.currentUser!.uid}/Wishlist")
        .get()
        .then((value) {
      for (var element in value.docs) {
        setState(() {
          wishlist!.add(Joc.fromMap(element.data()));
        });
      }
    });
  }

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
                        llista = llibreria;
                        mode_normal = true;
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
                        (!mode_normal ? Icons.games_outlined : Icons.games),
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
                        llista = favorits;
                        mode_favorit = true;
                        mode_normal = false;
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
                        llista = wishlist;
                        mode_wishlist = true;
                        mode_favorit = false;
                        mode_normal = false;
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
                        (mode_wishlist
                            ? Icons.shopping_cart_rounded
                            : Icons.shopping_cart_outlined),
                        size: 30,
                        color: Colors.amberAccent,
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
                          image: NetworkImage(llista![index].background_image!),
                          fit: BoxFit.cover),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            final db = FirebaseFirestore.instance;
                            if (mode_normal) {
                              db
                                  .collection(
                                      "/Usuaris/${FirebaseAuth.instance.currentUser!.uid}/Llibreria")
                                  .doc(llista![index].name)
                                  .delete();
                              db
                                  .collection(
                                      "/Usuaris/${FirebaseAuth.instance.currentUser!.uid}/Favorits")
                                  .doc(llista![index].name)
                                  .delete();
                              favorits!.remove(llista![index]);
                              llibreria!.remove(llista![index]);
                            } else if (mode_favorit) {
                              db
                                  .collection(
                                      "/Usuaris/${FirebaseAuth.instance.currentUser!.uid}/Favorits")
                                  .doc(llista![index].name)
                                  .delete();
                              favorits!.remove(llista![index]);
                            } else {
                              db
                                  .collection(
                                      "/Usuaris/${FirebaseAuth.instance.currentUser!.uid}/Wishlist")
                                  .doc(llista![index].name)
                                  .delete();
                              wishlist!.remove(llista![index]);
                            }
                          });
                        },
                        icon: Icon(Icons.cancel_outlined),
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
                              child: Text(llista![index].name,
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
            );
          },
          itemCount: llista!.length,
        ),
      ),
    );
  }
}
