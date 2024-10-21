part of 'create_campaign_vm.dart';

@freezed
class CreateCampaignFormState with _$CreateCampaignFormState {
  const factory CreateCampaignFormState.initial({
    required FormPageModel currentPage,
    @Default(0) int currentIndex,
  }) = CreateCampaignFormInitial;
  
  const factory CreateCampaignFormState.validationFailed({
    required FormPageModel currentPage,
    required int currentIndex,
    required String errorMessage,
  }) = ValidationFailed;

  const factory CreateCampaignFormState.pageChanged({
    required FormPageModel currentPage,
    required int currentIndex,
  }) = PageChanged;
}
