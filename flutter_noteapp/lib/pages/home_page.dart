import 'package:flutter/material.dart';
import 'package:flutter_noteapp/models/note.dart';
import 'package:flutter_noteapp/pages/detail_page.dart';
import 'package:flutter_noteapp/pages/form_page.dart';
import 'package:flutter_noteapp/utils/notes_database.dart';
import 'package:flutter_noteapp/widgets/card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // data dummy
  List<Note> notes = [
    Note(
        id: 1,
        title: 'Bensin',
        description: 'Beli di pom 20 ribu',
        time: DateTime.now()),
    Note(
        id: 1,
        title: 'Food',
        description: 'Beli di pom 20 ribu',
        time: DateTime.now()),
    Note(
        id: 1,
        title: 'Work',
        description: 'Beli di pom 20 ribu',
        time: DateTime.now()),
    Note(
        id: 1,
        title: 'School',
        description: 'Beli di pom 20 ribu',
        time: DateTime.now()),
  ];

  bool isLoading = false;

  Future refreshNotes() async {
    setState(() {
      isLoading = true;
    });
    notes = await NotesDatabase.instance.readAllNotes();
    // data dummy akan ke replace dgn data baru
    //yang sidah diinutkan oleh user yang ada di local storage
    setState(() {
      isLoading =
          false; // ketika prosesnya sudah selesai maka akan diganit dgn data yg baru
    });
  }

  @override
  void initState() {
    refreshNotes();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    NotesDatabase.instance.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buku Catatan Ku'),
        automaticallyImplyLeading: false, // untuk menghilangkan anak panas back
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // jumlah kolomnya
                  mainAxisSpacing: 8, // batas atas bawah
                  crossAxisSpacing: 8, // batas samping kanan kiri
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async{
                      await Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return DetailPage(note: notes[index]);
                      }));
                      refreshNotes();
                    },
                    child: CardWidget(
                      index: index,
                      note: notes[index],
                    ),
                  );
                },
                itemCount: notes.length,
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
            return const FormPage();
          }));
          refreshNotes();
        },
        child: const Icon(Icons.note_add),
      ),
    );
  }
}
