class AcronymMeaningQueryParam {
  final String acronym;

  AcronymMeaningQueryParam({required this.acronym});

  Map<String, dynamic> toJson() => {
        'sf': acronym,
      };
}
