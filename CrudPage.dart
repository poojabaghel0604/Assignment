import 'package:flutter/material.dart';
//import 'package:firebase_auth/firebase_auth.dart';

import 'package:assignment/funtions/CrudFuctions.dart';

import 'CreatePage.dart';
import 'DeletePage.dart';
import 'ReadPage.dart';

class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        title: Text("Crud Operations"),
        actions: [
          IconButton(onPressed:()async{
            //await FirebaseAuth.instance.signOut();
          }, icon: Icon(Icons.leave_bags_at_home))
        ],
      ),
      body:
      Column(
        children: [Container(height: 500,color: Colors.red,child: MyHomePage(),),
          SizedBox(height: 100,),
          Center(child: Row(
            verticalDirection: VerticalDirection.down,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DataForm()));
              }, child: Text("Create")),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: (){
                update("Person", 'Notes', 'Description','Engineer');
                setState(() {
                  MyHomePage();
                });
              }, child: Text("update")),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>deleteData()));
              }, child: Text("delete")),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>MyHomePage()));

              }, child: Text("read")),
            ],),),
        ],
      ),
    );
  }
}
