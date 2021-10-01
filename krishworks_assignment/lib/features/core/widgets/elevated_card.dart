import 'package:flutter/material.dart';
import 'package:krishworks_assignment/core/resources/colors.dart';
import 'package:krishworks_assignment/core/resources/dimensions.dart';

class ElevatedCard extends StatelessWidget {
  final EdgeInsetsGeometry? margin, padding;
  final Widget? child;

  const ElevatedCard({
    Key? key,
    this.margin,
    this.padding,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: const BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.all(Radius.circular(AppDimensions.d16)),
        boxShadow: [BoxShadow(color: AppColors.shadow, blurRadius: AppDimensions.d4)],
      ),
      child: child,
    );
  }
}
