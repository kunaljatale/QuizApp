import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_app/Constant/Colors.dart';
import 'package:responsive_app/Constant/Images.dart';
import 'package:responsive_app/quizScreen.dart';
import 'package:responsive_app/text_style.dart';

void main(){
  runApp(App());
}


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const QuizApp(),
      title: "Demo",
    );

  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    
    var  size= MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Blue,darkBlue
            ]),
            
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            
            border: Border.all(color: lightgrey, width: 3)
          ),
          child: IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.xmark, color: Colors.white,size: 28 ,))
          ),
          Center(child: Image.asset(balloon2, height: 300,)),
          SizedBox(height: 20,),
          Center(child: normalText(color: lightgrey,size: 15,text: "Welcome to our")),
          Center(child: HadingText(color: Colors.white,size: 32,text: "Quiz App")),
          SizedBox(height: 20,),
          Center(child: normalText(color: lightgrey,size:13,text: "Do you feel confident ?" )),
          Spacer(


          ),

          Align(
            alignment: Alignment.center,
            child: MouseRegion(
cursor: SystemMouseCursors.click,
              child: GestureDetector(
                         onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Quizscreen() ));
                         } ,
                child: Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: size.width-100,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,borderRadius:BorderRadius.circular(10),
                
                  ),
                  child: HadingText(color: Blue,size: 18,text: "continue" ) ,
                ),
              ),
            ),
          )
            ],
          ),
        ),
      ),
    );
  }
}