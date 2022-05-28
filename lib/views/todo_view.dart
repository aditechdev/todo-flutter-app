import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/adapters/todoadapters.dart';
import 'package:todoapp/views/add_todo.dart';

class ToDoView extends StatelessWidget {
  const ToDoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddTodo()));
          
        },
      ),
      appBar: AppBar(
          title: const Text(
        "Hive todo app",
      )),
      body: ValueListenableBuilder(
        valueListenable: Hive.box<Todo>('todo').listenable(),
        builder: (BuildContext context, Box<Todo> box, _) {
          if (box.values.isEmpty) {
            return const Center(
              child: Text("The box is empty"),
            );
          }
          return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                Todo? todo = box.getAt(index);

                return ListTile(
                  onLongPress: () async {
                    await box.deleteAt(index);
                  },
                  title: Text(
                    todo!.title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  subtitle: Text(
                    todo.discription,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
