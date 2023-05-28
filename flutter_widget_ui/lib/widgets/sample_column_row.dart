import 'package:flutter/material.dart';

class SampleColumnRow extends StatelessWidget {
  const SampleColumnRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Belajar Container')),
      body: 
      Column( // kalo column punya banyak chil (yang disebut children), di dalemnya bisa diisi oleh banyak widget
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // defaultnya dari atas / start
        children: [
          SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Container(
                    width: 50, 
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 16,
                  ), 
                  Container(
                    width: 50, 
                    color: Colors.blue,
                  ), 
                ],
            )
          ),
         // container hanya bisa di isi oleh 1 child
          Container(
            height: 20, 
            color: Colors.red,
          ),
           Container(
            height: 20, 
            color: Colors.pink,
          ),
          Container(
            height: 20, 
            color: Colors.yellow,
          ),
          // kalo column chil nya akan kebawah (dari atas ke bawah)
        ],
      ), 

      // Column(
      //   children: const <Widget>[
      //     Text('Deliver features faster'),
      //     Text('Craft beautiful UIs'),
      //     Expanded(
      //       child: FittedBox(
      //         child: FlutterLogo(),
      //       ),
      //     ),
      //   ],
      // )


      // Row(
      //   children: const <Widget>[
      //     Expanded(
      //       child: Text('Deliver features faster', textAlign: TextAlign.center),
      //     ),
      //     Expanded(
      //       child: Text('Craft beautiful UIs', textAlign: TextAlign.center),
      //     ),
      //     Expanded(
      //       child: FittedBox(
      //         child: FlutterLogo(),
      //       ),
      //     ),
      //   ],
      // )

    );
  }
}