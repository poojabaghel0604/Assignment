import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../funtions/CrudFuctions.dart';

class MyData {
  final String name;
  final String tittle;
  final String description;

  MyData({required this.name,required this.tittle, required this.description});

  factory MyData.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return MyData(
      name: data["Name"]??'',
      tittle: data["Tittle"] ?? '',
      description: data["Description"] ?? '',
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Person').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          final List<MyData> dataList = snapshot.data!.docs.map((doc) => MyData.fromFirestore(doc)).toList();
          return ListView.builder(
            itemCount: dataList.length,
            itemBuilder: (context, index) {
              final data = dataList[index];
              return ListTile(
                focusColor: Colors.grey,
                textColor: Colors.purple,
                leading: Icon(Icons.person),
                title: Text(data.tittle),
                subtitle: Text(data.description),
                trailing: IconButton(onPressed: (){
                }, icon: Icon(Icons.delete_forever),color: Colors.purple,),
              );
            },
          );
        },
      ),
    );
  }
}

