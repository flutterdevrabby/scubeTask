import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_font_style.dart';
import '../../../providers/scm_data_provider.dart';
import 'energy_card_widget.dart';

class CurrentDataWidget extends StatelessWidget {
  final ScmDataProvider scmDataProvider;

  const CurrentDataWidget({super.key, required this.scmDataProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      width: 1.sw,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFB6B8D0)),
        borderRadius: BorderRadius.circular(10.r),
      ),

      child: Column(
        children: [
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Energy Chart",
                style: TextFontStyle.textLine14C04063EW400.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF04063E),
                ),
              ),

              Text(
                "5.53 kw",
                style: TextFontStyle.textLine14C04063EW400.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 32.sp,
                  color: Color(0xFF04063E),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          ListView.builder(
            itemCount: scmDataProvider.dataList.length,
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return EnergyCardWidget();
            },
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
