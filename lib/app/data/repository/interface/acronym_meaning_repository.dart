import 'package:acronyms_flutter/app/data/model/response/acronym_meaning.dart';

abstract class AcronymMeaningRepository {
  Future<AcronymMeaningResponse> fetchAcronymsMeanings(String acronym);
}
