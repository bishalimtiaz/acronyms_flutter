import 'package:acronyms_flutter/app/core/base/app_state.dart';
import 'package:flutter/material.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends AppState<LandingView> {
  @override
  Widget buildChild(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text(
          "Landing View",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
