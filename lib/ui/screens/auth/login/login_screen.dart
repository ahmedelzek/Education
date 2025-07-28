import 'package:education/ui/core/customized_widgets/custom_linear_gradient.dart';
import 'package:education/ui/core/resources/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

import '../../../../data/model/requests/login_requests.dart';
import '../../../../di/di.dart';
import '../../../../l10n/app_translations.dart';
import '../../../core/customized_widgets/custom_text_field.dart';
import '../../../core/resources/app_colors.dart';
import '../../../core/routes_manager/generate_routes.dart';
import 'cubit/login_state.dart';
import 'cubit/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoginViewModel>(),
      child: BlocConsumer<LoginViewModel, LoginState>(
        listener: (context, state) {
          switch (state) {
            case LoginLoadingState():
              showDialog(
                context: context,
                builder:
                    (context) =>
                        const Center(child: CircularProgressIndicator(color: AppColors.blue,)),
              );
              break;

            case LoginSuccessState():
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.chaptersRoute,
                (route) => false,
              );
              break;

            case LoginErrorState():
              {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.exception.toString())),
                );
              }
          }
        },
        builder:
            (BuildContext context, state) => Scaffold(
              backgroundColor: AppColors.blue,
              body: KeyboardAvoider(
                autoScroll: true,
                child: Container(
                  decoration: BoxDecoration(gradient: customLinearGradient()),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 30.h),
                      Center(child: Image.asset(AppImages.finalLogo)),
                      SizedBox(height: 20.h),
                      Text(
                        LocalizationManager().tr!.welcome_back,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        LocalizationManager().tr!.login_prompt,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyLarge?.copyWith(color: AppColors.white),
                      ),
                      SizedBox(height: 40.h),
                      CustomTextField(
                        controller: _usernameController,
                        label: LocalizationManager().tr!.user_name,
                        hint: LocalizationManager().tr!.enter_user_name,
                      ),
                      SizedBox(height: 40.h),
                      CustomTextField(
                        controller: _passwordController,
                        label: LocalizationManager().tr!.password,
                        hint: LocalizationManager().tr!.enter_password,
                        isPassword: true,
                      ),
                      Text(
                        textAlign: TextAlign.end,
                        LocalizationManager().tr!.forgot_password,
                        style: Theme.of(
                          context,
                        ).textTheme.labelMedium?.copyWith(
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.white,
                          decorationThickness: 2,
                        ),
                      ),
                      SizedBox(height: 40.h),
                      FilledButton(
                        onPressed: () {
                          final username = _usernameController.text.trim();
                          final password = _passwordController.text.trim();

                          if (username.isEmpty || password.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Please fill all fields'),
                              ),
                            );
                            return;
                          }

                          context.read<LoginViewModel>().login(
                            LoginRequest(
                              email: username,
                              password: password,
                            ),
                          );
                        },
                        child: Text(LocalizationManager().tr!.login),
                      ),
                      SizedBox(height: 40.h),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.registerRoute);
                        },
                        child: Text(
                          LocalizationManager().tr!.no_account_prompt,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
