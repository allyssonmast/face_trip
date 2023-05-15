import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ContactDetailsPage extends StatefulWidget {
  const ContactDetailsPage({Key? key}) : super(key: key);

  @override
  _ContactDetailsPageState createState() {
    return _ContactDetailsPageState();
  }
}

class _ContactDetailsPageState extends State<ContactDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
