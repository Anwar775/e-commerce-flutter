// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class CostumeTextForm extends StatefulWidget {
  final String hinttext;
  final TextEditingController mycontroller;
  final isPassword;
  final IconButtonUse; //new
  const CostumeTextForm(
      {super.key, required this.hinttext, required this.mycontroller,required this.isPassword, this.IconButtonUse});

  @override
  State<CostumeTextForm> createState() => _CostumeTextFormState();
}

class _CostumeTextFormState extends State<CostumeTextForm> {
 //isPassword
  final passwordvisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: widget.mycontroller,
      decoration: InputDecoration(
        hintText: widget.hinttext,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
        contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
          borderSide: BorderSide(color: Color.fromARGB(255, 184, 184, 184)),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
            borderSide: BorderSide(color: Color.fromARGB(255, 190, 190, 190))),
      ),
    );
  }
}
