import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/text_font_style.dart';

class DataCostWidget extends StatelessWidget {
  final int dataIndex;
  final String dataValue;
  final String costValue;

  const DataCostWidget({super.key, required this.dataIndex, required this.dataValue, required this.costValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h, left: 15.w),
      child: Column(
        spacing: 4.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Data $dataIndex  : ',
                style: TextFontStyle.textLine12C646984W400.copyWith(
                  color: Color(0xFF646984),
                ),
              ),
              Text(
                dataValue,
                style: TextFontStyle.textLine14C646984EW600.copyWith(
                  color: Color(0xFF04063E),
                ),
              ),
            ],
          ),

          Row(
            children: [
              Text('Cost $dataIndex  : '),
              Text(
                costValue,
                style: TextFontStyle.textLine14C646984EW600.copyWith(
                  color: Color(0xFF04063E),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
