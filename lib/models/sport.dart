import 'package:flutter/material.dart';

//class model for a Sport item 
class Sport{

Sport(
  {
    required this.id,
    required this.icon,
    required this.title,
    required this.color
    });
    
  final String id;
  final IconData icon;
  final String title;
  final Color color;
  
}