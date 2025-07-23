import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

import '../../../../l10n/app_translations.dart';
import '../../../core/customized_widgets/custom_linear_gradient.dart';
import '../../../core/customized_widgets/custom_text_field.dart';
import '../../../core/resources/app_colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: KeyboardAvoider(
        autoScroll: true,
        child: Container(
          decoration: BoxDecoration(
            gradient: customLinearGradient(),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 150.h),
              CustomTextField(
                label: LocalizationManager().tr!.full_name,
                hint: LocalizationManager().tr!.enter_full_name,
              ),
              SizedBox(height: 40.h),
              CustomTextField(
                label: LocalizationManager().tr!.mobile_number,
                hint: LocalizationManager().tr!.enter_mobile_number,
                isMobile: true,
              ),
              SizedBox(height: 40.h),
              CustomTextField(
                label: LocalizationManager().tr!.email_address,
                hint: LocalizationManager().tr!.enter_email_address,
              ),
              SizedBox(height: 40.h),
              CustomTextField(
                label: LocalizationManager().tr!.password,
                hint: LocalizationManager().tr!.enter_password,
                isPassword: true,
              ),
              SizedBox(height: 60.h),
              FilledButton(
                onPressed: () {},
                child: Text(LocalizationManager().tr!.register),
              ),
            ],
          ),
        ),
      ),
    );
  }
}