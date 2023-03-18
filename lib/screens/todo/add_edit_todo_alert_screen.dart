import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/model/todo.dart';

import '../../theme/app_decoration.dart';
import '../../theme/app_style.dart';

class AddEditTodoAlertScreen extends StatelessWidget {
  final TodoModel todoModel;
  const AddEditTodoAlertScreen(this.todoModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController taskNameController =
        TextEditingController(text: todoModel.title);
    final TextEditingController taskDescController =
        TextEditingController(text: todoModel.description);
    return AlertDialog(
      scrollable: true,
      title: Text(
        todoModel.title ?? 'Add New Task',
        textAlign: TextAlign.center,
        style: const TextStyle(color: Color(0xff5F78FC)),
      ),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width,
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: taskNameController,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: todoModel.title ?? 'Task',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon: const Icon(
                    CupertinoIcons.square_list,
                    color: Color(0xffB6BFEF),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: taskDescController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: const TextStyle(fontSize: 14),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  hintText: todoModel.description ?? 'Description',
                  hintStyle: const TextStyle(fontSize: 14),
                  icon: const Icon(
                    CupertinoIcons.bubble_left_bubble_right,
                    color: Color(0xffB6BFEF),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            todoModel.id == null
                ? _addTask(taskNameController.text, taskDescController.text)
                    .then((value) => Navigator.pop(context))
                : _updateTask(taskNameController.text, taskDescController.text,
                        todoModel.id!, todoModel.isFinished!)
                    .then((value) => Navigator.pop(context));
          },
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.17,
            height: MediaQuery.of(context).size.height * 0.035,
            decoration: AppDecoration.groupStyleBlueWhite,
            child: Text(
              'Save',
              style: AppStyle.textStyleCairomedium6,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.17,
            height: MediaQuery.of(context).size.height * 0.035,
            decoration: AppDecoration.groupStyleBlueWhite
                .copyWith(color: const Color(0xffB6BFEF)),
            child: Text(
              'Cancel',
              style: AppStyle.textStyleCairomedium6,
            ),
          ),
        ),
      ],
    );
  }
}

Future<void> _addTask(String taskName, String taskDesc) async {
  await FirebaseFirestore.instance.collection('TodoList').add(
    {
      'title': taskName,
      'description': taskDesc,
      'id': "0",
      "isFinished": false
    },
  ).then((value) => value.update({"id": value.id}));
}

Future<void> _updateTask(
    String taskName, String taskDesc, String taskTag, bool isFinished) async {
  await FirebaseFirestore.instance.collection('TodoList').doc(taskTag).update(
    {
      'title': taskName,
      'description': taskDesc,
      'id': taskTag,
      "isFinished": isFinished
    },
  );
}
