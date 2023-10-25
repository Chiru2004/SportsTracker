import 'package:flutter/material.dart';

//A widget to display the Circuit details
class CircuitDetail extends StatelessWidget {

  // Constructor for CircuitDetail, taking two required parameters: title and content.
  const CircuitDetail({super.key, required this.title, required this.content});

  final String title;   // The title of the card.
  final String content; // The content of the card.

  @override
  Widget build(BuildContext context) {
    // This widget returns a SizedBox containing a Card with the provided content.

    return SizedBox(
      width: double.infinity,   // The card takes the full available width.
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),   // Background color of the card.
        margin: const EdgeInsets.all(2),   // Margin around the card.

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Text(title),   // Display the title in the card.
            const SizedBox(height: 2),   
            Center(
              child: Text(
                 content,   // Display the content text.
                style: const TextStyle(fontSize: 29),
              ),
            ),
            const SizedBox(height: 6),   // A 6-pixel vertical space.
          ],
        ),
      ),
    );
  }
}