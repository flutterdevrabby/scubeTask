import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../constants/text_font_style.dart';

class ProgressIndicatior extends StatelessWidget {
  final String title;
  final String subtitle;
  const ProgressIndicatior({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return CircularStepProgressIndicator(
      totalSteps: 100,
      currentStep: 100,
      stepSize: 25,
      selectedColor: Color(0xFF398FC9),
      width: 160.w,
      height: 160.h,
      child: Center(
        child: Column(
          spacing: 4.h,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title ,
              style: TextFontStyle.textLine12C5E5E5EW500.copyWith(
                color: Color(0xFF04063E),
              ),
            ),

            Text(
             subtitle,
              style: TextFontStyle.textLine12C5E5E5EW500.copyWith(
                color: Color(0xFF04063E),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
