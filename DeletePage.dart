import 'package:flutter/material.dart';

import '../funtions/CrudFuctions.dart';
import 'CrudPage.dart';
import 'ReadPage.dart';

class deleteData extends StatefulWidget {
  @override
  _deleteDataState createState() => _deleteDataState();
}

class _deleteDataState extends State<deleteData> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('delete Data Form database'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save data to Firestore or Realtime Database
                    String name = _nameController.text;
                    String title = _titleController.text;
                    String description = _descriptionController.text;
                    delete("Person",title);

                    Navigator.pop(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                    // Save or process data here
                    // For example, you can save data to Firebase Firestore
                    // FirebaseFirestore.instance.collection('your_collection').add({
                    //   'name': name,
                    //   'title': title,
                    //   'description': description,
                    // });
                    // Then you can navigate to another screen or perform any other action
                    // Navigator.pop(context);
                  }
                },
                child: Text('delete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

