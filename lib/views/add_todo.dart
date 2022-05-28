import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/adapters/todoadapters.dart';

class AddTodo extends StatefulWidget {
  // const AddTodo({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  AddTodo({Key? key}) : super(key: key);

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  String title = "", description = "";
  submitData() async {
    if (widget.formKey.currentState!.validate()) {
      Box<Todo> todoBox = Hive.box<Todo>("todo");
      todoBox.add(Todo(title: title, discription: description));
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Add todo")),
      body: Form(
          key: widget.formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: 'Add title'),
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Add description'),
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () => submitData(),
                child: Text("SUbmit".toUpperCase()),
              ),
            ],
          )),
    );
  }
}
