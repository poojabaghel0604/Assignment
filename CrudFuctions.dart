import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

create(String collName,docName,tittle,discription,)async{
  await FirebaseFirestore.instance
      .collection(collName)
      .doc(docName)
      .set({"Description":discription,"Tittle":tittle});
      print("data base created");
}

update(String collName,docName,field,var newfieldValue)async{
  await FirebaseFirestore.instance
      .collection(collName)
      .doc(docName)
      .update({field:newfieldValue});
  print("data base updated");
}

delete(String collName,docName)async{
  await FirebaseFirestore.instance
      .collection(collName)
      .doc(docName).delete();
  print("database deleted");
}