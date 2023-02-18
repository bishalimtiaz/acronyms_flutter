class AcronymMeaningResponse {
  final String? acronym;
  final List<AcronymMeaning> meanings;

  AcronymMeaningResponse({required this.acronym, required this.meanings});

  factory AcronymMeaningResponse.fromJson(List<dynamic> json) {
    return AcronymMeaningResponse(
      acronym: json.isNotEmpty ? json[0]['sf'] : '',
      meanings: json.isNotEmpty
          ? List<AcronymMeaning>.from(
              json[0]['lfs'].map((lfs) => AcronymMeaning.fromJson(lfs)))
          : [],
    );
  }
}

class AcronymMeaning {
  final String? meaning;

  AcronymMeaning({required this.meaning});

  factory AcronymMeaning.fromJson(Map<String, dynamic> json) {
    return AcronymMeaning(
      meaning: json['lf'],
    );
  }
}
