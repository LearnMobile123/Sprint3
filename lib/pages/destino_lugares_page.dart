import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project_app/pages/detail_lugares_page.dar.dart';
import 'package:project_app/pages/view.dart';

class DestinoLugaresPage extends StatefulWidget {
  const DestinoLugaresPage({Key? key}) : super(key: key);

  @override
  State<DestinoLugaresPage> createState() => _DestinoLugaresPageState();
}

class _DestinoLugaresPageState extends State<DestinoLugaresPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("lugares")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading');
            return ListView.builder(
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                QueryDocumentSnapshot lugar = snapshot.data!.docs[index];
                return Card(
                    child: ListTile(
                      leading: Image.network(
                          lugar['url picture'] ?? "",
                           errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                            return const Image(image: AssetImage('assets/images/logo.png'),
                            );
                           },
                      ),
                      title: Text(lugar['name']),
                      subtitle: Text(lugar['addres']),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailLugaresPage(lugar)));
                      },
                    ));
              },
            );
          },
        ),
      ),
    );
  }
}
