import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/assets_path.dart';
import '../../../constants/text_font_style.dart';

class EnergyCardWidget extends StatelessWidget {
  const EnergyCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFB6B8D0)),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        spacing: 4,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // data a
          Column(
            spacing: 2.h,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 8.h),
              Image.asset(
                AssetsIcon.blueeIcon,
                width: 8.w,
                height: 8.h,
                fit: BoxFit.cover,
              ),
              Text(
                "Data A",
                style: TextFontStyle.headLine18CFFFFFFW700.copyWith(
                  color: Color(0xFF04063E),
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 2.h),
            ],
          ),
          // Divider
          SizedBox(
            height: 35.h,
            child: VerticalDivider(color: Color(0xFFB6B8D0), thickness: 2),
          ),

          // Data and Cost
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6.h,
            children: [
              // Data
              RichText(
                text: TextSpan(
                  text: "Data      : ",
                  style: TextFontStyle.textLine12C646984W400.copyWith(
                    color: Color(0xFF646984),
                  ),
                  children: [
                    TextSpan(
                      text: "6567.99",
                      style: TextFontStyle.textLine12C646984W400.copyWith(
                        color: Color(0xFF04063E),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              // cost
              RichText(
                text: TextSpan(
                  text: "Cost      : ",
                  style: TextFontStyle.textLine12C646984W400.copyWith(
                    color: Color(0xFF646984),
                  ),
                  children: [
                    TextSpan(
                      text: "7343534.99",
                      style: TextFontStyle.textLine12C646984W400.copyWith(
                        color: Color(0xFF04063E),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
