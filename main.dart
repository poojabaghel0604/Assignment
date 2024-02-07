import 'package:flutter/material.dart';
import 'package:assignment/Pages/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'location/FindLocation.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAVCjlPAiZbZF_t7v6CUTwPbskkCPepUMo",
          projectId: "aissignment-81665",
          messagingSenderId: "216858088433",
          appId: "1:216858088433:web:69708f5683703b1f3cea50",
      )
  );
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColorDark: Colors.deepPurpleAccent,
          primaryIconTheme: IconThemeData(color: Colors.black),
          appBarTheme: AppBarTheme()
      ),
      home: Home(),
    );
  }
}


