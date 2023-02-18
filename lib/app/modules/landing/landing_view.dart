import 'package:acronyms_flutter/app/core/base/app_state.dart';
import 'package:acronyms_flutter/app/core/widget/search_bar.dart';
import 'package:acronyms_flutter/app/modules/landing/viewmodels/landing_view_model.dart';
import 'package:flutter/material.dart';

import 'ui_model/accronym_ui_model.dart';

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends AppState<LandingView, LandingViewModel> {
  @override
  PreferredSizeWidget? appBar() {
    return SearchBar(
      onSearch: (String s) {
        viewModel.searchAcronyms();
      },
      searchController: viewModel.textEditingController,
    );
  }

  @override
  Widget buildChild(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ValueListenableBuilder(
              valueListenable: viewModel.modelNotifier,
              builder: (BuildContext context, AcronymUiModel model, _) {
                return ListView.separated(
                  itemCount: model.meanings.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(model.acronym),
                          const SizedBox(height: 10),
                          Text(model.meanings[index].str),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10);
                  },
                );
              }),
        ],
      ),
    );
  }
}
