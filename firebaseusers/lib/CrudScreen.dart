import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CrudScreen extends StatefulWidget {
  @override
  _CrudScreenState createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  Map users;
  addData() {
    Map<String, dynamic> demoData = {
      'name': 'Widle Studio',
      'motto': 'Creating Innovative Mobile Apps'
    };
    CollectionReference collection = Firestore.instance.collection('users');
    collection.add(demoData);
  }

  fetchData() {
    CollectionReference collection = Firestore.instance.collection('users');
    collection.snapshots().listen((snapshot) {
      setState(() {
        users = snapshot.documents[0].data;
      });
    });
  }

  updateData() async {
    CollectionReference collection = Firestore.instance.collection('users');
    QuerySnapshot querySnapshot = await collection.getDocuments();
    querySnapshot.documents[0].reference.updateData(
        {'name': 'Google', 'motto': 'Innovative Mobile Development'});
  }

  deleteData() async {
    CollectionReference collection = Firestore.instance.collection('users');
    QuerySnapshot querySnapshot = await collection.getDocuments();
    querySnapshot.documents[0].reference.delete();
  }

  final Color primaryColor = Color(0xff050228);
  final Color secondaryColor = Color(0xff232c51);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.blue,
      body: Container(
        width: width,
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'CRUD OPERATIONS ON CLOUD FIRESTORE',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.openSans(color: Colors.white, fontSize: 28),
                ),
                SizedBox(
                  height: 70,
                ),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 40,
                  onPressed: fetchData,
                  color: Colors.green[500],
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 5),
                    height: 30,
                    width: width,
                    decoration: BoxDecoration(color: Colors.green[500]),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text('Fetch Data',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 1)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 40,
                  onPressed: addData,
                  color: Colors.pink[600],
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 82, vertical: 5),
                    height: 30,
                    width: width,
                    decoration: BoxDecoration(color: Colors.pink[600]),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text('Add Data',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 1)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 40,
                  onPressed: updateData,
                  color: Colors.yellow[600],
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 73, vertical: 5),
                    height: 30,
                    width: width,
                    decoration: BoxDecoration(color: Colors.yellow[600]),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text('Update Data',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            letterSpacing: 1)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 40,
                  onPressed: deleteData,
                  color: Colors.amber[900],
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 82, vertical: 5),
                    height: 30,
                    width: width,
                    decoration: BoxDecoration(color: Colors.amber[900]),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text('Delete Data',
                        style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  users['name'].toString(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              ]),
        ),
      ),
    );
  }
}
