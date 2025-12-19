import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:scube_task/providers/sign_in_provider.dart';
import 'package:scube_task/routes/routes.dart';

import '../../../constants/assets_path.dart';
import '../../../common_widget/custom_button.dart';
import '../../../common_widget/custom_text_field.dart';
import '../../../constants/text_font_style.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0096FC),
      body: Stack(
        children: [
          // Top content
          Positioned(
            top: 100.h,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Image.asset(
                  AssetsIcon.logoIcon,
                  width: 96.w,
                  height: 98.h,
                  fit: BoxFit.contain,
                ),

                SizedBox(height: 16.h),

                Text("SCUBE", style: TextFontStyle.headLine24CWhiteW600),

                SizedBox(height: 6.h),

                Text(
                  "Control & Monitoring System",
                  style: TextFontStyle.headLine20CWhiteW600,
                ),
              ],
            ),
          ),

          // Bottom container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 0.55.sh,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 30.h),

                      Text("Login", style: TextFontStyle.headLine24C082438W700),

                      SizedBox(height: 30.h),

                      CustomTextFormField(
                        hintText: "Username",
                        controller: _userNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "user name is required";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10.h),

                      Consumer<SignInProvider>(
                        builder: (context, provider, child) {
                          return CustomTextFormField(
                            obscureText: !provider.passwordVisible,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            hintText: "Password",
                            controller: _passwordController,

                            suffixIcon: IconButton(
                              onPressed: provider.togglePasswordVisibility,
                              icon: Image.asset(
                                provider.passwordVisible
                                    ? AssetsIcon.eyeOnIcon 
                                    : AssetsIcon.eyeOffIcon,

                                width: 24.w,
                                height: 24.h,
                                color: Color(0xFF82797A),

                                fit: BoxFit.none,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Password is required";
                              }
                              return null;
                            },
                          );
                        },
                      ),

                      SizedBox(height: 10.h),

                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {},

                          child: Text(
                            "Forget password?",
                            style: TextFontStyle.textLine12C5E5E5EW500.copyWith(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 10.h),

                      CustomButton(
                        buttonName: "Login",
                        onPressed: () {
                          context.push(AppRoutes.scmScreen);
                          // if (!_formKey.currentState!.validate()) {
                          //   return;
                          // } else {

                          // }
                        },
                      ),
                      SizedBox(height: 10.h),

                      /// Register
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have any account? ",
                            style: TextFontStyle.textLine12C5E5E5EW500,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Register Now",
                              style: TextFontStyle.textLine12C5E5E5EW500
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF0096FC),
                                    fontSize: 13.sp,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
