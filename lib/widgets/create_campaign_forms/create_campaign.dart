import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl/config/colors.dart' as colors;
import 'package:screl/utils/reg_exps.dart' as reg_exps;
import 'package:screl/view_models/create_campaign_vm/create_campaign_vm.dart';
import 'package:screl/widgets/create_campaign_forms/base_form.dart';
import 'package:screl/widgets/switch.dart';
import 'package:screl/widgets/text_form_field.dart';

class CrateCampaignForm extends ConsumerStatefulWidget implements BaseForm {
  const CrateCampaignForm({
    required this.key,
  }) : super(key: key);

  @override
  // ignore: overridden_fields
  final GlobalKey<CrateCampaignFormState> key;

  @override
  ConsumerState<CrateCampaignForm> createState() => CrateCampaignFormState();

  @override
  Either<Exception, Map<String, dynamic>> validateAndSubmit() =>
      key.currentState!.validateAndSubmit();
}

class CrateCampaignFormState extends ConsumerState<CrateCampaignForm> {
  bool _runOnlyOnePerCustomer = true;
  bool _customAudience = false;

  final _formKey = GlobalKey<FormState>();
  late List<TextEditingController> _textEditingControllers;

  @override
  void initState() {
    final draft = ref.read(userViewModelProvider.notifier).savedDraft;
    _textEditingControllers = List.generate(
      4,
      (index) {
        switch (index) {
          case 0:
            return TextEditingController(
              text: draft['subject'] as String? ?? '',
            );
          case 1:
            return TextEditingController(
              text: draft['text'] as String? ?? '',
            );
          case 2:
            return TextEditingController(
              text: draft['from_name'] as String? ?? '',
            );
          case 3:
            return TextEditingController(
              text: draft['from_email'] as String? ?? '',
            );
        }
        return TextEditingController();
      },
    );
    _customAudience = draft['custom_audience'] as bool? ?? _customAudience;
    _runOnlyOnePerCustomer =
        draft['once_per_customer'] as bool? ?? _customAudience;
    super.initState();
  }

  @override
  void dispose() {
    for (final controllerr in _textEditingControllers) {
      controllerr.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Create New Email Campaign',
              textAlign: TextAlign.center,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Fill out these details to build your broadcast',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: colors.inputHint,
              ),
            ),
            const SizedBox(height: 18),
            AppTextFormField(
              controller: _textEditingControllers[0],
              labelText: 'Campaign subject',
              hintText: 'Enter subject',
              validator: (value) {
                if ((value ?? '').isEmpty) {
                  return 'Please enter the subject';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            AppTextFormField(
              controller: _textEditingControllers[1],
              labelText: 'Preview text',
              hintText: 'Enter text here...',
              maxLength: 150,
              maxLines: 3,
              helperText: 'Keep this simple of 150 characters',
              validator: (value) {
                if ((value ?? '').isEmpty) {
                  return 'Please enter the preview text';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: AppTextFormField(
                    controller: _textEditingControllers[2],
                    labelText: '"From" Name',
                    hintText: 'From Anne',
                    validator: (value) {
                      if ((value ?? '').isEmpty) {
                        return 'Please enter the from name';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: AppTextFormField(
                    controller: _textEditingControllers[3],
                    labelText: '"From" Email',
                    hintText: 'Anne@example.com',
                    validator: (value) {
                      if ((value ?? '').isEmpty) {
                        return 'Please enter the from email';
                      } else if (!reg_exps.emailRegExp.hasMatch(value!)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Run only once per customer',
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colors.inputLabel,
                  ),
                ),
                AppSwitch(
                  value: _runOnlyOnePerCustomer,
                  onChanged: (value) => setState(
                    () => _runOnlyOnePerCustomer = value,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Custom audience',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colors.inputLabel,
                  ),
                ),
                AppSwitch(
                  value: _customAudience,
                  onChanged: (value) => setState(() => _customAudience = value),
                ),
              ],
            ),
            const SizedBox(height: 16),
            RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.inputLabel,
                ),
                children: [
                  const TextSpan(
                    text: 'You can set up a ',
                  ),
                  TextSpan(
                    mouseCursor: SystemMouseCursors.click,
                    text: 'custom domain or connect your email service '
                        'provider ',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colors.primary,
                    ),
                  ),
                  const TextSpan(
                    text: 'to change this',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Either<Exception, Map<String, dynamic>> validateAndSubmit() {
    if (!_formKey.currentState!.validate()) return Left(Exception());
    return Right({
      'subject': _textEditingControllers[0].text,
      'text': _textEditingControllers[1].text,
      'from_name': _textEditingControllers[2].text,
      'from_email': _textEditingControllers[3].text,
      'once_per_customer': _runOnlyOnePerCustomer,
      'custom_audience': _customAudience,
    });
  }
}
