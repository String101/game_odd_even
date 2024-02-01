import 'package:flutter/material.dart';
import 'package:game_odd_even/view_model.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class Game extends StatelessWidget {
  const Game({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Selector<viewModel,Tuple2>(
             selector: (context, value) => Tuple2(value.points, value.totalTries),
             builder: (context, value, child) {
               return Text(
                "Points correct : ${value.item1} / ${value.item2} tries",
                style: const TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              );
             },
                
            ),
                      DragTarget<int>(
              onWillAccept: (data) {
                if(!context.read<viewModel>().checkEven(data!)){
                  return true;
                }
                else{
                  context.read<viewModel>().setRandomNumber();
                  return false;
                }
              },
              onAccept: (data) {
                context.read<viewModel>().incrementPoints();
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                color: Colors.green,
                height: 150,
                width: 200,
                child: const Center(
                  child: Text(
                    'Odd',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),
              );
              },
              
            ),
            Selector<viewModel, int>(
              selector: (context, viewModelw) => viewModelw.randomNr,
              builder: (context, value, child) {
                return Draggable<int>(
                  data: value,
                  childWhenDragging: Container(
                    color: Colors.blue.shade100,
                    height: 100,
                    width: 100,
                    child:  Center(
                      child: Text(
                        '$value',
                        style:const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                  feedback: Material(
                    child: Container(
                      color: Colors.grey,
                      height: 100,
                      width: 100,
                      child: Center(
                        child: Text(
                          '$value',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ),
                  ),
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                    width: 100,
                    child: Center(
                      child: Text(
                        '$value',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            DragTarget<int>(
              onWillAccept: (data) {
                if(context.read<viewModel>().checkEven(data!)){
                  return true;
                }
                else{
                  context.read<viewModel>().setRandomNumber();
                  return false;
                }
              },
              onAccept: (data) {
                context.read<viewModel>().incrementPoints();
              },
              builder: (context, candidateData, rejectedData) {
                return Container(
                color: Colors.orange,
                height: 150,
                width: 200,
                child: const Center(
                  child: Text(
                    'Even',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),
              );
              },
              
            ),
          ],
        ),
      )),
    );
  }
}
