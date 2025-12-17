import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:scube_task/providers/scm_data_provider.dart';

import '../../../const/custom_app_bar.dart';
import '../../revenue_view/revenue_screen.dart';
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
            physics: BouncingScrollPhysics(),
            child: Container(
              width: 1.sw,
              margin: EdgeInsets.symmetric(vertical: 30.h),
              padding: EdgeInsets.symmetric(vertical: 20.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(width: 1.w, color: const Color(0xFFB6B8D0)),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Top Tabbar
                  Positioned(
                    top: -20.h,
                    left: 0,
                    right: 0,
                    child: TopTabbarWidget(scmDataProvider: provider),
                  ),

                  provider.selectTopTabbar == 0
                      ? Column(
                          children: [
                            SizedBox(
                              height: 40.h,
                            ), // leave space for top tabbar
                            // Gauge widget
                            GaugeWidget(
                              title: '55.00',
                              subtitle: 'kwh/sqft',
                              value: 55,
                            ),

                            SizedBox(height: 20.h),

                            // Center Tabbar
                            CenterTabbarWidget(scmDataProvider: provider),

                            SizedBox(height: 20.h),

                            // Data view
                            provider.selectedCenterTabbar == 0
                                ? CurrentDataWidget(scmDataProvider: provider)
                                : CustomDateDataWidget(
                                    scmDataProvider: provider,
                                  ),
                          ],
                        )
                      : RevenueScreen(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
