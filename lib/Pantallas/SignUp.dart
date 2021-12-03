import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projecte/Pantallas/HomeScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController controller_nom, controller_contrasenya;
  List<String> ListaGeneros = [
    "Acció",
    "Aventura",
    "Indie",
    "Terror",
    "Plataformas",
    "Shooter",
    "Metroidvania",
    "RPG"
  ];

  @override
  void initState() {
    super.initState();
    controller_contrasenya = TextEditingController(
      text: "Introdueixi contrasenya",
    );
    controller_nom = TextEditingController(
      text: "Introduexi nom usuari",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/home_screen2.png"),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.6), BlendMode.darken),
                    fit: BoxFit.cover)),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 45),
                  Center(
                    child: Text(
                      "Crea un compte",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Nom usuari: ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    decoration:
                        InputDecoration(fillColor: Colors.white, filled: true),
                    controller: controller_nom,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Contrasenya:",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    decoration:
                        InputDecoration(fillColor: Colors.white, filled: true),
                    controller: controller_contrasenya,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Gènere preferit:",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, i) {
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
                                  image: DecorationImage(
                                      image: AssetImage("assets/$i.png"),
                                      colorFilter: ColorFilter.mode(
                                          Colors.black.withOpacity(0.5),
                                          BlendMode.darken),
                                      fit: BoxFit.cover),
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Center(
                                child: Text("${ListaGeneros[i]}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              )),
                        );
                      },
                      itemCount: 8,
                    ),
                  ),
                  /*Spacer(),
                  StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .doc("/Usuaris/ExYheH7yzBNlS8VpcWgzSGAdGnq2")
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
                      return Text(
                        "${data['name']}, ${data['genere_preferit']}",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      );
                    },
                  ),*/
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                        },
                        child: Text("Play!",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.grey[900],
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            shape: StadiumBorder()),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
