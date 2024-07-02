
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_test/pages/login_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:const FirebaseOptions(
      apiKey: "AIzaSyBZF7Zp4f-fHRXVxI-G41ve9BHHkn7C4DU",
      appId: "1:568404344157:android:0849f73482f5e2c564bcb4",
      messagingSenderId: "568404344157",
      projectId: "mytest-8ab18")
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return const MaterialApp(
            title: "Login_firebase",
            debugShowCheckedModeBanner: false,
            home: LoginPage(),
          );
        });
  }
}



