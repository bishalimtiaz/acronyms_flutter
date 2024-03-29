import 'package:acronyms_flutter/app/core/base/base_remote_source.dart';
import 'package:acronyms_flutter/app/data/model/response/acronym_meaning.dart';

abstract class AcronymsDataSource extends BaseRemoteSource {
  Future<AcronymMeaningResponse> fetchAcronymsMeanings(String acronym);
}
