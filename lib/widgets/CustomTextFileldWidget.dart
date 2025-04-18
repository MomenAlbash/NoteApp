

import 'dart:async';

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    this.minLines,this.maxLines,
    required this.labelColor,
    required this.borderColor,
    this.textInputType,
    this.onchange, required this.hintText,
    required this.labelText,
    this.controller
  }) ;
  final String hintText;
  final String labelText;
  final TextInputType? textInputType;
  Function(String)? onchange;
  final Color borderColor;
  final Color labelColor;
  final int? minLines;
  final int? maxLines;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      validator: (value) {
        if(value==null||value.isEmpty){
          return 'This Field is required';
        }else{
          return null;
        }
      },
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: textInputType,
      onChanged: onchange,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: labelColor),
        enabled: true,
        focusedBorder :OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        errorBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ) ,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
