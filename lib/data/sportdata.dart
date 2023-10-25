import 'package:sportstracker/models/sport.dart';  // Import the Sport class.
import 'package:flutter/material.dart';

// Define a list of Sport objects.
List<Sport> sports = [
  Sport(
    id: 'c1',
    icon: Icons.sports_cricket,  // Icon representing Cricket.
    title: "Cricket",            // Title for the Cricket sport.
    color: const Color.fromARGB(255, 44, 160, 255),  // Color associated with Cricket.
  ),
  Sport(
    id: 'c2',
    icon: Icons.sports_soccer_outlined,  // Icon representing Football.
    title: "Football",                   // Title for the Football sport.
    color: const Color.fromARGB(255, 241, 139, 6),  // Color associated with Football.
  ),
  Sport(
    id: 'c3',
    icon: Icons.drive_eta_rounded,  // Icon representing Formula 1.
    title: "Formula 1",             // Title for the Formula 1 sport.
    color: const Color.fromARGB(255, 219, 7, 7),  // Color associated with Formula 1.
  ),
];