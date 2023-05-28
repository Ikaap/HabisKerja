import 'package:flutter/material.dart';


class SampleGrid extends StatelessWidget {
  SampleGrid({super.key});

  // untuk grid builder membutuhkan variabel terlebih dahulu
  final List colorCodes = [900, 800, 700, 600, 500, 400, 300, 200, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Belajar Gridview'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(4),
        child:GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, 
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ), 
          itemBuilder: (context, index){
            return Container(
              color: Colors.purple[colorCodes[index]],
            );
          },
          itemCount: colorCodes.length, // untuk batas perulangannya, containernya akan di cetak sebanyak data yang ada di variabel colorCode
        ),
        // GridView.count( // defaultnya vertikal
        //   scrollDirection: Axis.horizontal,
        //   crossAxisCount: 4, // jumlah kolomnya
        //   mainAxisSpacing: 4, // untuk jarak bawahnya
        //   crossAxisSpacing: 4, // jarak ke samping
        //   children: [
        //     Container(
        //       color: Colors.purple,
        //     ),
        //     Container(
        //       color: Colors.green,
        //     ),
        //     Container(
        //       color: Colors.red,
        //     ),
        //     Container(
        //       color: Colors.blue,
        //     ),
        //     Container(
        //       color: Colors.purple,
        //     ),
        //     Container(
        //       color: Colors.green,
        //     ),
        //     Container(
        //       color: Colors.red,
        //     ),
        //     Container(
        //       color: Colors.blue,
        //     ),
        //     Container(
        //       color: Colors.purple,
        //     ),
        //     Container(
        //       color: Colors.green,
        //     ),
        //     Container(
        //       color: Colors.red,
        //     ),
        //     Container(
        //       color: Colors.blue,
        //     ),
        //   ],
        // ),
      ),
    );
  }
}