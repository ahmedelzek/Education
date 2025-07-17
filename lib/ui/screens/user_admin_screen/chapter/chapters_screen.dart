import 'package:flutter/material.dart';

import '../../../../l10n/app_translations.dart';


class ChaptersScreen extends StatelessWidget {
  const ChaptersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(getTranslations(context).chapters),

      ),
    );
  }
}
