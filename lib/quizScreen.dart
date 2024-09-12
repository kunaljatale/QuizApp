import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_app/Apis.dart';
import 'package:responsive_app/Constant/Colors.dart';
import 'package:responsive_app/Constant/Images.dart';
import 'package:responsive_app/text_style.dart';

class Quizscreen extends StatefulWidget {
  const Quizscreen({super.key});

  @override
  State<Quizscreen> createState() => _QuizscreenState();
}

class _QuizscreenState extends State<Quizscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quiz=getQuiz();
    starttimer();
  } 
  @override
  void dispose() {
timer!.cancel();
    super.dispose();
    // starttimer();
  }   
 
  int second=60;
  int currentQusNomber=0;
  var optionsList=[];

  var optionsColors=[
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,

  ];
   
   resetcolors(){
   optionsColors=[
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,
  Colors.white,

  ];
   }



Timer?timer;
var isLoaded=false;
 late Future quiz;
  starttimer(){
   timer=Timer.periodic(Duration(seconds: 1), (timer){
setState(() {
if(second>0){
  second--;

}
else{
  timer.cancel();
}

});
   });
  }
  


  @override
  Widget build(BuildContext context) {
  var  size= MediaQuery.of(context).size;

    return Scaffold(

      body: SafeArea(child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
          ,colors: [Blue,darkBlue],
          )
        ),
     child: FutureBuilder(future: quiz , builder: (context, AsyncSnapshot snapshot){
      if(snapshot.hasData){
  var data =snapshot.data["results"];
        if(isLoaded==false){
optionsList=data[currentQusNomber]["incorrect_answers"];
 optionsList.add(data[currentQusNomber]["correct_answer"]);
 optionsList.shuffle();
 isLoaded=true;




        }
  return SingleChildScrollView(
      
       child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(50),
                  border: Border.all(color: lightgrey,width: 2), 
                ),
                child: 
                IconButton(onPressed: (){
                  Navigator.pop(context);
                },
                 icon: Icon(CupertinoIcons.xmark,color: Colors.white,size: 28,)
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  normalText(color: Colors.white,size: 24,text: "$second"),
                  
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(value: second/60,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  )
                ],
              ),
             Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: lightgrey,width: 2),
                // color: Colors.white,
              ),
              child: TextButton.icon(
                onPressed: null,
                icon: Icon(CupertinoIcons.heart_fill,color: Colors.white,size: 18,),
                label: normalText(color: Colors.white,size: 14,text: "Like"),
              ) ,
             ) 
            ],
          ),
          SizedBox(height: 20,),
          Image.asset(ideas,width: 200,),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerLeft,
            child: normalText(color: lightgrey,size: 18,text: "Question${currentQusNomber+1} of ${data.length}" ),
          ),
            SizedBox(height: 20,),
            normalText(color: Colors.white,size: 20,text:data[currentQusNomber]["question"]  ),
            SizedBox(height: 40,),

       ListView.builder(
         shrinkWrap: true,
         itemCount: optionsList.length,
         itemBuilder: (BuildContext context,int index){
          var answer=data[currentQusNomber]["correct_answer"];
           return GestureDetector(
            onTap: (){
               if(answer.toString()==optionsList[index].toString()){
                optionsColors[index]=Colors.green;
               }
       else{
        optionsColors[index]=Colors.red;
       }
               if(currentQusNomber<data.length-1){
                Future.delayed(Duration(seconds: 1 ),(){
       isLoaded=false;

               currentQusNomber++;
               resetcolors();
                timer!.cancel();
                 starttimer();
                second=60;
                });
               }else{
                timer!.cancel();
               }
            },
             child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: size.width-100,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: optionsColors[index],borderRadius:BorderRadius.circular(10),
                  
                    ),
                    child: HadingText(color: Blue,size: 18,text: optionsList[index].toString() ) ,
                  ),
           );
         })
        ],
       
       ),
     );
 
      }  else{
        return Center(child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.white) ,
        ));
      }
      

     }  )
     
          ) 
      ) ,
    );
    
    
     
  }
}