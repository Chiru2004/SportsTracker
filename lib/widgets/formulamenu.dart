import 'package:flutter/material.dart';

// This is a Flutter widget called FormulaMenu to .
class FormulaMenu extends StatelessWidget {
  // Constructor for FormulaMenu, taking two required parameters: heading and onselectButton.
 const FormulaMenu({super.key, required this.heading, required this.onselectButton});

  final String heading;               // The text displayed in the menu item.
  final void Function() onselectButton;     // A callback function to be executed when the menu item is tapped.

  @override
  Widget build(BuildContext context) {
    // This widget returns an InkWell that represents a menu item.

    return InkWell(
      onTap: onselectButton,           // Define the function to execute when the menu item is tapped.
      splashColor: Colors.red,         // Define the splash color.

      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),   // Set horizontal margin for the container.
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 255, 73, 60).withOpacity(0.9),  // Define a gradient color.
              const Color.fromARGB(255, 126, 2, 2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(11.0)),  // Apply rounded corners to the container.
        ),
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),  // Set padding 
        child: Text(
          heading,  // Display the heading text inside the menu item.
          style: const TextStyle(color: Colors.white, fontSize: 25),  
        ),
      ),
    );
  }
}