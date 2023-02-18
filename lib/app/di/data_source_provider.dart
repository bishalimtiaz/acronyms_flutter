import 'package:acronyms_flutter/app/data/remote/impl/acronyms_data_source_impl.dart';
import 'package:acronyms_flutter/app/data/remote/interface/acronyms_data_source.dart';
import 'package:acronyms_flutter/app/di/injector.dart';
import 'package:kiwi/kiwi.dart';

class DataSourceProvider extends Injector {
  @override
  void inject() {
    container.registerFactory<AcronymsDataSource>(
      (KiwiContainer container) => AcronymsDataSourceImpl(),
    );
  }
}
