import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizationManager {
  static final LocalizationManager _instance = LocalizationManager._();
  factory LocalizationManager() => _instance;
  LocalizationManager._();

  AppLocalizations? _localizations;
  BuildContext? _context;

  // Initialize with context
  void init(BuildContext context) {
    _context = context;
    _localizations = AppLocalizations.of(context);
  }

  // Get translations with safety check
  AppLocalizations? get translations {
    if (_localizations == null && _context != null) {
      _localizations = AppLocalizations.of(_context!);
    }
    return _localizations ??= AppLocalizations.of(_context!);
  }

  // Shortcut getter
  AppLocalizations? get tr => translations;

  // Handle hot reload
  void dispose() {
    _context = null;
    _localizations = null;
  }
}