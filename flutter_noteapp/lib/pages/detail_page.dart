// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_noteapp/pages/form_page.dart';
import 'package:flutter_noteapp/utils/notes_database.dart';

import '../models/note.dart';

class DetailPage extends StatefulWidget {
  final Note note;
  const DetailPage({
    Key? key,
    required this.note,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  late Note note;

  Future refreshNote() async{
    note = await NotesDatabase.instance.readNote(widget.note.id!);
    setState(() {
      
    });
  }

  @override
  void initState() {
    note = widget.note;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(note.title),
        actions: [
          InkWell(
            onTap: () async{
              await Navigator.of(context).push(MaterialPageRoute(builder: (contex){
                return FormPage(note: widget.note,);
              }));
              refreshNote();
            },
            child: const Icon(Icons.edit_note),
          ),
          const SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: () async {
              await NotesDatabase.instance.delete(widget.note.id!);
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.delete,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        child: ListView(
          children: [
            Text(
              note.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              note.description,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
