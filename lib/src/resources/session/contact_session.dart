import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  Contact({super.key});
  @override
  _Contact createState() => _Contact();
}

class _Contact extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Hello, Contacts!"),);
  }
}