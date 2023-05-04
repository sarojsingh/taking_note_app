import 'package:flutter/material.dart';
import 'package:note_taking_app/add_note_screen.dart';
import 'package:note_taking_app/models/note_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NoteModel> notes = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note Taking Appp'),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(notes[index].title),
              subtitle: Text(notes[index].content),
            );
          },
        ),
      ),
      floatingActionButton: IconButton(
          onPressed: () async {
            notes = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNoteScreen(),
                ));
            setState(() {});
          },
          icon: Icon(Icons.add)),
    );
  }
}
