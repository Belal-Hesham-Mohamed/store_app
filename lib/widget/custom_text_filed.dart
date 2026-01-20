import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.onChanged,
    this.hintText,
     this.obscureText=false,
    this.keyboardType,
    this.inputFormatters,
  });

  String? hintText;
  bool? obscureText;
  Function(String)? onChanged;
  TextInputType? keyboardType;
    List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        obscureText: obscureText!,
        onChanged: onChanged,
        inputFormatters: [ 
          if (inputFormatters != null) ...inputFormatters!,
        ],
       
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 63, 86, 42),
              width: 3,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.green,
              width: 3,
            ),
          ),
        ),
      ),
    );
  }
}
