import 'package:acronyms_flutter/app/di/injector.dart';
import 'package:acronyms_flutter/app/modules/landing/viewmodels/landing_view_model.dart';
import 'package:kiwi/kiwi.dart';

class ViewModelProvider extends Injector {
  @override
  void inject() {
    container.registerFactory<LandingViewModel>(
      (KiwiContainer container) => LandingViewModel(),
    );
  }
}
