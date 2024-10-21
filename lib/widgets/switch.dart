import 'package:flutter/cupertino.dart';
import 'package:screl/config/colors.dart' as colors;

class AppSwitch extends StatelessWidget {
  const AppSwitch({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: FittedBox(
        child: CupertinoSwitch(
          value: value,
          activeColor: colors.primary,
          onChanged: onChanged,
        ),
      ),
    );
  }
}
