import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
            )
          ],
        ),
        body: Center(
          child: Text(user.email.toString()),
        ),
      ),
    );
  }
}

  /*StreamBuilder(
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