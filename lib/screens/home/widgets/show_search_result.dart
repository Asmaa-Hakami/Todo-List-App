import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import '../../../model/todo.dart';
import 'todo_item_card.dart';

class ShowSearchResult extends StatelessWidget {
  final String searchText;

  const ShowSearchResult(this.searchText, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("TodoList")
            .where("title", isGreaterThanOrEqualTo: searchText)
            .snapshots(),
        builder: (c, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  physics: const ScrollPhysics(),
                  itemExtent: MediaQuery.of(context).size.height * 0.12,
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
                  child: Text("No Result Found"),
                );
        });
  }
}
