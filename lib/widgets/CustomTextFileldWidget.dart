import 'package:flutter/material.dart';
import 'package:noteapp/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.minLines,
    this.maxLines,
    required this.labelColor,
    this.borderColor,
    this.textInputType,
    this.onChanged,
    required this.hintText,
    required this.labelText,
    this.controller, this.onSaved,
  });

  final String hintText;
  final String labelText;
  final TextInputType? textInputType;
  final ValueChanged<String>? onChanged;
  final Color? borderColor;
  final Color labelColor;
  final int? minLines;
  final int? maxLines;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return TextFormField(
      onSaved: onSaved,
      controller: controller,
      validator: (value) => value?.isEmpty ?? true ? 'This Field is required' : null,
      minLines: minLines,
      maxLines: maxLines,
      keyboardType: textInputType,
      onChanged: onChanged,
      cursorColor: kprimaryColor,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: TextStyle(color: Colors.grey.shade500),
        labelStyle: TextStyle(color: labelColor),
        border: _buildBorder(borderColor ?? (isDarkMode ? Colors.white70 : Colors.black54)),
        enabledBorder: _buildBorder(borderColor ?? (isDarkMode ? Colors.white70 : Colors.black54)),
        focusedBorder: _buildBorder(kprimaryColor),
      ),
    );
  }

  OutlineInputBorder _buildBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color,
        width: 1.5,
      ),
    );
  }
}