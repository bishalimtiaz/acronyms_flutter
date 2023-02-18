import 'package:acronyms_flutter/app/data/repository/impl/acronym_meaning_repository_impl.dart';
import 'package:acronyms_flutter/app/data/repository/interface/acronym_meaning_repository.dart';
import 'package:acronyms_flutter/app/di/injector.dart';
import 'package:kiwi/kiwi.dart';

class RepositoryProvider extends Injector {
  @override
  void inject() {
    container.registerFactory<AcronymMeaningRepository>(
      (KiwiContainer container) =>
          AcronymMeaningRepositoryImpl(acronymsDataSource: container.resolve()),
    );
  }
}
