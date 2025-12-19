import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/assets_path.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../providers/scm_data_provider.dart';

class TopTabbarWidget extends StatelessWidget {
  final ScmDataProvider scmDataProvider;

  const TopTabbarWidget({super.key, required this.scmDataProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Color(0xFFA5A7B9),width: 1.5.w),
      ),
    
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(scmDataProvider.topTabList.length, (index) {
          final bool isSelected = scmDataProvider.selectTopTabbar == index;
          return InkWell(
            onTap: () {
              scmDataProvider.updateTopBar(index);
            },
            child: Row(
              spacing: 10.w,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  isSelected
                      ? AssetsIcon.activeIcon
                      : AssetsIcon.nonActiveIcon,
                  width: 14.w,
                  height: 14.h,
                  fit: BoxFit.cover,
                ),
                Text(
                  scmDataProvider.topTabList[index],
                  style: TextFontStyle.textLine14C5E5E5EW500.copyWith(
                    color: isSelected ? Color(0xFF0096FC) : Color(0xFF646984),
                    fontWeight: isSelected
                        ? FontWeight.w700
                        : FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
