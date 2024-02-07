import 'package:assignment/Pages/ReadPage.dart';
import 'package:flutter/material.dart';
import 'package:assignment/Pages/CrudPage.dart';

import '../location/FindLocation.dart';
import '../pdf/pdfGenrator.dart';
import '../tectSppech/TextToSpeech.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(onPressed:()async{
            //await FirebaseAuth.instance.signOut();
          }, icon: Icon(Icons.person))
        ],
      ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            //create("pets","bully","bully","bull",10);
            Navigator.push(context, MaterialPageRoute(builder:(context)=>Crud()));
          }, child: Text("Data Base Queries")),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          }, child: Text("Find Loation")),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            //delete('pets', 'pets');
          }, child: Text("Get Screens")),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            QuotationTemplate();
          }, child: Text("Generate PDF")),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            TextToSpeechReminder();
          }, child: Text("Text to Speech")),
          SizedBox(height: 20,),
        ],),),
    );
  }
}