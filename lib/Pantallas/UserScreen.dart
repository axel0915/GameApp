import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projecte/widgets/Joc.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<Joc>? llibreria = [];
  List<Joc>? favorits = [];
  List<Joc>? wishlist = [];

  List<Joc>? llista;

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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_rounded,
              size: 40,
              color: Colors.white,
            ),
            Text(
              "User",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey[900],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/home_screen2.png"),
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.6), BlendMode.darken),
                fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 35, 25, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 100),
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .doc("/Usuaris/${FirebaseAuth.instance.currentUser!.uid}")
                    .snapshots(),
                builder: (
                  BuildContext context,
                  AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                      snapshot,
                ) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final doc = snapshot.data!;
                  final data = doc.data()!;

                  return Column(
                    children: [
                      UserDataContainer(
                        texto: "${data['nom_usuari']}",
                      ),
                      UserDataContainer(
                        texto: "${FirebaseAuth.instance.currentUser!.email}",
                      ),
                      UserDataNumContainer(
                          text: "Games",
                          num: llibreria == null ? 0 : llibreria!.length),
                      UserDataNumContainer(
                          text: "Favorites",
                          num: favorits == null ? 0 : favorits!.length),
                      UserDataNumContainer(
                          text: "Wishlist",
                          num: wishlist == null ? 0 : wishlist!.length),
                    ],
                  );
                },
              ),
              SizedBox(height: 200),
              RaisedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Log out",
                      style: TextStyle(fontSize: 25),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.logout_rounded),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserDataNumContainer extends StatelessWidget {
  final String? text;
  final int num;
  const UserDataNumContainer({
    required this.text,
    required this.num,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '$text',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(color: Colors.grey),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    '$num',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.5,
            height: 1,
          ),
        ],
      ),
    );
  }
}

class UserDataContainer extends StatelessWidget {
  final String? texto;
  const UserDataContainer({
    required this.texto,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '$texto',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.5,
            height: 1,
          ),
        ],
      ),
    );
  }
}
