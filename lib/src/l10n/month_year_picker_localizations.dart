import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'month_year_picker_localizations_ar.dart';
import 'month_year_picker_localizations_en.dart';
import 'month_year_picker_localizations_ms.dart';
import 'month_year_picker_localizations_es.dart';

/// Callers can lookup localized strings with an instance of MonthYearPickerLocalizations returned
/// by `MonthYearPickerLocalizations.of(context)`.
///
/// Applications need to include `MonthYearPickerLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/month_year_picker_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: MonthYearPickerLocalizations.localizationsDelegates,
///   supportedLocales: MonthYearPickerLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the MonthYearPickerLocalizations.supportedLocales
/// property.
abstract class MonthYearPickerLocalizations {
  MonthYearPickerLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static MonthYearPickerLocalizations of(BuildContext context) {
    return Localizations.of<MonthYearPickerLocalizations>(
        context, MonthYearPickerLocalizations)!;
  }

  static const LocalizationsDelegate<MonthYearPickerLocalizations> delegate =
      _MonthYearPickerLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('ms'),
    Locale('es')
  ];

  /// No description provided for @helpText.
  ///
  /// In en, this message translates to:
  /// **'SELECT MONTH/YEAR'**
  String get helpText;

  /// No description provided for @okButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get okButtonLabel;

  /// No description provided for @cancelButtonLabel.
  ///
  /// In en, this message translates to:
  /// **'CANCEL'**
  String get cancelButtonLabel;
}

class _MonthYearPickerLocalizationsDelegate
    extends LocalizationsDelegate<MonthYearPickerLocalizations> {
  const _MonthYearPickerLocalizationsDelegate();

  @override
  Future<MonthYearPickerLocalizations> load(Locale locale) {
    return SynchronousFuture<MonthYearPickerLocalizations>(
        lookupMonthYearPickerLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'ms', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_MonthYearPickerLocalizationsDelegate old) => false;
}

MonthYearPickerLocalizations lookupMonthYearPickerLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return MonthYearPickerLocalizationsAr();
    case 'en':
      return MonthYearPickerLocalizationsEn();
    case 'ms':
      return MonthYearPickerLocalizationsMs();
    case 'es':
      return MonthYearPickerLocalizationsEs();
  }

  throw FlutterError(
      'MonthYearPickerLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
