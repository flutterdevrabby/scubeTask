import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/assets_path.dart';
import '../../../../constants/text_font_style.dart';
import '../../../../providers/scm_data_provider.dart';

class CenterTabbarWidget extends StatelessWidget {
  final ScmDataProvider scmDataProvider;

  const CenterTabbarWidget({super.key, required this.scmDataProvider});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 30.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(scmDataProvider.centerTabbarList.length, (index) {
        final bool isSelected = scmDataProvider.selectedCenterTabbar == index;
        return InkWell(
          onTap: () {
            scmDataProvider.updateCenterTabbarBar(index);
          },
          child: Row(
            spacing: 10.w,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                isSelected ? AssetsIcon.activeIcon : AssetsIcon.nonActiveIcon,
                width: 14.w,
                height: 14.h,
                fit: BoxFit.cover,
              ),
              Text(
                scmDataProvider.centerTabbarList[index],
                style: TextFontStyle.textLine14C5E5E5EW500.copyWith(
                  color: isSelected ? Color(0xFF0096FC) : Color(0xFF646984),
                  fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
