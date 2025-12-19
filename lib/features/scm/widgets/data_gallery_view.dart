import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube_task/constants/text_font_style.dart';

class DataGalleryView extends StatelessWidget {
  final Map<String, dynamic> data;
  const DataGalleryView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: Color(0xFFB6B8D0), width: 1.5.w),
      ),
      child: Row(
        spacing: 10.w,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            data["icon"],
            width: 24.w,
            height: 24.h,
            fit: BoxFit.cover,
          ),

          Expanded(
            child: Text(
              data["title"],
              style: TextFontStyle.textLine14C646984EW600,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
