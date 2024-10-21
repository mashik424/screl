import 'package:flutter/material.dart';

class ResponsiveBuilder extends StatelessWidget {
  const ResponsiveBuilder({
    required this.mobileView,
    required this.deskTopView,
    super.key,
  });

  final Widget Function(BoxConstraints) mobileView;
  final Widget Function(BoxConstraints) deskTopView;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 800) {
          return mobileView(constraints);
        }
        return deskTopView(constraints);
      },
    );
  }
}
