import 'package:sportstracker/models/sport.dart';
import 'package:flutter/material.dart';



  List<Sport> sports=
  [
      Sport(id: 'c1',
            icon: Icons.sports_cricket,
            title: "Cricket",
            color: const Color.fromARGB(255, 44, 160, 255)),
      Sport(id: 'c2', 
            icon: Icons.sports_soccer_outlined, 
            title: "Football", 
           color:const Color.fromARGB(255, 241, 139, 6)),
      Sport(id: 'c3', 
            icon: Icons.drive_eta_rounded, 
            title: "Formula 1", 
            color: const Color.fromARGB(255, 219, 7, 7)),
           ];