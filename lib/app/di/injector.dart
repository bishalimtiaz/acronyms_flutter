import 'package:kiwi/kiwi.dart';

abstract class Injector {
  final KiwiContainer container = KiwiContainer();
  void inject();
}
