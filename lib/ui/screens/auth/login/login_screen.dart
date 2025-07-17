import 'package:education/ui/core/resources/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

import '../../../../l10n/app_translations.dart';
import '../../../core/customized_widgets/costom_text_field.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/routes_manager/generate_routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: KeyboardAvoider(
        autoScroll: true,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 70.h),
              Center(
                child: Image.asset(
                  AppImages.appWhiteLogo,
                  width: 150.w,
                  height: 150.h,
                ),
              ),
              SizedBox(height: 50.h),
              Text(
                getTranslations(context).welcome_back,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                getTranslations(context).login_prompt,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
              ),
              SizedBox(height: 40.h),
              CustomTextField(
                label: getTranslations(context).user_name,
                hint: getTranslations(context).enter_user_name,
              ),
              SizedBox(height: 40.h),
              CustomTextField(
                label: getTranslations(context).password,
                hint: getTranslations(context).enter_password,
                isPassword: true,
              ),
              Text(
                textAlign: TextAlign.end,
                getTranslations(context).forgot_password,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.white,
                  decorationThickness: 2,
                ),
              ),
              SizedBox(height: 40.h),
              FilledButton(
                onPressed: () {},
                child: Text(getTranslations(context).login),
              ),
              SizedBox(height: 40.h),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.registerRoute);
                },
                child: Text(
                  getTranslations(context).no_account_prompt,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
