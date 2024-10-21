// ignore: one_member_abstracts
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';

abstract class BaseForm extends Widget {
  const BaseForm({super.key});

  Either<Exception, Map<String, dynamic>> validateAndSubmit();
}
