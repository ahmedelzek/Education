import 'package:education/dummy_model/chapters_model.dart';
import 'package:education/ui/core/resources/app_colors.dart';
import 'package:education/ui/screens/user_admin_screen/chapter/chapter_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../l10n/app_translations.dart';
import 'add_chapter_bottom_sheet.dart';

class ChaptersScreen extends StatefulWidget {
  const ChaptersScreen({super.key});

  @override
  State<ChaptersScreen> createState() => _ChaptersScreenState();
}

class _ChaptersScreenState extends State<ChaptersScreen> {
  List<ChapterModel> chapters = []; // List to store user data

  @override
  void initState() {
    chapters.addAll([
      ChapterModel("Java", 1),
      ChapterModel("Kotlin", 2),
      ChapterModel("Dart", 3),
      ChapterModel("Flutter", 4),
      ChapterModel("Python", 5),
    ]);
    super.initState();
  }

  void _addNewChapter(ChapterModel newChapter) {
    setState(() {
      chapters.add(newChapter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationManager().tr!.chapters)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddChapterBottomSheet(onChapterAdded: _addNewChapter,),
          );
        },
        backgroundColor: AppColors.darkBlue,
        child: Icon(Icons.add,color: AppColors.white,size: 32,),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.dg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder:
                    (BuildContext context, int index) =>
                        ChapterItem(chapterModel: chapters[index]),
                itemCount: chapters.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Container(
                    width: double.infinity,
                    height: 8.h,
                    color: AppColors.white,
                  );
                },
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
