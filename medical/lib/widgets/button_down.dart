// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class button extends StatelessWidget {
  String name;
  button({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            Color.fromARGB(255, 32, 93, 197),
          ),
        ),
      ),
    );
  }
}
