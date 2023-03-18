import 'package:flutter/material.dart';

class search extends StatelessWidget {
  final Function(String) onChanged;

  const search(this.onChanged, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.045,
            width: MediaQuery.of(context).size.width * 0.955,
            child: TextField(
                onChanged: onChanged,
                decoration: const InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Padding(
                        padding: EdgeInsets.only(left: (10.00), right: (12.00)),
                        child: Icon(
                          Icons.search,
                          color: Color(0xffB6BFEF),
                        )),
                    prefixIconConstraints:
                        BoxConstraints(minWidth: (20.00), minHeight: (20.00)),
                    filled: true,
                    fillColor: Colors.white,
                    isDense: true,
                    contentPadding: EdgeInsets.only(top: 10.00, bottom: 10.00)),
                style: const TextStyle(
                    fontSize: (14.0), fontWeight: FontWeight.w500))),
      ],
    );
  }
}
