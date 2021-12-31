// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projecte/Pantallas/SignUp.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late TextEditingController controller_nom, controller_contrasenya;

  @override
  void initState() {
    super.initState();
    controller_contrasenya = TextEditingController(
      text: "",
    );
    controller_nom = TextEditingController(
      text: "",
    );
  }

  @override
  Widget build(BuildContext context) {
    /* final db = FirebaseFirestore.instance;

    db
        .doc("/Usuaris/pauek@pauek.com")
        .set({'genere_preferit': "puzzle", 'nom': "Pau"});

      db
        .collection('/Usuaris')
        .add({'genere_preferit': 'action', 'nom': 'Groucho'});
*/
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/home_screen.png"),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.6), BlendMode.darken),
              fit: BoxFit.cover,
            ),
          ),
          child: SignInContainer(
              email: controller_nom, password: controller_contrasenya)),
    );
  }
}

class SignInContainer extends StatelessWidget {
  final TextEditingController email, password;

  const SignInContainer({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Center(
            child: Text(
              "GAME APP",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 100),
          Text(
            "User email: ",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Enter your Email"),
            controller: email,
          ),
          SizedBox(height: 10),
          Text(
            "Password:",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 5,
          ),
          TextField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Enter your password"),
            controller: password,
          ),
          SizedBox(
            height: 5,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Sign in",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey[900],
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  shape: StadiumBorder()),
            ),
          ),
          SizedBox(height: 30),
          Center(
            child: Text("Don't have an account?",
                style: TextStyle(color: Colors.white, fontSize: 17)),
          ),
          SizedBox(height: 5),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SignUp()));
              },
              child: Text("Sign up",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blueGrey,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  shape: StadiumBorder()),
            ),
          ),
          /*Container(
              decoration: BoxDecoration(color: Colors.white),
              child: IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
              ),
            )*/
        ],
      ),
    );
  }
}
