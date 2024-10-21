import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl/config/colors.dart' as colors;
import 'package:screl/view_models/create_campaign_vm/create_campaign_vm.dart';
import 'package:screl/widgets/elevated_button.dart';
import 'package:screl/widgets/form_step_indicator.dart';
import 'package:screl/widgets/outline_button.dart';
import 'package:screl/widgets/responsive_builder.dart';

class CreateCampaignScreen extends ConsumerWidget {
  const CreateCampaignScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ResponsiveBuilder(
        mobileView: (constraints) => SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            vertical: constraints.maxHeight * 0.06,
            horizontal: constraints.maxWidth * 0.1,
          ),
          child: Column(
            children: [
              _indicators(ref, isMobileView: true),
              const SizedBox(height: 32),
              _form(ref, isMobileView: true),
            ],
          ),
        ),
        deskTopView: (constraints) => Padding(
          padding: EdgeInsets.symmetric(
            vertical: constraints.maxHeight * 0.12,
          ),
          child: Row(
            children: [
              Spacer(flex: constraints.maxWidth < 1400 ? 1 : 2),
              Expanded(
                flex: 4,
                child: _form(ref),
              ),
              const SizedBox(width: 32),
              Expanded(
                flex: 2,
                child: _indicators(ref),
              ),
              Spacer(flex: constraints.maxWidth < 1400 ? 1 : 2),
            ],
          ),
        ),
      ),
    );
  }

  Widget _form(WidgetRef ref, {bool isMobileView = false}) {
    return Container(
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isMobileView)
            ref.watch(userViewModelProvider).currentPage.body
          else
            Expanded(
              child: ref.watch(userViewModelProvider).currentPage.body,
            ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 4,
                child: AppOutlinedButton(
                  onPressed: ref.read(userViewModelProvider.notifier).saveDraft,
                  label: 'Save Draft',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 5,
                child: AppTextButton(
                  onPressed: () {
                    ref.read(userViewModelProvider.notifier).validateAndSave();
                  },
                  label: ref.read(userViewModelProvider.notifier).isLastpage
                      ? 'Submit'
                      : 'Next Step',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _indicators(WidgetRef ref, {bool isMobileView = false}) {
    return Container(
      height: isMobileView ? null : double.infinity,
      decoration: BoxDecoration(
        color: colors.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: ref
              .watch(userViewModelProvider.notifier)
              .pages
              .indexed
              .map(
                (page) => FormStepIndicator(
                  step: (page.$1 + 1).toString(),
                  title: page.$2.title,
                  subTitle: page.$2.subTitle,
                  isActive:
                      ref.read(userViewModelProvider).currentIndex == page.$1,
                  onClick: () {
                    ref.read(userViewModelProvider.notifier).goToPage(page.$1);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
