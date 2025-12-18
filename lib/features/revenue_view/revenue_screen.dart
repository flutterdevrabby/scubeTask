import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scube_task/const/assets_path.dart';
import 'package:scube_task/const/text_stye.dart';
import '../../providers/scm_data_provider.dart';
import '../scm_data/widgets/gauge_widget.dart';

class RevenueScreen extends StatefulWidget {
  final ScmDataProvider scmDataProvider;
  const RevenueScreen({super.key, required this.scmDataProvider});

  @override
  State<RevenueScreen> createState() => _RevenueScreenState();
}

class _RevenueScreenState extends State<RevenueScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: GaugeWidget(title: '8897455', subtitle: 'tk', value: 70),
        ),

        // Data cost info
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color(0xFFA5A7B9), width: 1.2.w),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
            child: ExpansionTile(
              onExpansionChanged: (value) {
                widget.scmDataProvider.updatePand(value);
              },
              title: Row(
                spacing: 8.w,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetsIcon.solarChartIcon,
                    width: 18.w,
                    height: 18.h,
                    fit: BoxFit.contain,
                  ),

                  Text(
                    'Data & Cost Info',
                    style: TextFontStyle.textLine12C646984W400.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF04063E),
                    ),
                  ),
                ],
              ),

              trailing: Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF0096FC),
                ),
                padding: EdgeInsets.all(10.sp),
                child: Image.asset(
                  widget.scmDataProvider.isExpand
                      ? AssetsIcon.expandUpIcon
                      : AssetsIcon.expandDownIcon,
                  color: Colors.white,
                  width: 18.w,
                  height: 18.h,
                  fit: BoxFit.contain,
                ),
              ),
              children: List.generate(
                4,
                (index) => _dataCostItem(
                  dataIndex: index + 1,
                  dataValue: '2798.50 (29.53%)',
                  costValue: '35689 ৳',
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _dataCostItem({
  required int dataIndex,
  required String dataValue,
  required String costValue,
}) {
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
