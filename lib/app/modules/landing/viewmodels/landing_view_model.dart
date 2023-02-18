
import 'package:acronyms_flutter/app/core/base/base_view_model.dart';
import 'package:acronyms_flutter/app/core/utils/debouncer.dart';
import 'package:acronyms_flutter/app/data/model/response/acronym_meaning.dart';
import 'package:acronyms_flutter/app/data/repository/interface/acronym_meaning_repository.dart';
import 'package:acronyms_flutter/app/modules/landing/ui_model/accronym_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';

class LandingViewModel extends BaseViewModel {
  late final AcronymMeaningRepository repository;
  final TextEditingController textEditingController = TextEditingController();

  final ValueNotifier<AcronymUiModel> modelNotifier =
      ValueNotifier<AcronymUiModel>(AcronymUiModel());

  void searchAcronyms() {
    Debouncer(milliseconds: 2000).run(() {
      _searchAcronyms();
    });
  }

  void _searchAcronyms() {
    repository
        .fetchAcronymsMeanings(textEditingController.text.trim())
        .then((AcronymMeaningResponse response) {
      modelNotifier.value = AcronymUiModel.fromResponseModel(response);
    });
  }

  @override
  void onInit() {
    repository = KiwiContainer().resolve();

    super.onInit();
  }
}
