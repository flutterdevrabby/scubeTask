import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:scube_task/const/assets_path.dart';
import 'package:scube_task/features/scm/widgets/data_gallery_view.dart';
import 'package:scube_task/features/scm/widgets/data_view_widget.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../../const/custom_app_bar.dart';
import '../../../const/text_stye.dart';

class ScmScreen extends StatefulWidget {
  const ScmScreen({super.key});

  @override
  State<ScmScreen> createState() => _ScmScreenState();
}

class _ScmScreenState extends State<ScmScreen> {
  final List<String> _tabList = ["Summery", "SLD", "Data"];

  int selectedTabIndex = 0;

  final List<String> _tabList2 = ["Source", "Load"];

  int selectedTab2Index = 0;

  List<Map<String, dynamic>> dataList = [
    // Data View
    {
      "image": AssetsIcon.solarCellIcon,
      "mark": AssetsIcon.blueIcon,
      "title": "Data View",
      "active": "(Active)",
      "data1": "55505.63",
      "data2": "58805.63",
      "left_arrow": AssetsIcon.rightArrowIcon,
    },

    // Data Type 2
    {
      "image": AssetsIcon.batterytIcon,
      "mark": AssetsIcon.orangeIcon,
      "title": "Data Type 2",
      "active": "(Active)",
      "data1": "55505.63",
      "data2": "58805.63",
      "left_arrow": AssetsIcon.rightArrowIcon,
    },

    // Data Type 3
    {
      "image": AssetsIcon.powerIcon,
      "mark": AssetsIcon.blueIcon,
      "title": "Data Type 3",
      "active": "(Inactive)",
      "data1": "55505.63",
      "data2": "58805.63",
      "left_arrow": AssetsIcon.rightArrowIcon,
    },
  ];

  //
  List<Map<String, dynamic>> dataViewList = [
    {"icon": AssetsIcon.analysisIcon, "title": "Analysis Pro"},
    {"icon": AssetsIcon.generatorIcon, "title": "G. Generator"},
    {"icon": AssetsIcon.plantIcon, "title": "Plant Summery"},
    {"icon": AssetsIcon.gasIcon, "title": "Natural Gas"},
    {"icon": AssetsIcon.generatorIcon, "title": "D. Generator"},
    {"icon": AssetsIcon.waterIcon, "title": "Water Process"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      backgroundColor: Color(0xFFD9E4F1),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        physics: BouncingScrollPhysics(),

        child: Column(
          children: [
            SizedBox(height: 30.h),

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
                  SizedBox(
                    height: 48.h,
                    child: Row(
                      children: List.generate(_tabList.length, (index) {
                        final bool isSelected = selectedTabIndex == index;
                        return Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedTabIndex = index;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 0.w,
                                vertical: 10.h,
                              ),
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
                                _tabList[index],
                                style: TextFontStyle.textLine14C5E5E5EW500
                                    .copyWith(
                                      color: isSelected
                                          ? Color(0xFFFFFFFF)
                                          : Color(0xFF646984),
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

                  CircularStepProgressIndicator(
                    totalSteps: 100,
                    currentStep: 100,
                    stepSize: 25,
                    selectedColor: Color(0xFF398FC9),
                    width: 160.w,
                    height: 160.h,
                    child: Center(
                      child: Column(
                        spacing: 4.h,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Total Power",
                            style: TextFontStyle.textLine12C5E5E5EW500.copyWith(
                              color: Color(0xFF04063E),
                            ),
                          ),

                          Text(
                            "5.53 kw",
                            style: TextFontStyle.textLine12C5E5E5EW500.copyWith(
                              color: Color(0xFF04063E),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  SizedBox(
                    height: 48.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFE2EBF1),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                        padding: EdgeInsets.all(4.r),
                        child: Row(
                          children: List.generate(_tabList2.length, (index) {
                            final bool isSelected = selectedTab2Index == index;

                            return Expanded(
                              child: InkWell(
                                borderRadius: BorderRadius.circular(26.r),
                                onTap: () {
                                  setState(() {
                                    selectedTab2Index = index;
                                  });
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
                                    _tabList2[index],
                                    style: TextFontStyle.textLine14C5E5E5EW500
                                        .copyWith(
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
                  ),

                  Padding(
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
                    child: Divider(color: Color(0xFF979797), thickness: 3),
                  ),

                  //    SizedBox(height: 10.h),
                  ListView.builder(
                    itemCount: dataList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      var data = dataList[index];
                      return DataViewWidget(data: data);
                    },
                  ),

                  SizedBox(height: 6.h),
                ],
              ),
            ),

            SizedBox(height: 16.h),

            AnimationLimiter(
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemCount: dataViewList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 16.w,
                  childAspectRatio: 148.w / 55.h,
                ),
                itemBuilder: (_, index) {
                  var data = dataViewList[index];

                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    columnCount: 2,
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: DataGalleryView(data: data),
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
}
