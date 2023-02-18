import 'package:acronyms_flutter/app/di/view_model-provider.dart';
import 'package:acronyms_flutter/app/di/data_source_provider.dart';
import 'package:acronyms_flutter/app/di/repository_provider.dart';

abstract class AppService {
  AppService._();

  static void start() {
    _injectDependencies();
  }

  static void _injectDependencies() {
    DataSourceProvider().inject();
    RepositoryProvider().inject();
    ViewModelProvider().inject();
  }
}
