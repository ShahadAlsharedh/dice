import 'dart:math';
import 'package:flutter/material.dart';

class Dice extends StatefulWidget{
  const Dice ({super.key});
  
  @override
  State<Dice> createState()=> _DiceState();

  }

class _DiceState extends State<Dice> {

  int rightD = 3;
  int leftD = 5;
  int score = 0;
  int maxscore = 0;

  void changedice(){
    setState(() {
      rightD = Random().nextInt(6)+1;
      leftD = Random().nextInt(6)+1;
      
    });
  }

  void equal(){
    setState(() {
      if (rightD==leftD) {
        score++;
        changedice();
      }
      else {
        maxscore= max(score, maxscore);
        changedice();
        score=0;
      }
    });
  }

  void notequal(){
    setState(() {
      if (rightD!=leftD) {
        score++;
        changedice();
      }
      else {
        maxscore= max(score, maxscore);
        changedice();
        score=0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changedice,
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 106, 38, 123),
        appBar: AppBar(
          title: const Text('Dice Game'),
          backgroundColor: Color.fromARGB(255, 106, 38, 123),
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(children: [
              Expanded(
                child: Padding
              (padding: const EdgeInsets.all(12.0),
              child: Image.asset("assets/images/dice${rightD}.png"),
               )
               ),
                Expanded(
                child: Padding
              (padding: const EdgeInsets.all(12.0),
              child: Image.asset("assets/images/dice${leftD}.png"),
               )
               ),
               
               
            ],
            ),
            const SizedBox(height: 50),
            Row (children: [
              Expanded(child: TextButton(
                onPressed: equal,
                child: const Text("Equal",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
                )
              )),
              Expanded(child: TextButton(
                onPressed: notequal,
                child: const Text(
                  "Not Equal",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                )
              ))
            ],
            ),
            const SizedBox(height: 50),
            Text(
              "Score: $score",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
            ),
               const SizedBox(height: 50),
            Text(
              "Max Score: $maxscore",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
            )
          ]),
         
      )
    );
  }
  
}


  
