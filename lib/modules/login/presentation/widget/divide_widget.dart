import 'package:flutter/material.dart';

class DivideWidget extends StatelessWidget {
  const DivideWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: const [
      Expanded(
          child: Divider(
        color: Colors.black,
        indent: 30,
        endIndent: 30,
      )),
      Text("or sign in with"),
      Expanded(
          child: Divider(
        color: Colors.black,
        indent: 30,
        endIndent: 30,
      )),
    ]);
  }
}
