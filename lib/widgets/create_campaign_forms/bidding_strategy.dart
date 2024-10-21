import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:screl/widgets/create_campaign_forms/base_form.dart';

class BiddingStrategyForm extends StatelessWidget implements BaseForm {
  const BiddingStrategyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Bidding Strategy'),
    );
  }

  @override
  Either<Exception, Map<String, dynamic>> validateAndSubmit() {
    // TODO(anyone): implement validateAndSubmit
    return const Right({});
  }
}
