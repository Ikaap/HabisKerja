import 'package:flutter/material.dart';

class SampleContainer extends StatelessWidget {
  const SampleContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Belajar Container')),
      body: Container(
        width: double.infinity,  // kalo mau sesuai layar pakai double.infinity
        height: 300,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey, 
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 3, color: Colors.red,),
        ),
        child: const Text('ini kontainerkontainerkontainerkontainerkontainerkontainerkontainerkontainerkontainerkontainerkontainerkontainerkontainerkontainerkontainerkontainerkontainerkontainerkontainer', 
        textAlign: TextAlign.center, 
        overflow: TextOverflow.ellipsis , // kalo tulisannya udah nambrak dia bakal diganti jadi titik titik (...)
        style: TextStyle(
          color: Colors.purple, 
          fontSize: 36, 
          fontWeight: FontWeight.w600, 
          wordSpacing: 10,
          letterSpacing: 5,),),
      ),
    );
  }
}