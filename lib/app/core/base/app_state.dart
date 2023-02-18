import 'package:flutter/material.dart';

abstract class AppState<T extends StatefulWidget> extends State<T> {
  Widget buildChild(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: buildChild(context),
      ),
    );
  }
}
