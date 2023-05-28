import 'package:flutter/material.dart';

class SampleListView extends StatelessWidget {
   SampleListView({super.key});

  final List colorCodes = [900, 800, 700, 600, 500, 400, 300, 200, 100];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar List View'),

      ),
      body: 
      // LIST VIEW
      // ListView(
      //   scrollDirection: Axis.horizontal, // kalo horizontal pakenya width, kl vertical pkenya height
      //   children: [
      //     Container(
      //       width: 50, 
      //       color: Colors.purple[900],
      //     ),
      //     Container(
      //       width: 50, 
      //       color: Colors.purple[800],
      //     ),
      //     Container(
      //       width: 50, 
      //       color: Colors.purple[700],
      //     ),
      //     Container(
      //       width: 50, 
      //       color: Colors.purple[600],
      //     ),
      //     Container(
      //       width: 50, 
      //       color: Colors.purple[500],
      //     ),
      //     Container(
      //       width: 50, 
      //       color: Colors.purple[400],
      //     ),
      //   ],
      // ),

      // LIST VIEW BUILDER
      // ListView.builder(
      //   itemBuilder: (context, index){
      //     return Container(
      //       height: 50, 
      //       color: Colors.yellow[colorCodes[index]],);
      //   },
      //   itemCount: colorCodes.length,
      // ),

      // KALO MAU DIKASIH JARAK BUILDER DIGANTI SM SEPARATED
       ListView.separated(
        itemBuilder: (context, index){
          return Container(
            height: 50, 
            color: Colors.yellow[colorCodes[index]],);
        },
        itemCount: colorCodes.length,
        separatorBuilder: (context, index){
          return const Divider();
        },
      ),
    );
  }
}