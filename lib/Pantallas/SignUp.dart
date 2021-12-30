// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_string_interpolations, non_constant_identifier_names, curly_braces_in_flow_control_structures

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projecte/Pantallas/HomeNavigatorBar.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController controller_nom, controller_contrasenya;

  List<String> ListaGeneros = [
    "Action",
    "Adventure",
    "Indie",
    "Terror",
    "Plataforms",
    "Shooter",
    "Metroidvania",
    "RPG"
  ];
  List<String> ListaAssetsGeneros = [
    "http://www.universodestiny.com/wp-content/uploads/2014/11/destiny42.jpg",
    "https://www.latercera.com/resizer/Zss52obZQC1z2agF9shIF6gh6as=/arc-anglerfish-arc2-prod-copesa/public/4LDOGMGZBBGITMTKXLDLFLFRUI.jpg",
    "https://as01.epimg.net/meristation/imagenes/2021/04/21/header_image/91209951618993100.jpg",
    "https://www.tuplaystation.es/wp-content/uploads/2019/01/capcom-resident-evil-2-more-remakes-leon-claire.jpg.optimal-980x600.jpg",
    "https://img.redbull.com/images/c_crop,x_0,y_12,h_607,w_1079/c_fill,w_830,h_553/q_auto,f_auto/redbullcom/2017/02/13/1331844657500_2/super-mario-odyssey-video-juego",
    "https://storage.googleapis.com/www-factornueve-com/2021/11/2ba35354-releasing-halo-infinite-on-steam-looks-like-a-very-good-deci_9s3k.jpeg",
    "https://asset.vg247.com/metroid_dread_061521.jpg/BROK/thumbnail/1200x1200/quality/100/metroid_dread_061521.jpg",
    "https://cdn2.unrealengine.com/egs-finalfantasyviiremakeintergrade-squareenix-g1a-00-1920x1080-b525c7bd9fb7.jpg?h=720&resize=1&w=1280"
  ];

  @override
  void initState() {
    super.initState();
    controller_contrasenya = TextEditingController(
      text: "Enter your password",
    );
    controller_nom = TextEditingController(
      text: "Enter your email",
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
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "User email: ",
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
                    "Password:",
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
                    "Favourite genre:",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: GridGenres(
                        ListaAssetsGeneros: ListaAssetsGeneros,
                        ListaGeneros: ListaGeneros),
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
                              builder: (context) => HomeNavigatorBar()));
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

class GridGenres extends StatelessWidget {
  const GridGenres({
    Key? key,
    required this.ListaAssetsGeneros,
    required this.ListaGeneros,
  }) : super(key: key);

  final List<String> ListaAssetsGeneros;
  final List<String> ListaGeneros;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
                      image: NetworkImage("${ListaAssetsGeneros[i]}"),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                      fit: BoxFit.cover),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
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
    );
  }
}
