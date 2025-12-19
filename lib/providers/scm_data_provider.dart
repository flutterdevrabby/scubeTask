import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constants/assets_path.dart';

class ScmDataProvider extends ChangeNotifier {
  // Top Tab Bar
  List<String> topTabList = ["Data View", "Revenue View"];
  int selectTopTabbar = 0;

  void updateTopBar(int index) {
    selectTopTabbar = index;
    notifyListeners();
  }

  // Center Tabbar data
  final List<String> centerTabbarList = ["Today Data", "Custom Date Data"];

  int selectedCenterTabbar = 0;

  void updateCenterTabbarBar(int index) {
    selectedCenterTabbar = index;
    notifyListeners();
  }

  // energy data
  List<Map<String, dynamic>> dataList = [
    {
      "icon": AssetsIcon.blueeIcon,
      "title": "Data A",
      "data": "2798.50 (29.53%)",
      "cost": "35689 ৳",
    },

    {
      "icon": AssetsIcon.limeIcon,
      "title": "Data B",
      "data": "72598.50 (35.39%)",
      "cost": "5259689 ৳",
    },

    {
      "icon": AssetsIcon.purpleIcon,
      "title": "Data C",
      "data": "6598.36 (83.90%)",
      "cost": "5698756 ৳",
    },

    {
      "icon": AssetsIcon.yellowIcon,
      "title": "Data D",
      "data": "6598.26 (36.59%)",
      "cost": "356987 ৳",
    },
  ];

  List<Map<String, dynamic>> eneryList = [
    {"value": "20.05 kw"},
    {"value": "5.53 kw"},
  ];


// Date 
  String? startDate;

  String? endDate;
  Future<void> startDatePicker({required BuildContext context}) async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      firstDate: DateTime(2000, 7, 25),
      lastDate: DateTime.now(),
    );

    if (dateTime != null) {
      startDate = DateFormat('dd MMM yyyy').format(dateTime);
    }

    notifyListeners();
  }

  Future<void> endDatePicker({required BuildContext context}) async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      firstDate: DateTime(2000, 7, 25),
      lastDate: DateTime.now(),
    );

    if (dateTime != null) {
      endDate = DateFormat('dd MMM yyyy').format(dateTime);
    }

    notifyListeners();
  }

  

  // When user click the icon 
  // data will expand and icon will change
  bool isExpand = false;

  void updatePand(bool value) {
    isExpand = value;
    notifyListeners();
  }
}
