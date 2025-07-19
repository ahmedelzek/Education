import 'package:education/l10n/app_translations.dart';
import 'package:education/ui/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        LocalizationManager().tr!.error_snack_bar_prompt,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: AppColors.red,
      action: SnackBarAction(
        label: LocalizationManager().tr!.ok,
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(LocalizationManager().tr!.ok)),
          );
        },
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
    ),
  );
}
