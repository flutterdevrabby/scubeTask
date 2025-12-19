import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../../constants/text_font_style.dart';

class GaugeWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final double value;
  const GaugeWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      width: 200.w,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            showLabels: false,
            maximum: 100,
            showTicks: false,
            axisLineStyle: AxisLineStyle(
              thickness: 25,
              color: Color(0xFFE6F4FF),
              cornerStyle: CornerStyle.bothCurve,
            ),

            //Active color (progress)
            pointers: <GaugePointer>[
              RangePointer(
                value: value, // progress value
                width: 20,
                color: Color(0xFF4E91FD),
                cornerStyle: CornerStyle.bothCurve,
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                angle: 90,

                positionFactor: 0.0,
                widget: Center(
                  child: Text(
                    '$title\n$subtitle',
                    textAlign: TextAlign.center,
                    style: TextFontStyle.headLine20CWhiteW600.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w200,
                      color: Color(0xFF04063E),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
