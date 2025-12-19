import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube_task/constants/text_font_style.dart';

class DataViewWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  const DataViewWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Color(0xFFE5F4FE),
        borderRadius: BorderRadius.circular(4.r),
        border: BoxBorder.all(color: Color(0xFFA5A7B9), width: 1),
      ),

      child: Row(
        spacing: 16.w,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // IMage
          Image.asset(
            data["image"],
            width: 24.w,
            height: 24.h,
            fit: BoxFit.cover,
          ),

          // Data View
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  spacing: 8.w,
                  children: [
                    // Mark Icon
                    Image.asset(
                      data["mark"],
                      width: 12.w,
                      height: 12.h,
                      fit: BoxFit.cover,
                    ),

                    // Data
                    Text(
                      data["title"],
                      style: TextFontStyle.textLine14C5E5E5EW500.copyWith(
                        color: Color(0xFF04063E),
                      ),
                    ),

                    SizedBox(width: 2.w),

                    Text(
                      data["active"],
                      style: TextFontStyle.textLine14C5E5E5EW500.copyWith(
                        color: Color(0xFF0096FC),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 4.h),

                // Data 1
                RichText(
                  text: TextSpan(
                    text: "Data 1      : ",
                    style: TextFontStyle.textLine12C646984W400,

                    children: [
                      TextSpan(
                        text: data["data1"],
                        style: TextFontStyle.textLine14C04063EW400,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4.h),

                // Data 2
                RichText(
                  text: TextSpan(
                    text: "Data 2      : ",
                    style: TextFontStyle.textLine12C646984W400,

                    children: [
                      TextSpan(
                        text: data["data2"],
                        style: TextFontStyle.textLine14C04063EW400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Arrow Icon
          Image.asset(
            data["left_arrow"],
            width: 24.w,
            height: 24.h,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
