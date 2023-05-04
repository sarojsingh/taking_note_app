import 'package:flutter/material.dart';
import 'package:note_taking_app/helpers/database_helper.dart';
import 'package:note_taking_app/models/note_model.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  List<NoteModel> notes = [];
  GlobalKey<FormState> noteformkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: noteformkey,
          child: ListView(
            children: [
              TextFormField(
                controller: titleController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Title is required";
                  }
                },
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextFormField(
                controller: contentController,
                validator: (value) {
                  if (value == null || value.length < 10) {
                    return "Enter at least 10 characters";
                  }
                },
                minLines: 3,
                maxLines: 8,
                //expands: true, //TODO:Check documentation and fix.
                decoration: InputDecoration(
                  labelText: 'Content',
                ),
              ),
              TextFormField(
                validator: (value) {},
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ElevatedButton(
                  onPressed: () {
                    if (noteformkey.currentState!.validate()) {
                      // notes.add(NoteModel(
                      //     title: titleController.text,
                      //     content: contentController.text));
                      // DatabaseHelper()
                      //     .insertNote(titleController.text, contentController.text);
                      Navigator.pop(context, notes);
                    }
                  },
                  child: Text(
                    'Save',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
