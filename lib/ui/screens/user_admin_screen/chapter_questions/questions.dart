import 'package:flutter/material.dart';

import '../../../../l10n/app_translations.dart';

class QuestionsScreen extends StatelessWidget {
  final String chapterName;
  final double chapterNumber;

  const QuestionsScreen({
    super.key,
    required this.chapterName,
    required this.chapterNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${LocalizationManager().tr!.chapters}, $chapterNumber: $chapterName',
        ),
      ),
      body: const Center(
        child: Text('Questions Screen'),
      ),
    );
  }
}
