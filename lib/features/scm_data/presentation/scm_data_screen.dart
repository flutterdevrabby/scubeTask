import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:scube_task/providers/scm_data_provider.dart';

import '../../../common_widget/custom_app_bar.dart';
import '../../revenue_view/presentation/revenue_screen.dart';
import '../widgets/center_tabbar/center_tabbar_widget.dart';
import '../widgets/current_data_widget.dart';
import '../widgets/custom_date_data_widget.dart';
import '../widgets/gauge_widget.dart';
import '../widgets/top_tabbar/top_tabbar_widget.dart';

class ScmDataScreen extends StatelessWidget {
  const ScmDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ScmDataProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: CustomAppBar(),
          backgroundColor: Color(0xFFD9E4F1),
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 1.4.sh,
                  margin: EdgeInsets.only(top: 45.h),
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(width: 1.5.w, color: Color(0xFFB6B8D0)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),

                      provider.selectTopTabbar == 0
                          ? Column(
                              children: [
                                GaugeWidget(
                                  title: '55.00',
                                  subtitle: 'kwh/sqft',
                                  value: 55,
                                ),

                                SizedBox(height: 20.h),

// Center TABBAR
                                CenterTabbarWidget(scmDataProvider: provider),

                                SizedBox(height: 20.h),

                                provider.selectedCenterTabbar == 0
                                    ? CurrentDataWidget(
                                        scmDataProvider: provider,
                                      )
                                    : CustomDateDataWidget(
                                        scmDataProvider: provider,
                                      ),
                              ],
                            )
                          : RevenueScreen(scmDataProvider: provider),
                    ],
                  ),
                ),

                // TOP TABBAR
                Positioned(
                  top: 20.h,
                  left: 0,
                  right: 0,
                  child: TopTabbarWidget(scmDataProvider: provider),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
