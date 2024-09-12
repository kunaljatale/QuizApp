import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart'as http;

// var link ="https://opentdb.com/api.php?amount=20";

getQuiz() async{
  var response= await http.get (Uri.parse("https://opentdb.com/api.php?amount=20") );
 if (response.statusCode==200){
  var data =jsonDecode(response.body.toString());
  print("data is loaded");
  return data;
 }
  
}