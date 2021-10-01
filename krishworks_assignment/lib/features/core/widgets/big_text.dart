import 'package:flutter/material.dart';
import 'package:krishworks_assignment/core/resources/colors.dart';
import 'package:krishworks_assignment/core/resources/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;

  const BigText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: Padding(
        padding: const EdgeInsets.all(AppDimensions.d32),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: AppDimensions.d32,
            color: AppColors.textButton,
          ),
        ),
      ),
    );
  }
}
