import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:screl/models/form_page_model/form_page_model.dart';
import 'package:screl/widgets/create_campaign_forms/bidding_strategy.dart';
import 'package:screl/widgets/create_campaign_forms/create_campaign.dart';
import 'package:screl/widgets/create_campaign_forms/create_segments.dart';
import 'package:screl/widgets/create_campaign_forms/review_campaign.dart';
import 'package:screl/widgets/create_campaign_forms/site_links.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'create_campaign_vm.freezed.dart';
part 'state.dart';

final _formPagesProvider = StateProvider(
  (ref) => <FormPageModel>[
    FormPageModel(
      title: 'Create New Campaign',
      subTitle: 'Fill out these details and get your campaign ready',
      body: CrateCampaignForm(
        key: GlobalKey(),
      ),
    ),
    const FormPageModel(
      title: 'Create Segments',
      subTitle: 'Get full control over your audience',
      body: CreateSegmentsForm(),
    ),
    const FormPageModel(
      title: 'Bidding Strategy',
      subTitle: 'Optimize your campaign reach with adsense',
      body: BiddingStrategyForm(),
    ),
    const FormPageModel(
      title: 'Site Links',
      subTitle: 'Setup your customer journey flow',
      body: SiteLinksForm(),
    ),
    const FormPageModel(
      title: 'Review Campaign',
      subTitle: 'Double check your campaign is ready to get',
      body: ReviewCampaignForm(),
    ),
  ],
);

final userViewModelProvider =
    StateNotifierProvider<CreateCampaignViewModel, CreateCampaignFormState>(
  CreateCampaignViewModel.new,
);

class CreateCampaignViewModel extends StateNotifier<CreateCampaignFormState> {
  CreateCampaignViewModel(this._ref)
      : super(
          CreateCampaignFormInitial(
            currentPage: _ref.read(_formPagesProvider).first,
          ),
        );

  final Ref _ref;
  int _currentIndex = 0;
  final _data = <String, dynamic>{};

  bool get isLastpage => _currentIndex == pages.length - 1;

  List<FormPageModel> get pages => _ref.read(_formPagesProvider);

  final SharedPreferences _sharedPreferences =
      GetIt.instance.get<SharedPreferences>();

  Map<String, dynamic> get savedDraft => json.decode(
        _sharedPreferences.get('form_state') as String? ?? '{}',
      ) as Map<String, dynamic>;

  Future<void> validateAndSave() async {
    final result = state.currentPage.body.validateAndSubmit();

    if (result.isLeft) return;

    _data.addAll(result.right);

    log('~~data: $_data');
    await _sharedPreferences.setString('form_state', json.encode(_data));

    if (isLastpage) {
      _currentIndex = 0;
    } else {
      _currentIndex++;
    }
    state = PageChanged(
      currentPage: pages[_currentIndex],
      currentIndex: _currentIndex,
    );
  }

  void goToPage(int index) {
    if (index >= pages.length || index < 0) return;
    _currentIndex = index;
    state = PageChanged(
      currentPage: pages[_currentIndex],
      currentIndex: _currentIndex,
    );
  }

  Future<void> saveDraft() async {
    final result = state.currentPage.body.validateAndSubmit();
    if (result.isLeft) return;
    _data.addAll(result.right);
    await _sharedPreferences.setString('form_state', json.encode(_data));
  }
}
