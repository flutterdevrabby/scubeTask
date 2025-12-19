import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube_task/providers/scm_provider.dart';

import '../../../../constants/text_font_style.dart';

class CenterTabbar extends StatelessWidget {
  final ScmProvider scmProvider;
  const CenterTabbar({super.key, required this.scmProvider});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFE2EBF1),
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: Row(
            children: List.generate(scmProvider.tabList2.length, (index) {
              final bool isSelected = scmProvider.selectedTab2Index == index;

              return Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(26.r),
                  onTap: () {
                    scmProvider.centerUpdate(index);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 1),
                    curve: Curves.easeInOut,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF0096FC)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(26.r),
                    ),
                    child: Text(
                      scmProvider.tabList2[index],
                      style: TextFontStyle.textLine14C5E5E5EW500.copyWith(
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF646984),
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
