import 'dart:convert';

import 'package:acronyms_flutter/app/data/model/query/acronymsMeaningQueryParam.dart';
import 'package:acronyms_flutter/app/data/model/response/acronym_meaning.dart';
import 'package:acronyms_flutter/app/data/remote/interface/acronyms_data_source.dart';
import 'package:dio/dio.dart';

class AcronymsDataSourceImpl extends AcronymsDataSource {
  @override
  Future<AcronymMeaningResponse> fetchAcronymsMeanings(String acronym) {
    var endpoint = 'http://www.nactem.ac.uk/software/acromine/dictionary.py';
    var dioCall = dioClient.get(endpoint,
        queryParameters: AcronymMeaningQueryParam(acronym: acronym).toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseAcronymMeaningsResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  AcronymMeaningResponse _parseAcronymMeaningsResponse(Response<dynamic> response) {
    return AcronymMeaningResponse.fromJson(json.decode(response.data));
  }
}
