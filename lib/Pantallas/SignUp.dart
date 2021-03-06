import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projecte/Pantallas/HomeNavigatorBar.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController controller_nom;

  List<String> ListaGeneros = [
    "action",
    "adventure",
    "strategy",
    "puzzle",
    "racing",
    "shooter",
    "sports",
    "rpg"
  ];
  List<String> ListaAssetsGeneros = [
    "http://www.universodestiny.com/wp-content/uploads/2014/11/destiny42.jpg",
    "https://www.latercera.com/resizer/Zss52obZQC1z2agF9shIF6gh6as=/arc-anglerfish-arc2-prod-copesa/public/4LDOGMGZBBGITMTKXLDLFLFRUI.jpg",
    "https://esports.as.com/2019/04/15/clash-royale/avecinan-cambios-Clash-Royale_1236486348_196294_1440x810.jpg",
    "https://as01.epimg.net/meristation/imagenes/2020/07/06/noticias/1594034529_729660_1594034585_noticia_normal.jpg",
    "https://digitalnewsqr.com/wp-content/uploads/2021/11/E9k1DrkWUAc8Tx1.jpeg",
    "https://storage.googleapis.com/www-factornueve-com/2021/11/2ba35354-releasing-halo-infinite-on-steam-looks-like-a-very-good-deci_9s3k.jpeg",
    "https://i.pinimg.com/originals/8f/79/29/8f792971fbbd1264ebc0a076f558c6ad.jpg",
    "https://cdn2.unrealengine.com/egs-finalfantasyviiremakeintergrade-squareenix-g1a-00-1920x1080-b525c7bd9fb7.jpg?h=720&resize=1&w=1280"
  ];

  @override
  void initState() {
    super.initState();
    controller_nom = TextEditingController(
      text: "",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          SignUpContainer(
              controller_nom: controller_nom,
              ListaAssetsGeneros: ListaAssetsGeneros,
              ListaGeneros: ListaGeneros)
        ],
      ),
    );
  }
}

class SignUpContainer extends StatelessWidget {
  const SignUpContainer({
    Key? key,
    required this.controller_nom,
    required this.ListaAssetsGeneros,
    required this.ListaGeneros,
  }) : super(key: key);

  final TextEditingController controller_nom;
  final List<String> ListaAssetsGeneros;
  final List<String> ListaGeneros;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45),
            Center(
              child: Text(
                "Let's start!",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "User nickname: ",
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
                fillColor: Colors.white,
                filled: true,
                hintText: "Enter your nickname",
                suffix: GestureDetector(
                  child: Icon(
                    Icons.close,
                    size: 20,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    controller_nom.clear();
                  },
                ),
              ),
              controller: controller_nom,
            ),
            SizedBox(height: 10),
            Text(
              "Favorite genre:",
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
            Padding(
              padding: const EdgeInsets.all(15),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    final db = FirebaseFirestore.instance;
                    db
                        .doc(
                            "/Usuaris/${FirebaseAuth.instance.currentUser!.uid}")
                        .update({'nom_usuari': "${controller_nom.text}"});
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeNavigatorBar()));
                  },
                  child: Text("Play!",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey[900],
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      shape: StadiumBorder()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GridGenres extends StatefulWidget {
  const GridGenres({
    Key? key,
    required this.ListaAssetsGeneros,
    required this.ListaGeneros,
  }) : super(key: key);

  final List<String> ListaAssetsGeneros;
  final List<String> ListaGeneros;

  @override
  State<GridGenres> createState() => _GridGenresState();
}

class _GridGenresState extends State<GridGenres> {
  List<bool> opacity = [false, false, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, i) {
        return Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                final db = FirebaseFirestore.instance;
                opacity = [
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                  false,
                  false
                ];
                opacity[i] = true;
                db
                    .doc("/Usuaris/${FirebaseAuth.instance.currentUser!.uid}")
                    .set({'genere_preferit': "${widget.ListaGeneros[i]}"});
              });
            },
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
                        image: NetworkImage("${widget.ListaAssetsGeneros[i]}"),
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(opacity[i] ? 0 : 0.5),
                            BlendMode.darken),
                        fit: BoxFit.cover),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Center(
                  child: Text("${widget.ListaGeneros[i]}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                )),
          ),
        );
      },
      itemCount: 8,
    );
  }
}
