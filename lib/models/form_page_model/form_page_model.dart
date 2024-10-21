import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:screl/models/form_page_state/form_page_state.dart';
import 'package:screl/widgets/create_campaign_forms/base_form.dart';

part 'form_page_model.freezed.dart';

@freezed
class FormPageModel with _$FormPageModel {
  const factory FormPageModel({
    required String title,
    required String subTitle,
    required BaseForm body,
    @Default(FormPageState.pending) FormPageState state,
  }) = _FormPageModel;
}
