import 'package:flutter/material.dart';
import 'package:flutter_widget_ui/pages/page_one.dart';
import 'package:flutter_widget_ui/pages/page_two.dart';
import 'package:flutter_widget_ui/widgets/sample_bottom_navbar.dart';
import 'package:flutter_widget_ui/widgets/sample_card.dart';
import 'package:flutter_widget_ui/widgets/sample_column_row.dart';
import 'package:flutter_widget_ui/widgets/sample_container.dart';
import 'package:flutter_widget_ui/widgets/sample_dialog.dart';
import 'package:flutter_widget_ui/widgets/sample_flexible.dart';
import 'package:flutter_widget_ui/widgets/sample_grid.dart';
import 'package:flutter_widget_ui/widgets/sample_listview.dart';
import 'package:flutter_widget_ui/widgets/sample_sizedbox.dart';
import 'package:flutter_widget_ui/widgets/sample_stack.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home:  const PageOne(),

      // rout lewat main caranya, tp home diatas harus dicoment dulu :
      initialRoute: '/',
      routes: {
        '/' : (context) => const PageOne(),
        '/second' : (context) => const PageTwo(
          text: '',
        ),

      },
    );
  }
}
