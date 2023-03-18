import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/model/todo.dart';
import 'package:todo_list_app/theme/app_decoration.dart';
import '../../todo/add_edit_todo_alert_screen.dart';

class TodoItemCard extends StatelessWidget {
  final TodoModel todoModel;

  const TodoItemCard(this.todoModel, {super.key});

  @override
  Widget build(BuildContext context) {
    final checkValue = todoModel.isFinished;
    return GestureDetector(
      onTap: () => _checkTask(todoModel.id!),
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.015),
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.01,
            vertical: MediaQuery.of(context).size.width * 0.02),
        decoration: AppDecoration.groupStylewhitegray20041,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
                value: checkValue,
                activeColor: const Color(0xff5F78FC),
                onChanged: (value) {
                  _checkTask(todoModel.id!);
                }),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  todoModel.title!,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    todoModel.description!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) =>
                                AddEditTodoAlertScreen(todoModel));
                      },
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                            color: Color(0xff5F78FC),
                            fontWeight: FontWeight.w600),
                      )),
                  GestureDetector(
                      onTap: () =>
                          _deleteTask(todoModel.id!).then((value) => null),
                      child: const Icon(
                        Icons.delete_outlined,
                        color: Colors.red,
                      )),
                ])
          ],
        ),
      ),
    );
  }

  Future<void> _deleteTask(String taskTag) async {
    await FirebaseFirestore.instance
        .collection('TodoList')
        .doc(taskTag)
        .delete();
  }

  Future<void> _checkTask(String taskTag) async {
    await FirebaseFirestore.instance
        .collection('TodoList')
        .doc(taskTag)
        .update({"isFinished": !todoModel.isFinished!});
  }
}
