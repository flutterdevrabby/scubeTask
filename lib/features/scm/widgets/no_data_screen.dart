import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube_task/common_widget/custom_app_bar.dart';

import '../../../constants/assets_path.dart';

class NoDataScreen extends StatelessWidget {
  const NoDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Color(0xFFD9E4F1),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(width: 1.w, color: Color(0xFFB6B8D0)),
        ),

        child: Center(
          child: Image.asset(
            AssetsImage.nodataImage,
            fit: BoxFit.cover,
            width: 260.w,
            height: 240.h,
          ),
        ),
      ),
    );
  }
}
