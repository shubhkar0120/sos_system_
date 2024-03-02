import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sos_system/screens/homescreen.dart';
import 'package:sos_system/screens/splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';


var firebaseOptions = FirebaseOptions(
  apiKey: "AIzaSyBmffkZGfrSPcoCEAT4lxQ0TIPpnZW6fXk",
  appId: "1:376497811929:android:464cbf245480ec3b22a9c8",
  messagingSenderId: "com.example.sos_system",
  projectId: "sossystem-e01f8",
);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: firebaseOptions);

  User? user = FirebaseAuth.instance.currentUser;
  
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  final User? user;
  MyApp({Key? key, this.user}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: user != null ? HomeScreen() : Splashscreen(),
    );
  }
}
