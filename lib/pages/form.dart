import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'dart:io';

class demo extends StatefulWidget {
  const demo({Key? key}) : super(key: key);

  @override
  _demo createState() => _demo();
}

class _demo extends State<demo> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _itemNameController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;


  void _reset() {
    _nameController.clear();
    _phoneController.clear();
    _emailController.clear();
    _addressController.clear();
    _itemNameController.clear();
    _image = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donate Things'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Add your text fields and buttons here.
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                ),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your address';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _itemNameController,
                decoration: const InputDecoration(
                  labelText: 'gift Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the Gift name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: () async {
              //     _image = await _picker.pickImage(source: ImageSource.gallery);
              //     setState(() {});
              //   },
              //   // child: const Text('Upload Gift Picture'),
              // ),
              // _image != null
              //     ? Image.file(File(_image!.path))
              //     : Container(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () { 
                  CollectionReference collref = FirebaseFirestore.instance.collection('admin');
                  // if (_formKey.currentState!.validate()) {
                    // Process data.
                    collref.add({
                      'name' :_nameController.text,
                      'phone number' : _phoneController.text,
                      'itemName' : _itemNameController.text,
                      'mail' : _emailController.text,
                      'adress' : _addressController.text,
                    }
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Row(
                              children: [
                                Icon(Icons.check, color: Colors.green),
                                SizedBox(width: 10),
                                Text('Donation successful'),
                              ],
                            ),
                          ),
                        );
                        _reset();
                },

                child: const Text('Submit'),
              ),  
              const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _reset,
                    child: const Text('Reset'),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}