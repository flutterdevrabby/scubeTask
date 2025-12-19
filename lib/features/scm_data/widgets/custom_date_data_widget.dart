import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube_task/constants/assets_path.dart';
import 'package:scube_task/constants/text_font_style.dart';
import 'package:scube_task/features/scm_data/widgets/energy_card_widget.dart';

import '../../../providers/scm_data_provider.dart';

class CustomDateDataWidget extends StatelessWidget {
  final ScmDataProvider scmDataProvider;
  const CustomDateDataWidget({super.key, required this.scmDataProvider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            spacing: 6.w,
            children: [
              // From Date
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () async {
                    scmDataProvider.startDatePicker(context: context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Color(0xFFB6B8D0), width: 2.w),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            scmDataProvider.startDate != null
                                ? scmDataProvider.startDate.toString()
                                : "From Date",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextFontStyle.textLine12C5E5E5EW500.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF646984),
                            ),
                          ),
                        ),

                        Image.asset(
                          AssetsIcon.calendarIcon,
                          width: 18.w,
                          height: 18.h,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // To Date
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {
                    scmDataProvider.endDatePicker(context: context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Color(0xFFB6B8D0), width: 2.w),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          scmDataProvider.endDate != null
                              ? scmDataProvider.endDate.toString()
                              : "To Date",

                          style: TextFontStyle.textLine12C5E5E5EW500.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF646984),
                          ),
                        ),

                        Image.asset(
                          AssetsIcon.calendarIcon,
                          width: 18.w,
                          height: 18.h,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              //
              Image.asset(
                AssetsIcon.searchIcon,
                width: 45.w,
                height: 44.h,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
        SizedBox(height: 14.h),

        ListView.builder(
          itemCount: scmDataProvider.eneryList.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var data = scmDataProvider.eneryList[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: Container(
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
                          data["value"],
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

                    SizedBox(height: 4.h),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
