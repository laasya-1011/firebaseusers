//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseusers/LoginScreen.dart';
import 'package:flutter/material.dart';
//import 'package:google_sign_in/google_sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color primaryColor = Color(0xff1C133B);
  Color secondaryColor = Color(0xff232c51);
  Color logoGreen = Color(0xff25bcbb);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //We take the image from the assets
            CircleAvatar(
              radius: 70,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/phone.jpeg',
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //Texts and Styling of them
            Text(
              'Welcome to WIDLE !',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
            SizedBox(height: 20),
            Text(
              'A one-stop portal for you to learn the latest technologies from SCRATCH',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white, fontSize: 16, fontFamily: 'Poppins'),
            ),
            SizedBox(
              height: 30,
            ),

            //LoginScreen
            MaterialButton(
              elevation: 0,
              height: 50,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LoginScreen()));
              },
              color: logoGreen,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Get Started',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}

// _signinGoogle() async {
//   final GoogleSignInAccount googleUser = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//   final AuthCredential credential = GoogleAuthProvider.getCredential(
//       accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
//   final FirebaseUser firebaseUser =
//       (await firebaseAuth.signInWithCredential(credential)).user;
// }
