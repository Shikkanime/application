// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get home => 'Home';

  @override
  String get catalog => 'Catalog';

  @override
  String get calendarTimeFormat => 'jm';

  @override
  String get calendar => 'Calendar';

  @override
  String get myAccount => 'Account';

  @override
  String get search => 'Search';

  @override
  String get advancedSearch => 'Advanced Search';

  @override
  String get sort => 'Sort';

  @override
  String get whatYouMightHaveMissed1 => 'What you might have ';

  @override
  String get whatYouMightHaveMissed2 => 'missed';

  @override
  String season(String season) {
    return 'Season $season';
  }

  @override
  String simulcastSeason(String type, num year) {
    String _temp0 = intl.Intl.selectLogic(type, {
      'SPRING': 'Spring',
      'SUMMER': 'Summer',
      'AUTUMN': 'Autumn',
      'WINTER': 'Winter',
      'other': '',
    });
    return '$_temp0 $year';
  }

  @override
  String episodeType(String type) {
    String _temp0 = intl.Intl.selectLogic(type, {
      'episode': 'Episode',
      'special': 'Special',
      'film': 'Movie',
      'summary': 'Recap Episode',
      'spin_off': 'Spin-off',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String fullInformation(String season, String episodeType, String number) {
    return 'Season $season • $episodeType $number';
  }

  @override
  String minInformation(String episodeType, String number) {
    return '$episodeType $number';
  }

  @override
  String get subtitles => 'Subtitles';

  @override
  String get voice => 'Dubbing';

  @override
  String get markWatched => 'All seen';

  @override
  String get share => 'Share';

  @override
  String get showMore => '...more';

  @override
  String get showLess => '...less';

  @override
  String get anonymousAccount => 'Anonymous account';

  @override
  String get associateEmail => 'Associate an email address';

  @override
  String get code => 'Code';

  @override
  String get sendCode => 'Send code';

  @override
  String get account => 'Account';

  @override
  String get email => 'Email address';

  @override
  String get identifier => 'Identifier';

  @override
  String get identifierSubtitle => 'Please save it to recover your data';

  @override
  String get noIdentifier => 'No identifier';

  @override
  String get identifierCopied => 'Identifier copied to clipboard';

  @override
  String get enterNewIdentifier => 'Please enter a new identifier';

  @override
  String get forgotIdentifier => 'Forgot identifier?';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';

  @override
  String get ok => 'OK';

  @override
  String get settings => 'Settings';

  @override
  String get notifications => 'Notifications';

  @override
  String notificationsType(String type) {
    String _temp0 = intl.Intl.selectLogic(type, {
      'all': 'All',
      'watchlist': 'Watchlist',
      'none': 'None',
      'other': 'Other',
    });
    return '$_temp0';
  }

  @override
  String notificationsSubtitles(String type) {
    String _temp0 = intl.Intl.selectLogic(type, {
      'all': 'Receive notifications for all anime',
      'watchlist': 'Receive notifications for anime in your watchlist',
      'none': '',
      'other': 'Receive notifications for anime you follow',
    });
    return '$_temp0';
  }

  @override
  String get defaultSort => 'Default sort';

  @override
  String sortType(String type) {
    String _temp0 = intl.Intl.selectLogic(type, {
      'oldest': 'Oldest',
      'newest': 'Newest',
      'other': 'Other',
    });
    return '$_temp0';
  }

  @override
  String get anonymousWarningTitle => 'Data Backup Warning';

  @override
  String get anonymousWarningContent1 =>
      'We save your data anonymously on our servers. Each account is associated with a unique identifier. Please note that if you lose this identifier, you risk losing access to all your data.';

  @override
  String get anonymousWarningContent2 =>
      'You can find your unique identifier in the \"Account\" section of the application settings.';

  @override
  String get anonymousWarningContent3 =>
      'To avoid any data loss, we strongly recommend associating an email address. This will allow you to easily recover your data if needed and secure your account against accidental loss.';

  @override
  String get oops => 'Oops';

  @override
  String get noAnimeToday => 'There are no anime available today.';

  @override
  String get noInternet => 'No Internet connection';

  @override
  String get noEmail => 'No email address associated';

  @override
  String get tryAgain => 'Try again';

  @override
  String get invalidEmail => 'Invalid email address';

  @override
  String get conflictEmail =>
      'This email address is already associated with another account';

  @override
  String get invalidCode => 'Invalid code';

  @override
  String get invalidIdentifier => 'Invalid identifier';

  @override
  String get emailContent =>
      'By associating an email address with your account, you\'ll be able to recover your data if you lose your identifier. Additionally, you can secure your account against accidental loss.';

  @override
  String get emailSpamWarning =>
      'Please check your spam folder if you don\'t receive the email in your inbox. If you still don\'t receive it after a few minutes, please try again.';

  @override
  String get emailNotAssociated =>
      'If you haven\'t associated an email address with your account, you won\'t be able to recover your data if you lose your identifier.';

  @override
  String get emailAlreadyAssociatedWithYourAccount =>
      'This email address is already associated with your account.';

  @override
  String get yourEmailHasBeenAssociated =>
      'Your email address has been successfully associated with your account.';

  @override
  String get yourNewIdentifierHasBeenSent =>
      'Your new identifier has been sent to your email address.';

  @override
  String get animesAdded => 'Animes added';

  @override
  String get episodesWatched => 'Episodes watched';

  @override
  String get watchTime => 'Watch time';

  @override
  String get accountDateFormat => 'EEEE, MMMM dd, yyyy';

  @override
  String accountCreatedAt(String date) {
    return 'Account created on $date';
  }

  @override
  String get crop => 'Crop';

  @override
  String get invalidImageFormat => 'Invalid image format';

  @override
  String get invalidImageExtension =>
      'Only .jpg, .jpeg, and .png files are allowed';

  @override
  String get yourRecentlyAddedAnime1 => 'Your recently ';

  @override
  String get yourRecentlyAddedAnime2 => 'added anime';

  @override
  String get noFollowedAnime =>
      'You haven\'t added any anime to your watchlist yet';

  @override
  String get yourRecentlyViewedEpisodes1 => 'Your recently ';

  @override
  String get yourRecentlyViewedEpisodes2 => 'viewed episodes';

  @override
  String get noWatchedEpisode => 'You haven\'t watched any episodes yet';

  @override
  String get watchlist => 'Watchlist';

  @override
  String weekDays(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '0': 'Monday',
      '1': 'Tuesday',
      '2': 'Wednesday',
      '3': 'Thursday',
      '4': 'Friday',
      '5': 'Saturday',
      '6': 'Sunday',
      'other': '',
    });
    return '$_temp0';
  }

  @override
  String get days => 'd';

  @override
  String get watch => 'Watch';

  @override
  String get notificationNotAuthorized => 'Notifications are not authorized';

  @override
  String get notificationNotAuthorizedSubtitle =>
      'Please enable them in your app settings';

  @override
  String get downloadingPatch => 'Downloading patch...';

  @override
  String get patchDownloaded =>
      'Patch downloaded! Restart the application to apply the changes.';

  @override
  String get patchFailed => 'Patch failed to download. Please try again later.';

  @override
  String get watchOn => 'Watch on:';

  @override
  String get markAsWatched => 'Mark as watched';

  @override
  String get defaultDescription => 'No description yet...';

  @override
  String get enableNotifications => 'Turn on notifications';

  @override
  String get notificationsDescription =>
      'Receive updates when a new episode is available. You can disable notifications at any time in the settings.';

  @override
  String get activate => 'Turn on';

  @override
  String get later => 'Later';

  @override
  String get platformPreferences => 'Playback Settings';

  @override
  String get rememberMyChoice => 'Remember my choice';

  @override
  String get dragToReorder => 'Drag to reorder';

  @override
  String get continueLabel => 'Continue';

  @override
  String get platformPreferencesDescription =>
      'Sort your streaming services (like Netflix, Disney+, etc.) by placing your favorite one first.\n\nThis way, when you play an episode, we\'ll always suggest that service first and can even open it for you automatically.';

  @override
  String get reorderPlatforms => 'Service Priority';

  @override
  String get reorderPlatformsDescription =>
      'Put your favorite service at the top of the list. We\'ll prioritize it when you go to watch an episode';
}
