import 'package:acronyms_flutter/app/data/model/response/acronym_meaning.dart';

class AcronymUiModel {
  final String acronym;
  final List<Meaning> meanings;

  AcronymUiModel({this.acronym = "", this.meanings = const []});

  factory AcronymUiModel.fromResponseModel(AcronymMeaningResponse response) {
    return AcronymUiModel(
      acronym: response.acronym ?? " ",
      meanings:
          response.meanings.map((e) => Meaning.fromAcronymMeaning(e)).toList(),
    );
  }
}

class Meaning {
  final String str;

  const Meaning(
    this.str,
  );

  factory Meaning.fromAcronymMeaning(AcronymMeaning acronymMeaning) {
    return Meaning(acronymMeaning.meaning ?? "");
  }
}
