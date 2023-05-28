import 'package:flutter/material.dart';

class SampleDialog extends StatefulWidget {
  const SampleDialog({super.key});

  @override
  State<SampleDialog> createState() => _SampleDialogState();
}

class _SampleDialogState extends State<SampleDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Dialog'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: showAlertDialog, 
            child: const Text('Show Alert Dialog'),
          ),
           ElevatedButton(
            onPressed: showMyBottomSheet, 
            child: const Text('Show Bottom Sheets'),
          ),
        ],
      ),
    );
  }

  void showAlertDialog(){
    showDialog(
      context: context, 
      builder: (context){
        return AlertDialog(
          title: const Text('Peringatan'),
          content: const Text('ini content peringatannya'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // untuk menghapus tumpukkannya, atau ketika 'ok' diklik maka akan menutup
              }, 
              child: const Text('Ok'),
            ),
          ],
        );
      });
  }


  void showMyBottomSheet(){
    showModalBottomSheet(
      context: context, 
      builder: (context) {
        return SizedBox(
          height: 200, 
          child: const Text('ini adalah bottom sheet'),
        );
      });
  }
}
