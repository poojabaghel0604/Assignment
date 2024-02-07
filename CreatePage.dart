import 'package:flutter/material.dart';

import '../funtions/CrudFuctions.dart';
import 'CrudPage.dart';

class DataForm extends StatefulWidget {
  @override
  _DataFormState createState() => _DataFormState();
}

class _DataFormState extends State<DataForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Data Form'),
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
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
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
                    create("Person",title,title,description);
                    Navigator.pop(context, MaterialPageRoute(builder: (context)=>Crud()));
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
                child: Text('create data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

