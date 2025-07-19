import 'package:education/l10n/app_translations.dart';
import 'package:education/ui/core/customized_widgets/costom_text_field.dart';
import 'package:education/ui/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class AddChapterBottomSheet extends StatefulWidget {
  const AddChapterBottomSheet({super.key});

  @override
  State<AddChapterBottomSheet> createState() => _AddChapterBottomSheetState();
}

class _AddChapterBottomSheetState extends State<AddChapterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomSheet: KeyboardAvoider(
        autoScroll: true,
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
            color: AppColors.blue,
          ),
          child: Column(
            children: [
              Container(
                width: 60.w,
                height: 3.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
              ),
              SizedBox(height: 24.h,),
              Text(
                getTranslations(context).add_chapter,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.white),
              ),
              SizedBox(height: 60.h),
              CustomTextField(hint: getTranslations(context).chapter_title),
              SizedBox(height: 32.h),
              CustomTextField(
                hint: getTranslations(context).chapter_no,
                isMobile: true,
              ),
              SizedBox(height: 32.h,),
              FilledButton(onPressed: () {}, child: Text(getTranslations(context).add_chapter)),
            ],
          ),
        ),
      ),
    );
  }
}
