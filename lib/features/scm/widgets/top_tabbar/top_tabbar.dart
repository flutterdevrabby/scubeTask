import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube_task/providers/scm_provider.dart';

import '../../../../constants/text_font_style.dart';

class TopTabbar extends StatelessWidget {
  final ScmProvider scmProvider;
  const TopTabbar({super.key, required this.scmProvider});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.h,
      child: Row(
        children: List.generate(scmProvider.tabList.length, (index) {
          final bool isSelected = scmProvider.selectedTabIndex == index;
          return Expanded(
            child: InkWell(
              onTap: () {
                scmProvider.topTabbarUpdate(index);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
                alignment: Alignment.center,
                decoration: isSelected
                    ? BoxDecoration(
                        color: Color(0xFF0096FC),

                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        ),
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFF38B7FF),
                            width: 1.w,
                          ),
                        ),
                      )
                    : BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0xFFDFE3E8),
                            width: 1.w,
                          ),
                        ),
                      ),
                child: Text(
                  scmProvider.tabList[index],
                  style: TextFontStyle.textLine14C5E5E5EW500.copyWith(
                    color: isSelected ? Color(0xFFFFFFFF) : Color(0xFF646984),
                    fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
