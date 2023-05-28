import 'package:flutter/material.dart';

class HomePage extends StatefulWidget { // tadinya StatelessWidget, lalu yang di main.dart : const nya dihapus
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String label = 'Hallo ikap';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: (){
              setState(() {
                label = 'ganti nama';
              });
            }, child: Text('ini button', style: TextStyle(fontSize: 30),),),
          Center(child: Text(label, style: TextStyle(fontSize: 50, color: Colors.red, fontWeight: FontWeight.bold,),),),
        ],
      ),
      // appBar: ,
      // body: ,
      // bottomNavigationBar: ,
    );
  }
}