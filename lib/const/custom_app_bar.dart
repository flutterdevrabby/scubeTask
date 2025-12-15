import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scube_task/const/assets_path.dart';
import 'package:scube_task/const/text_stye.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleText;
  final Widget? title;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final TextStyle? style;
  final bool centerTitle;
  final double height;
  final Widget? leading;

  const CustomAppBar({
    super.key,
    this.titleText,
    this.title,
    this.centerTitle = true,
    this.automaticallyImplyLeading = false,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
    this.style,
    this.leading,
    this.height = 55,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back icon
          SvgPicture.asset(
            AssetsIcon.arrowLeftIcon,
            width: 24.w,
            height: 24.h,
            fit: BoxFit.cover,
          ),

          // Title Text
          Text(
            "SCM",
            style: TextFontStyle.textLine16C5E5E5EW600.copyWith(
              color: Color(0xFF04063E),
            ),
          ),

          // Notification icon
          SvgPicture.asset(
            AssetsIcon.bellIcon,
            width: 20.w,
            height: 20.h,
            fit: BoxFit.cover,
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height.h);
}
