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

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @catalog.
  ///
  /// In en, this message translates to:
  /// **'Catalog'**
  String get catalog;

  /// No description provided for @calendarTimeFormat.
  ///
  /// In en, this message translates to:
  /// **'jm'**
  String get calendarTimeFormat;

  /// No description provided for @calendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get calendar;

  /// No description provided for @myAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get myAccount;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @advancedSearch.
  ///
  /// In en, this message translates to:
  /// **'Advanced Search'**
  String get advancedSearch;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// No description provided for @whatYouMightHaveMissed1.
  ///
  /// In en, this message translates to:
  /// **'What you might have '**
  String get whatYouMightHaveMissed1;

  /// No description provided for @whatYouMightHaveMissed2.
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

  /// No description provided for @subtitles.
  ///
  /// In en, this message translates to:
  /// **'Subtitles'**
  String get subtitles;

  /// No description provided for @voice.
  ///
  /// In en, this message translates to:
  /// **'Dubbing'**
  String get voice;

  /// No description provided for @markWatched.
  ///
  /// In en, this message translates to:
  /// **'All watched'**
  String get markWatched;

  /// No description provided for @watched.
  ///
  /// In en, this message translates to:
  /// **'Watched'**
  String get watched;

  /// No description provided for @unwatched.
  ///
  /// In en, this message translates to:
  /// **'Unwatched'**
  String get unwatched;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @showMore.
  ///
  /// In en, this message translates to:
  /// **'...more'**
  String get showMore;

  /// No description provided for @showLess.
  ///
  /// In en, this message translates to:
  /// **'...less'**
  String get showLess;

  /// No description provided for @anonymousAccount.
  ///
  /// In en, this message translates to:
  /// **'Anonymous account'**
  String get anonymousAccount;

  /// No description provided for @associateEmail.
  ///
  /// In en, this message translates to:
  /// **'Associate an email address'**
  String get associateEmail;

  /// No description provided for @code.
  ///
  /// In en, this message translates to:
  /// **'Code'**
  String get code;

  /// No description provided for @sendCode.
  ///
  /// In en, this message translates to:
  /// **'Send code'**
  String get sendCode;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get email;

  /// No description provided for @identifier.
  ///
  /// In en, this message translates to:
  /// **'Identifier'**
  String get identifier;

  /// No description provided for @identifierSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please save it to recover your data'**
  String get identifierSubtitle;

  /// No description provided for @noIdentifier.
  ///
  /// In en, this message translates to:
  /// **'No identifier'**
  String get noIdentifier;

  /// No description provided for @identifierCopied.
  ///
  /// In en, this message translates to:
  /// **'Identifier copied to clipboard'**
  String get identifierCopied;

  /// No description provided for @enterNewIdentifier.
  ///
  /// In en, this message translates to:
  /// **'Please enter a new identifier'**
  String get enterNewIdentifier;

  /// No description provided for @forgotIdentifier.
  ///
  /// In en, this message translates to:
  /// **'Forgot identifier?'**
  String get forgotIdentifier;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @notificationsType.
  ///
  /// In en, this message translates to:
  /// **'{type, select, all{All} watchlist{Watchlist} none{None} other{Other}}'**
  String notificationsType(String type);

  /// No description provided for @notificationsSubtitles.
  ///
  /// In en, this message translates to:
  /// **'{type, select, all{Receive notifications for all anime} watchlist{Receive notifications for anime in your watchlist} none{} other{Receive notifications for anime you follow}}'**
  String notificationsSubtitles(String type);

  /// No description provided for @sortType.
  ///
  /// In en, this message translates to:
  /// **'{type, select, oldest{Oldest} newest{Newest} other{Other}}'**
  String sortType(String type);

  /// No description provided for @anonymousWarningTitle.
  ///
  /// In en, this message translates to:
  /// **'Data Backup Warning'**
  String get anonymousWarningTitle;

  /// No description provided for @anonymousWarningContent1.
  ///
  /// In en, this message translates to:
  /// **'We save your data anonymously on our servers. Each account is associated with a unique identifier. Please note that if you lose this identifier, you risk losing access to all your data.'**
  String get anonymousWarningContent1;

  /// No description provided for @anonymousWarningContent2.
  ///
  /// In en, this message translates to:
  /// **'You can find your unique identifier in the \"Account\" section of the application settings.'**
  String get anonymousWarningContent2;

  /// No description provided for @anonymousWarningContent3.
  ///
  /// In en, this message translates to:
  /// **'To avoid any data loss, we strongly recommend associating an email address. This will allow you to easily recover your data if needed and secure your account against accidental loss.'**
  String get anonymousWarningContent3;

  /// No description provided for @oops.
  ///
  /// In en, this message translates to:
  /// **'Oops'**
  String get oops;

  /// No description provided for @noAnimeToday.
  ///
  /// In en, this message translates to:
  /// **'There are no anime available today.'**
  String get noAnimeToday;

  /// No description provided for @noInternet.
  ///
  /// In en, this message translates to:
  /// **'No Internet connection'**
  String get noInternet;

  /// No description provided for @noEmail.
  ///
  /// In en, this message translates to:
  /// **'No email address associated'**
  String get noEmail;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address'**
  String get invalidEmail;

  /// No description provided for @conflictEmail.
  ///
  /// In en, this message translates to:
  /// **'This email address is already associated with another account'**
  String get conflictEmail;

  /// No description provided for @invalidCode.
  ///
  /// In en, this message translates to:
  /// **'Invalid code'**
  String get invalidCode;

  /// No description provided for @invalidIdentifier.
  ///
  /// In en, this message translates to:
  /// **'Invalid identifier'**
  String get invalidIdentifier;

  /// No description provided for @emailContent.
  ///
  /// In en, this message translates to:
  /// **'By associating an email address with your account, you\'ll be able to recover your data if you lose your identifier. Additionally, you can secure your account against accidental loss.'**
  String get emailContent;

  /// No description provided for @emailSpamWarning.
  ///
  /// In en, this message translates to:
  /// **'Please check your spam folder if you don\'t receive the email in your inbox. If you still don\'t receive it after a few minutes, please try again.'**
  String get emailSpamWarning;

  /// No description provided for @emailNotAssociated.
  ///
  /// In en, this message translates to:
  /// **'If you haven\'t associated an email address with your account, you won\'t be able to recover your data if you lose your identifier.'**
  String get emailNotAssociated;

  /// No description provided for @emailAlreadyAssociatedWithYourAccount.
  ///
  /// In en, this message translates to:
  /// **'This email address is already associated with your account.'**
  String get emailAlreadyAssociatedWithYourAccount;

  /// No description provided for @yourEmailHasBeenAssociated.
  ///
  /// In en, this message translates to:
  /// **'Your email address has been successfully associated with your account.'**
  String get yourEmailHasBeenAssociated;

  /// No description provided for @yourNewIdentifierHasBeenSent.
  ///
  /// In en, this message translates to:
  /// **'Your new identifier has been sent to your email address.'**
  String get yourNewIdentifierHasBeenSent;

  /// No description provided for @animesAdded.
  ///
  /// In en, this message translates to:
  /// **'Animes added'**
  String get animesAdded;

  /// No description provided for @episodesWatched.
  ///
  /// In en, this message translates to:
  /// **'Episodes watched'**
  String get episodesWatched;

  /// No description provided for @watchTime.
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

  /// No description provided for @crop.
  ///
  /// In en, this message translates to:
  /// **'Crop'**
  String get crop;

  /// No description provided for @invalidImageFormat.
  ///
  /// In en, this message translates to:
  /// **'Invalid image format'**
  String get invalidImageFormat;

  /// No description provided for @invalidImageExtension.
  ///
  /// In en, this message translates to:
  /// **'Only .jpg, .jpeg, and .png files are allowed'**
  String get invalidImageExtension;

  /// No description provided for @yourRecentlyAddedAnime1.
  ///
  /// In en, this message translates to:
  /// **'Your recently '**
  String get yourRecentlyAddedAnime1;

  /// No description provided for @yourRecentlyAddedAnime2.
  ///
  /// In en, this message translates to:
  /// **'added anime'**
  String get yourRecentlyAddedAnime2;

  /// No description provided for @noFollowedAnime.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t added any anime to your watchlist yet'**
  String get noFollowedAnime;

  /// No description provided for @yourRecentlyViewedEpisodes1.
  ///
  /// In en, this message translates to:
  /// **'Your recently '**
  String get yourRecentlyViewedEpisodes1;

  /// No description provided for @yourRecentlyViewedEpisodes2.
  ///
  /// In en, this message translates to:
  /// **'viewed episodes'**
  String get yourRecentlyViewedEpisodes2;

  /// No description provided for @noWatchedEpisode.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t watched any episodes yet'**
  String get noWatchedEpisode;

  /// No description provided for @watchlist.
  ///
  /// In en, this message translates to:
  /// **'Watchlist'**
  String get watchlist;

  /// Text to display the day of the week.
  ///
  /// In en, this message translates to:
  /// **'{day, select, 0{Monday} 1{Tuesday} 2{Wednesday} 3{Thursday} 4{Friday} 5{Saturday} 6{Sunday} other{}}'**
  String weekDays(String day);

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'d'**
  String get days;

  /// No description provided for @play.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get play;

  /// No description provided for @notificationNotAuthorized.
  ///
  /// In en, this message translates to:
  /// **'Notifications are not authorized'**
  String get notificationNotAuthorized;

  /// No description provided for @notificationNotAuthorizedSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please enable them in your app settings'**
  String get notificationNotAuthorizedSubtitle;

  /// No description provided for @downloadingPatch.
  ///
  /// In en, this message translates to:
  /// **'Downloading patch...'**
  String get downloadingPatch;

  /// No description provided for @patchDownloaded.
  ///
  /// In en, this message translates to:
  /// **'Patch downloaded! Restart the application to apply the changes.'**
  String get patchDownloaded;

  /// No description provided for @patchFailed.
  ///
  /// In en, this message translates to:
  /// **'Patch failed to download. Please try again later.'**
  String get patchFailed;

  /// No description provided for @watchOn.
  ///
  /// In en, this message translates to:
  /// **'Watch on:'**
  String get watchOn;

  /// No description provided for @markAsWatched.
  ///
  /// In en, this message translates to:
  /// **'Mark as watched'**
  String get markAsWatched;

  /// No description provided for @defaultDescription.
  ///
  /// In en, this message translates to:
  /// **'No description yet...'**
  String get defaultDescription;

  /// No description provided for @enableNotifications.
  ///
  /// In en, this message translates to:
  /// **'Turn on notifications'**
  String get enableNotifications;

  /// No description provided for @notificationsDescription.
  ///
  /// In en, this message translates to:
  /// **'Receive updates when a new episode is available. You can disable notifications at any time in the settings.'**
  String get notificationsDescription;

  /// No description provided for @activate.
  ///
  /// In en, this message translates to:
  /// **'Turn on'**
  String get activate;

  /// No description provided for @later.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get later;

  /// No description provided for @platformPreferences.
  ///
  /// In en, this message translates to:
  /// **'Playback Settings'**
  String get platformPreferences;

  /// No description provided for @rememberMyChoice.
  ///
  /// In en, this message translates to:
  /// **'Remember my choice'**
  String get rememberMyChoice;

  /// No description provided for @dragToReorder.
  ///
  /// In en, this message translates to:
  /// **'Drag to reorder'**
  String get dragToReorder;

  /// No description provided for @continueLabel.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueLabel;

  /// No description provided for @platformPreferencesDescription.
  ///
  /// In en, this message translates to:
  /// **'Sort your streaming services (like Netflix, Disney+, etc.) by placing your favorite one first.\n\nThis way, when you play an episode, we\'ll always suggest that service first and can even open it for you automatically.'**
  String get platformPreferencesDescription;

  /// No description provided for @reorderPlatforms.
  ///
  /// In en, this message translates to:
  /// **'Service Priority'**
  String get reorderPlatforms;

  /// No description provided for @reorderPlatformsDescription.
  ///
  /// In en, this message translates to:
  /// **'Put your favorite service at the top of the list. We\'ll prioritize it when you go to watch an episode'**
  String get reorderPlatformsDescription;
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
