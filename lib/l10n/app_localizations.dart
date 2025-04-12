import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
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
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
    Locale('en'),
    Locale('fr'),
  ];

  /// Text for the button or tab leading to the home page.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Text for the button or tab leading to the catalog page.
  ///
  /// In en, this message translates to:
  /// **'Catalog'**
  String get catalog;

  /// No description provided for @calendarTimeFormat.
  ///
  /// In en, this message translates to:
  /// **'jm'**
  String get calendarTimeFormat;

  /// Text for the button or tab leading to the calendar page.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendar;

  /// Text for the button or tab leading to the user account page.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get myAccount;

  /// Text for the field or button to perform a search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// Text for the button or field to access advanced search.
  ///
  /// In en, this message translates to:
  /// **'Advanced Search'**
  String get advancedSearch;

  /// Text for the button or field to sort results or the list.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// First part of the phrase 'What you might have missed'.
  ///
  /// In en, this message translates to:
  /// **'What you might have '**
  String get whatYouMightHaveMissed1;

  /// Second part of the phrase 'What you might have missed'.
  ///
  /// In en, this message translates to:
  /// **'missed'**
  String get whatYouMightHaveMissed2;

  /// Text to display the season number.
  ///
  /// In en, this message translates to:
  /// **'Season {season}'**
  String season(String season);

  /// Text to display the simulcast season and year.
  ///
  /// In en, this message translates to:
  /// **'{type, select, SPRING{Spring} SUMMER{Summer} AUTUMN{Autumn} WINTER{Winter} other{}} {year}'**
  String simulcastSeason(String type, num year);

  /// Text to display the episode type (episode, special, movie, recap).
  ///
  /// In en, this message translates to:
  /// **'{type, select, episode{Episode} special{Special} film{Movie} summary{Recap Episode} spin_off{Spin-off} other{}}'**
  String episodeType(String type);

  /// Combined text to display the season, episode type, and its number.
  ///
  /// In en, this message translates to:
  /// **'Season {season} • {episodeType} {number}'**
  String fullInformation(String season, String episodeType, String number);

  /// Reduced version of episode information with only the episode type and number.
  ///
  /// In en, this message translates to:
  /// **'{episodeType} {number}'**
  String minInformation(String episodeType, String number);

  /// Text to indicate the availability of subtitles.
  ///
  /// In en, this message translates to:
  /// **'Subtitles'**
  String get subtitles;

  /// Text to indicate the availability of dubbing.
  ///
  /// In en, this message translates to:
  /// **'Dubbing'**
  String get voice;

  /// Text for the button to mark an episode as watched.
  ///
  /// In en, this message translates to:
  /// **'All seen'**
  String get markWatched;

  /// Text for the button to share content.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// Text for the button to display more information.
  ///
  /// In en, this message translates to:
  /// **'...more'**
  String get showMore;

  /// Text for the button to display less information.
  ///
  /// In en, this message translates to:
  /// **'...less'**
  String get showLess;

  /// Text indicating that the user is using an anonymous account.
  ///
  /// In en, this message translates to:
  /// **'Anonymous account'**
  String get anonymousAccount;

  /// Text for the button to associate an email address with an account.
  ///
  /// In en, this message translates to:
  /// **'Associate an email address'**
  String get associateEmail;

  /// Text for the field where the user must enter a verification code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get code;

  /// Text for the button to send a verification code.
  ///
  /// In en, this message translates to:
  /// **'Send code'**
  String get sendCode;

  /// Text to designate the user account section.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// Text to designate an email address.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get email;

  /// Text to designate the unique identifier of an account.
  ///
  /// In en, this message translates to:
  /// **'Identifier'**
  String get identifier;

  /// Subtitle explaining that it's important to save the identifier to recover one's data.
  ///
  /// In en, this message translates to:
  /// **'Please save it to recover your data'**
  String get identifierSubtitle;

  /// Text indicating that there is no identifier.
  ///
  /// In en, this message translates to:
  /// **'No identifier'**
  String get noIdentifier;

  /// Message displayed when the identifier is copied to the clipboard.
  ///
  /// In en, this message translates to:
  /// **'Identifier copied to clipboard'**
  String get identifierCopied;

  /// Text inviting the user to enter a new identifier.
  ///
  /// In en, this message translates to:
  /// **'Please enter a new identifier'**
  String get enterNewIdentifier;

  /// Text for a button to recover a forgotten identifier.
  ///
  /// In en, this message translates to:
  /// **'Forgot identifier?'**
  String get forgotIdentifier;

  /// Text for a button to cancel an action.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// Text for a button to save information.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// Text for a confirmation or acceptance button.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// Text for the button or tab leading to the application settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// Text for the button or tab leading to notification settings.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// Text describing the different types of notifications available.
  ///
  /// In en, this message translates to:
  /// **'{type, select, all{All} watchlist{Watchlist} none{None} other{Other}}'**
  String notificationsType(String type);

  /// Subtitles to describe notification types in more detail.
  ///
  /// In en, this message translates to:
  /// **'{type, select, all{Receive notifications for all anime} watchlist{Receive notifications for anime in your watchlist} none{} other{Receive notifications for anime you follow}}'**
  String notificationsSubtitles(String type);

  /// Text for the button or field to choose a default sort.
  ///
  /// In en, this message translates to:
  /// **'Default sort'**
  String get defaultSort;

  /// Text to describe different sorting options (by oldest or newest).
  ///
  /// In en, this message translates to:
  /// **'{type, select, oldest{Oldest} newest{Newest} other{Other}}'**
  String sortType(String type);

  /// Title for a dialog box warning the user about data backup.
  ///
  /// In en, this message translates to:
  /// **'Data Backup Warning'**
  String get anonymousWarningTitle;

  /// First paragraph of the warning message explaining the importance of the identifier for data backup.
  ///
  /// In en, this message translates to:
  /// **'We save your data anonymously on our servers. Each account is associated with a unique identifier. Please note that if you lose this identifier, you risk losing access to all your data.'**
  String get anonymousWarningContent1;

  /// Second paragraph of the warning message explaining where to find the unique identifier.
  ///
  /// In en, this message translates to:
  /// **'You can find your unique identifier in the \"Account\" section of the application settings.'**
  String get anonymousWarningContent2;

  /// Third paragraph of the warning message advising to associate an email address for data security.
  ///
  /// In en, this message translates to:
  /// **'To avoid any data loss, we strongly recommend associating an email address. This will allow you to easily recover your data if needed and secure your account against accidental loss.'**
  String get anonymousWarningContent3;

  /// Text displayed when something doesn't go as planned.
  ///
  /// In en, this message translates to:
  /// **'Oops'**
  String get oops;

  /// Message informing the user that no anime is available today.
  ///
  /// In en, this message translates to:
  /// **'There are no anime available today.'**
  String get noAnimeToday;

  /// Message informing the user that there is no Internet connection.
  ///
  /// In en, this message translates to:
  /// **'No Internet connection'**
  String get noInternet;

  /// Message indicating that no email address is associated with the account.
  ///
  /// In en, this message translates to:
  /// **'No email address associated'**
  String get noEmail;

  /// Text for a button to retry a failed action.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// Message indicating that the entered email address is invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get invalidEmail;

  /// Message indicating that an email address is already used by another account.
  ///
  /// In en, this message translates to:
  /// **'This email address is already associated with another account'**
  String get conflictEmail;

  /// Message indicating that the verification code is invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid code'**
  String get invalidCode;

  /// Message indicating that the entered identifier is invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid identifier'**
  String get invalidIdentifier;

  /// Text explaining the benefits of associating an email address with the account.
  ///
  /// In en, this message translates to:
  /// **'By associating an email address with your account, you\'ll be able to recover your data if you lose your identifier. Additionally, you can secure your account against accidental loss.'**
  String get emailContent;

  /// Warning inviting the user to check their spam folder if the email is not received.
  ///
  /// In en, this message translates to:
  /// **'Please check your spam folder if you don\'t receive the email in your inbox. If you still don\'t receive it after a few minutes, please try again.'**
  String get emailSpamWarning;

  /// Message indicating the consequences of not associating an email address with the account.
  ///
  /// In en, this message translates to:
  /// **'If you haven\'t associated an email address with your account, you won\'t be able to recover your data if you lose your identifier.'**
  String get emailNotAssociated;

  /// Message indicating that the entered email address is already associated with this account.
  ///
  /// In en, this message translates to:
  /// **'This email address is already associated with your account.'**
  String get emailAlreadyAssociatedWithYourAccount;

  /// Message confirming that the email address has been associated with the account.
  ///
  /// In en, this message translates to:
  /// **'Your email address has been successfully associated with your account.'**
  String get yourEmailHasBeenAssociated;

  /// Message confirming that the new identifier has been sent by email.
  ///
  /// In en, this message translates to:
  /// **'Your new identifier has been sent to your email address.'**
  String get yourNewIdentifierHasBeenSent;

  /// Text indicating the number of animes added by the user.
  ///
  /// In en, this message translates to:
  /// **'Animes added'**
  String get animesAdded;

  /// Text indicating the number of episodes watched by the user.
  ///
  /// In en, this message translates to:
  /// **'Episodes watched'**
  String get episodesWatched;

  /// Text indicating the total viewing duration of animes by the user.
  ///
  /// In en, this message translates to:
  /// **'Watch time'**
  String get watchTime;

  /// No description provided for @accountDateFormat.
  ///
  /// In en, this message translates to:
  /// **'EEEE, MMMM dd, yyyy'**
  String get accountDateFormat;

  /// Text indicating the creation date of the user account.
  ///
  /// In en, this message translates to:
  /// **'Account created on {date}'**
  String accountCreatedAt(String date);

  /// Text for the button or option to crop an image.
  ///
  /// In en, this message translates to:
  /// **'Crop'**
  String get crop;

  /// Message indicating that the provided image format is invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid image format'**
  String get invalidImageFormat;

  /// Message indicating that only jpg, jpeg, and png image formats are accepted.
  ///
  /// In en, this message translates to:
  /// **'Only .jpg, .jpeg, and .png files are allowed'**
  String get invalidImageExtension;

  /// First part of the phrase 'Your recently added anime'.
  ///
  /// In en, this message translates to:
  /// **'Your recently '**
  String get yourRecentlyAddedAnime1;

  /// Second part of the phrase 'Your recently added anime'.
  ///
  /// In en, this message translates to:
  /// **'added anime'**
  String get yourRecentlyAddedAnime2;

  /// Message informing the user that they haven't added any anime to their watchlist yet.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t added any anime to your watchlist yet'**
  String get noFollowedAnime;

  /// First part of the phrase 'Your recently viewed episodes'.
  ///
  /// In en, this message translates to:
  /// **'Your recently '**
  String get yourRecentlyViewedEpisodes1;

  /// Second part of the phrase 'Your recently viewed episodes'.
  ///
  /// In en, this message translates to:
  /// **'viewed episodes'**
  String get yourRecentlyViewedEpisodes2;

  /// Message informing the user that they haven't watched any episodes yet.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t watched any episodes yet'**
  String get noWatchedEpisode;

  /// Text for the user's watchlist, which includes the anime they want to follow.
  ///
  /// In en, this message translates to:
  /// **'Watchlist'**
  String get watchlist;

  /// Text to display the day of the week.
  ///
  /// In en, this message translates to:
  /// **'{day, select, 0{Monday} 1{Tuesday} 2{Wednesday} 3{Thursday} 4{Friday} 5{Saturday} 6{Sunday} other{}}'**
  String weekDays(String day);

  /// Abbreviation for days.
  ///
  /// In en, this message translates to:
  /// **'d'**
  String get days;

  /// Text for the button to watch an episode.
  ///
  /// In en, this message translates to:
  /// **'Watch'**
  String get watch;

  /// Message indicating that notifications are not authorized.
  ///
  /// In en, this message translates to:
  /// **'Notifications are not authorized'**
  String get notificationNotAuthorized;

  /// Subtitle indicating where to enable notifications.
  ///
  /// In en, this message translates to:
  /// **'Please enable them in your app settings'**
  String get notificationNotAuthorizedSubtitle;

  /// Message indicating that a patch is being downloaded.
  ///
  /// In en, this message translates to:
  /// **'Downloading patch...'**
  String get downloadingPatch;

  /// Message indicating that the patch has been downloaded and needs to be applied.
  ///
  /// In en, this message translates to:
  /// **'Patch downloaded! Restart the application to apply the changes.'**
  String get patchDownloaded;

  /// Message indicating that the patch failed to download.
  ///
  /// In en, this message translates to:
  /// **'Patch failed to download. Please try again later.'**
  String get patchFailed;

  /// Text to indicate where to watch an anime.
  ///
  /// In en, this message translates to:
  /// **'Watch on:'**
  String get watchOn;

  /// Text for the button to mark an episode as watched.
  ///
  /// In en, this message translates to:
  /// **'Mark as watched'**
  String get markAsWatched;

  /// Default text to display when there is no description available.
  ///
  /// In en, this message translates to:
  /// **'No description yet...'**
  String get defaultDescription;

  /// Text for the button to enable notifications.
  ///
  /// In en, this message translates to:
  /// **'Turn on notifications'**
  String get enableNotifications;

  /// Description of the notification feature.
  ///
  /// In en, this message translates to:
  /// **'Receive updates when a new episode is available. You can disable notifications at any time in the settings.'**
  String get notificationsDescription;

  /// Text for the button to activate a feature.
  ///
  /// In en, this message translates to:
  /// **'Turn on'**
  String get activate;

  /// Text for the button to postpone an action.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get later;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
