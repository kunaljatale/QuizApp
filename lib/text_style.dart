import 'package:flutter/material.dart';
import 'package:responsive_app/Constant/Colors.dart';

Widget normalText(
{
  String ?text, Color?color,double?size
}

){
  return Text(
    text!, style: 
    TextStyle(
      fontSize:size,color: color ),
          );
}
Widget HadingText(
{
  String ?text, Color?color,double?size
}

){
  return Text(
    text!, style: 
    TextStyle(
      fontSize:size,color: color ),
          );
}