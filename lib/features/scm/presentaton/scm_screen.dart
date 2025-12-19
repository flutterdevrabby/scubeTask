import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:scube_task/features/scm/widgets/data_gallery_view.dart';
import 'package:scube_task/features/scm/widgets/data_view_widget.dart';
import 'package:scube_task/providers/scm_provider.dart';
import 'package:scube_task/routes/routes.dart';
import '../../../common_widget/custom_app_bar.dart';
import '../../../constants/text_font_style.dart';
import '../widgets/center_tabbar/center_tabbar.dart';
import '../widgets/progress_indicatior.dart';
import '../widgets/top_tabbar/top_tabbar.dart';

class ScmScreen extends StatelessWidget {
  const ScmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Color(0xFFD9E4F1),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        physics: ClampingScrollPhysics(),

        child: Consumer<ScmProvider>(
          builder: (context, provider, child) {
            return Column(
              children: [
                SizedBox(height: 16.h),

                // Custom Tabbar
                Container(
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(width: 1.w, color: Color(0xFFB6B8D0)),
                  ),
                  child: Column(
                    children: [
                      // top tabbar Widget
                      TopTabbar(scmProvider: provider),

                      SizedBox(height: 10.h),

                      Text(
                        "Electricity",
                        style: TextFontStyle.textLine16C5E5E5EW600.copyWith(
                          color: Color(0xFF979797),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
                        child: Divider(color: Color(0xFF979797)),
                      ),

                      SizedBox(height: 16.h),

                      // Progress Indicator
                      ProgressIndicatior(
                        title: "Total Power",
                        subtitle: "5.53 kw",
                      ),

                      SizedBox(height: 12.h),

                      // center tabbar
                      CenterTabbar(scmProvider: provider),

                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
                        child: Divider(color: Color(0xFF979797), thickness: 3),
                      ),

                      // Data View
                      SizedBox(
                        height: 300.h,
                        child: ListView.builder(
                          itemCount: provider.dataList.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (_, index) {
                            var data = provider.dataList[index];
                            return GestureDetector(
                              onTap: () {
                                context.push(AppRoutes.scmDataScreen);
                              },
                              child: DataViewWidget(data: data),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 6.h),
                    ],
                  ),
                ),

                SizedBox(height: 16.h),

                // Grid data
                AnimationLimiter(
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: provider.dataViewList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 16.w,
                      childAspectRatio: 148.w / 55.h,
                    ),
                    itemBuilder: (_, index) {
                      var data = provider.dataViewList[index];

                      return AnimationConfiguration.staggeredGrid(
                        position: index,
                        columnCount: 2,
                        child: ScaleAnimation(
                          child: FadeInAnimation(
                            child: GestureDetector(
                              onTap: () {
                                context.push(AppRoutes.noDataScreen);
                              },
                              child: DataGalleryView(data: data),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 60.h),
              ],
            );
          },
        ),
      ),
    );
  }
}
