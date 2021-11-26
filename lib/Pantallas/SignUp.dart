import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController controller_nom,
      controller_contrasenya,
      controller_email;

  @override
  void initState() {
    super.initState();
    controller_contrasenya = TextEditingController(
      text: "Introdueix contrassenya",
    );
    controller_email = TextEditingController(
      text: "Introdueix email",
    );
    controller_nom = TextEditingController(
      text: "Introdueix nom usuari",
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
                    image: AssetImage("assets/home_screen.png"),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.darken),
                    fit: BoxFit.cover)),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Scrollbar(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 40),
                      child: Center(
                        child: Text(
                          "Crea un compte",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Text(
                      "Nom: ",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white, filled: true),
                      controller: controller_nom,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Email:",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white, filled: true),
                      controller: controller_nom,
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
