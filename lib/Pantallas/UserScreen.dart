import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:projecte/Pantallas/Signin.dart';

class UserScreen extends StatelessWidget {
  late String titol = "USER";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
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
      ),*/

      //backgroundColor: Colors.grey[850],
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
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(
                      Icons.person_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    "User",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              UserDataContainer(
                texto: "User's Name",
              ),
              UserDataContainer(
                texto: "Email",
              ),
              UserDataNumContainer(text: "Games", num: 10),
              UserDataNumContainer(text: "Favorites", num: 7),
              SizedBox(height: 200),
              RaisedButton(
                onPressed: (/*logout*/) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => (SignIn()),
                    ),
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
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
                    style: TextStyle(
                        fontSize: 15,
                        //backgroundColor: Colors.grey,
                        color: Colors.white),
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
