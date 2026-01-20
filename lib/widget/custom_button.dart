import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
   CustomButton({super.key, this.onTap, required this.text});
String text;
VoidCallback?  onTap;
  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        
        child: Container(width: double.infinity,
                  height: 30,
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(12
                    ) ,
                    
                    color: const Color.fromARGB(255, 54, 61, 54),
                    ),
                    child: Center(
                      child: Text(
                        text,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 142, 119, 119),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}