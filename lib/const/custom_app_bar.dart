import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:scube_task/const/assets_path.dart';
import 'package:scube_task/const/text_stye.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back icon
          InkWell(
            onTap: () {
              context.pop();
            },
            child: SvgPicture.asset(
              AssetsIcon.arrowLeftIcon,
              width: 24.w,
              height: 24.h,
              fit: BoxFit.cover,
            ),
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
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(55.h);
}
