import 'package:education/ui/core/routes_manager/generate_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

import '../../../../data/model/requests/register_request.dart';
import '../../../../di/di.dart';
import '../../../../l10n/app_translations.dart';
import '../../../core/customized_widgets/custom_linear_gradient.dart';
import '../../../core/customized_widgets/custom_text_field.dart';
import '../../../core/resources/app_colors.dart';
import 'cubit/register_state.dart';
import 'cubit/register_view_model.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RegisterViewModel>(),
      child: BlocConsumer<RegisterViewModel, RegisterState>(
        listener: (context, state) {
          switch (state) {
            case RegisterLoadingState _:
              showDialog(
                context: context,
                builder:
                    (context) => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
              );
              break;
            case RegisterSuccessState _:
              Navigator.pushReplacementNamed(context, Routes.chaptersRoute);
              break;

            case RegisterErrorState _:
              {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.exception.toString())),
                );
              }
          }
        },
        builder: (BuildContext context, RegisterState state) {
          return Scaffold(
            backgroundColor: AppColors.blue,
            body: KeyboardAvoider(
              autoScroll: true,
              child: Container(
                decoration: BoxDecoration(gradient: customLinearGradient()),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 150.h),
                      CustomTextField(
                        controller: _nameController,
                        label: LocalizationManager().tr!.full_name,
                        hint: LocalizationManager().tr!.enter_full_name,
                      ),
                      SizedBox(height: 40.h),
                      CustomTextField(
                        controller: _phoneController,
                        label: LocalizationManager().tr!.mobile_number,
                        hint: LocalizationManager().tr!.enter_mobile_number,
                        isMobile: true,
                      ),
                      SizedBox(height: 40.h),
                      CustomTextField(
                        controller: _emailController,
                        label: LocalizationManager().tr!.email_address,
                        hint: LocalizationManager().tr!.enter_email_address,
                      ),
                      SizedBox(height: 40.h),
                      CustomTextField(
                        controller: _passwordController,
                        label: LocalizationManager().tr!.password,
                        hint: LocalizationManager().tr!.enter_password,
                        isPassword: true,
                      ),
                      SizedBox(height: 60.h),
                      FilledButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context
                                .read<RegisterViewModel>()
                                .register(RegisterRequest(
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              rePassword: _passwordController.text,
                              phone: _phoneController.text,
                            ));
                          }
                        },
                        child: Text(LocalizationManager().tr!.register),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
