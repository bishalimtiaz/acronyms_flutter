import 'package:acronyms_flutter/app/core/base/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';

abstract class AppState<T extends StatefulWidget, V extends BaseViewModel>
    extends State<T> {
  late final V viewModel;

  @override
  void initState() {
    viewModel = KiwiContainer().resolve();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.onDispose();
    super.dispose();
  }

  Widget buildChild(BuildContext context);

  PreferredSizeWidget? appBar() => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: buildChild(context),
      ),
    );
  }
}
