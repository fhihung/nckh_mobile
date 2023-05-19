import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lab_management/constant.dart';

class AddBookScreen extends StatefulWidget {
  @override
  _AddBookScreenState createState() => _AddBookScreenState();
}

class _AddBookScreenState extends State<AddBookScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _authorController = TextEditingController();
  final _publisherController = TextEditingController();
  final _publicationYearController = TextEditingController();
  final _quantityController = TextEditingController();
  final _descriptionController = TextEditingController();

  Future<void> _addBook() async {
    final response = await http.post(
      Uri.parse('http://localhost:9000/books/add'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        'title': _titleController.text,
        'author': _authorController.text,
        'publisher': _publisherController.text,
        'publicationYear': int.tryParse(_publicationYearController.text) ?? 0,
        'quantity': int.tryParse(_quantityController.text) ?? 0,
        'description': _descriptionController.text,
      }),
    );

    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Add Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(labelText: 'Author'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter an author';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _publisherController,
                decoration: InputDecoration(labelText: 'Publisher'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a publisher';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _publicationYearController,
                decoration: InputDecoration(labelText: 'Publication Year'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: null,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                child: Text('Add Book'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _addBook();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
