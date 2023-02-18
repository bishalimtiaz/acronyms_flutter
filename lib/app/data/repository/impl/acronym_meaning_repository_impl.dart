import 'package:acronyms_flutter/app/data/model/response/acronym_meaning.dart';
import 'package:acronyms_flutter/app/data/remote/interface/acronyms_data_source.dart';
import 'package:acronyms_flutter/app/data/repository/interface/acronym_meaning_repository.dart';

class AcronymMeaningRepositoryImpl implements AcronymMeaningRepository {
  final AcronymsDataSource acronymsDataSource;

  AcronymMeaningRepositoryImpl({required this.acronymsDataSource});

  @override
  Future<AcronymMeaningResponse> fetchAcronymsMeanings(String acronym) {
    return acronymsDataSource.fetchAcronymsMeanings(acronym);
  }
}
