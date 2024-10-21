import 'package:flutter/material.dart';
import 'package:screl/config/colors.dart' as colors;

class FormStepIndicator extends StatelessWidget {
  const FormStepIndicator({
    required this.step,
    required this.title,
    required this.subTitle,
    required this.isActive,
    required this.onClick,
    super.key,
  });

  final String step;
  final String title;
  final String subTitle;
  final bool isActive;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onClick,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isActive ? colors.primary : null,
                  border: Border.all(
                    color: isActive ? colors.primary : colors.inputBorder,
                  ),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  step,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: isActive ? colors.onPrimary : colors.inputBorder,
                      ),
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: colors.inputLabel,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      subTitle,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: colors.inputLabel.withOpacity(0.7),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
