import 'package:flutter/material.dart';

import '../constants/assets_path.dart';

class ScmProvider extends ChangeNotifier {
 List<String> tabList = ["Summery", "SLD", "Data"];

  int selectedTabIndex = 0;

  void topTabbarUpdate(int index) {
    selectedTabIndex = index;
    notifyListeners();
  }



  // Center tab bar 

   List<String> tabList2 = ["Source", "Load"];

  int selectedTab2Index = 0;

  void centerUpdate(int index) {
    selectedTab2Index = index;
    notifyListeners();
  }


  // Data view
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
    {
      "image": AssetsIcon.solarCellIcon,
      "mark": AssetsIcon.blueIcon,
      "title": "Total Solar",
      "active": "(Active)",
      "data1": "55505.63",
      "data2": "58805.63",
      "left_arrow": AssetsIcon.rightArrowIcon,
    },
  ];



  // Grid data 
    List<Map<String, dynamic>> dataViewList = [
    {"icon": AssetsIcon.analysisIcon, "title": "Analysis Pro"},
    {"icon": AssetsIcon.generatorIcon, "title": "G. Generator"},
    {"icon": AssetsIcon.plantIcon, "title": "Plant Summery"},
    {"icon": AssetsIcon.gasIcon, "title": "Natural Gas"},
    {"icon": AssetsIcon.generatorIcon, "title": "D. Generator"},
    {"icon": AssetsIcon.waterIcon, "title": "Water Process"},
  ];
}
