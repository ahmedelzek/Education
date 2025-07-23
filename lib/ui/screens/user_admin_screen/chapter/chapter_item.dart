import 'package:education/ui/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../dummy_model/chapters_model.dart';
import '../../../../l10n/app_translations.dart';

class ChapterItem extends StatefulWidget {
final ChapterModel chapterModel;
  const ChapterItem({super.key, required this.chapterModel});

  @override
  State<ChapterItem> createState() => _ChapterItemState();
}

class _ChapterItemState extends State<ChapterItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.blue,
      ),
      padding: EdgeInsets.all(16.dg),
      height: 100.h,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.dg),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
            ),
            child: Icon(Icons.arrow_forward_ios, color: AppColors.blue),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.chapterModel.chapterTitle,
                style: Theme.of(
                  context,
                ).textTheme.bodyMedium?.copyWith(color: AppColors.white),
              ),
              Text(
                "${LocalizationManager().tr!.chapter_no} ${widget.chapterModel.chapterNum}",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(color: AppColors.white))
            ],
          ),
          const Spacer(),
          Container(
            padding: EdgeInsets.all(8.dg),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.white,
            ),
            child: Icon(Icons.edit, color: AppColors.blue),
          ),
          SizedBox(width: 8.w),
          Container(
            padding: EdgeInsets.all(8.dg),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.red,
            ),
            child: Icon(Icons.delete, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
