import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/model/todo.dart';
import 'package:todo_list_app/screens/home/widgets/todo_item_card.dart';
import '../../main.dart';
import '../todo/add_edit_todo_alert_screen.dart';
import 'widgets/search.dart';
import 'widgets/show_search_result.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String searchText = ref.watch(searchProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List App"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.02,
            vertical: MediaQuery.of(context).size.height * 0.02,
          ),
          child: Column(
            children: [
              search((textEntered) => {
                    ref.read(searchProvider.notifier).state = textEntered,
                  }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              searchText != ""
                  ? ShowSearchResult(searchText)
                  : StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("TodoList")
                          .orderBy("isFinished")
                          .snapshots(),
                      builder: (c, snapshot) {
                        return snapshot.hasData
                            ? ListView.builder(
                                physics: const ScrollPhysics(),
                                itemExtent:
                                    MediaQuery.of(context).size.height * 0.12,
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                itemCount: snapshot.data!.size,
                                itemBuilder: (c, index) {
                                  TodoModel orderModel = TodoModel.fromJson(
                                      snapshot.data!.docs[index].data()
                                          as Map<String, dynamic>);
                                  return TodoItemCard(orderModel);
                                })
                            : const Center(
                                child: Text("You don't have tasks yet."),
                              );
                      }),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) =>
                  AddEditTodoAlertScreen(TodoModel(null, null, null, null)));
        },
        child: Icon(
          Icons.add_circle_rounded,
          size: MediaQuery.of(context).size.width * 0.15,
          color: const Color(0xff5F78FC),
        ),
      ),
    );
  }
}
