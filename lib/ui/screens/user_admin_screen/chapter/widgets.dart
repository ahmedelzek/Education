import 'package:education/l10n/app_translations.dart';
import 'package:education/ui/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        getTranslations(context).error_snack_bar_prompt,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      duration: const Duration(seconds: 2),
      backgroundColor: AppColors.red,
      action: SnackBarAction(
        label: getTranslations(context).ok,
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(getTranslations(context).ok)),
          );
        },
      ),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
    ),
  );
}
