// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get home => 'Accueil';

  @override
  String get catalog => 'Catalogue';

  @override
  String get calendarTimeFormat => 'Hm';

  @override
  String get calendar => 'Calendrier';

  @override
  String get myAccount => 'Compte';

  @override
  String get search => 'Rechercher';

  @override
  String get advancedSearch => 'Recherche avancée';

  @override
  String get sort => 'Trier';

  @override
  String get whatYouMightHaveMissed1 => 'Ce que vous auriez pu ';

  @override
  String get whatYouMightHaveMissed2 => 'manquer';

  @override
  String season(num season) {
    return 'Saison $season';
  }

  @override
  String simulcastSeason(String type, num year) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'SPRING': 'Printemps',
        'SUMMER': 'Été',
        'AUTUMN': 'Automne',
        'WINTER': 'Hiver',
        'other': '',
      },
    );
    return '$_temp0 $year';
  }

  @override
  String episodeType(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'episode': 'Épisode',
        'special': 'Spécial',
        'film': 'Film',
        'summary': 'Épisode récapitulatif',
        'spin_off': 'Spin-off',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String fullInformation(num season, String episodeType, num number) {
    return 'Saison $season • $episodeType $number';
  }

  @override
  String minInformation(String episodeType, dynamic number) {
    return '$episodeType $number';
  }

  @override
  String get subtitles => 'Sous-titrage';

  @override
  String get voice => 'Doublage';

  @override
  String get markWatched => 'Tout vu';

  @override
  String get share => 'Partager';

  @override
  String get showMore => '...plus';

  @override
  String get showLess => '...moins';

  @override
  String get anonymousAccount => 'Compte anonyme';

  @override
  String get associateEmail => 'Associer une adresse e-mail';

  @override
  String get code => 'Code';

  @override
  String get sendCode => 'Envoyer le code';

  @override
  String get account => 'Compte';

  @override
  String get email => 'Adresse e-mail';

  @override
  String get identifier => 'Identifiant';

  @override
  String get identifierSubtitle => 'Veuillez le sauvegarder pour récupérer vos données';

  @override
  String get noIdentifier => 'Aucun identifiant';

  @override
  String get identifierCopied => 'Identifiant copié dans le presse-papiers';

  @override
  String get enterNewIdentifier => 'Veuillez saisir un nouvel identifiant';

  @override
  String get forgotIdentifier => 'Identifiant oublié ?';

  @override
  String get cancel => 'Annuler';

  @override
  String get save => 'Enregistrer';

  @override
  String get ok => 'D\'accord';

  @override
  String get settings => 'Paramètres';

  @override
  String get notifications => 'Notifications';

  @override
  String notificationsType(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'all': 'Toutes les notifications',
        'watchlist': 'Watchlist',
        'none': 'Aucune',
        'other': 'Autre',
      },
    );
    return '$_temp0';
  }

  @override
  String notificationsSubtitles(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'all': 'Recevoir des notifications pour tous les animés',
        'watchlist': 'Recevoir des notifications pour les animés de votre watchlist',
        'none': 'Désactiver les notifications',
        'other': 'Recevoir des notifications pour les animés que vous suivez',
      },
    );
    return '$_temp0';
  }

  @override
  String get defaultSort => 'Tri par défaut';

  @override
  String sortType(String type) {
    String _temp0 = intl.Intl.selectLogic(
      type,
      {
        'oldest': 'Les plus anciens',
        'newest': 'Les plus récents',
        'other': 'Autre',
      },
    );
    return '$_temp0';
  }

  @override
  String get anonymousWarningTitle => 'Avertissement sur la sauvegarde des données';

  @override
  String get anonymousWarningContent1 => 'Nous sauvegardons vos données de manière anonyme sur nos serveurs. Chaque compte est associé à un identifiant unique. Veuillez noter que si vous perdez cet identifiant, vous risquez de perdre l\'accès à toutes vos données.';

  @override
  String get anonymousWarningContent2 => 'Vous trouverez votre identifiant unique dans la section \"Compte\" des paramètres de l\'application.';

  @override
  String get anonymousWarningContent3 => 'Pour éviter toute perte de données, nous vous recommandons vivement d\'associer une adresse e-mail. Cela vous permettra de récupérer facilement vos données en cas de besoin et de sécuriser votre compte contre toute perte accidentelle.';

  @override
  String get oops => 'Oups';

  @override
  String get noAnimeToday => 'Il n\'y a pas d\'animé disponible aujourd\'hui.';

  @override
  String get noInternet => 'Pas de connexion Internet';

  @override
  String get noEmail => 'Aucune adresse e-mail associée';

  @override
  String get tryAgain => 'Réessayer';

  @override
  String get invalidEmail => 'Adresse e-mail invalide';

  @override
  String get conflictEmail => 'Cette adresse e-mail est déjà associée à un autre compte';

  @override
  String get invalidCode => 'Code invalide';

  @override
  String get invalidIdentifier => 'Identifiant invalide';

  @override
  String get emailContent => 'En associant une adresse e-mail à votre compte, vous pourrez récupérer vos données en cas de perte de votre identifiant. De plus, vous pourrez sécuriser votre compte contre toute perte accidentelle.';

  @override
  String get emailSpamWarning => 'Veuillez vérifier votre dossier de courrier indésirable si vous ne recevez pas l\'e-mail dans votre boîte de réception. Si vous ne le recevez toujours pas après quelques minutes, veuillez réessayer.';

  @override
  String get emailNotAssociated => 'Si vous n\'avez pas associé d\'adresse e-mail à votre compte, vous ne pourrez pas récupérer vos données en cas de perte de votre identifiant.';

  @override
  String get emailAlreadyAssociatedWithYourAccount => 'Cette adresse e-mail est déjà associée à votre compte.';

  @override
  String get yourEmailHasBeenAssociated => 'Votre adresse e-mail a bien été associée à votre compte.';

  @override
  String get yourNewIdentifierHasBeenSent => 'Votre nouvel identifiant a été envoyé à votre adresse e-mail.';

  @override
  String get animesAdded => 'Animés ajoutés';

  @override
  String get episodesWatched => 'Épisodes vus';

  @override
  String get watchTime => 'Temps de visionnage';

  @override
  String get accountDateFormat => 'EEEE dd MMM yyyy';

  @override
  String accountCreatedAt(String date) {
    return 'Compte créé le $date';
  }

  @override
  String get crop => 'Recadrer';

  @override
  String get invalidImageFormat => 'Format d\'image invalide';

  @override
  String get invalidImageExtension => 'Seuls les fichiers .jpg, .jpeg et .png sont autorisés';

  @override
  String get yourRecentlyAddedAnime1 => 'Vos animés récemment ';

  @override
  String get yourRecentlyAddedAnime2 => 'ajoutés';

  @override
  String get noFollowedAnime => 'Vous n\'avez pas encore ajouté d\'animé à votre watchlist';

  @override
  String get yourRecentlyViewedEpisodes1 => 'Vos épisodes récemment ';

  @override
  String get yourRecentlyViewedEpisodes2 => 'vus';

  @override
  String get noWatchedEpisode => 'Vous n\'avez pas encore vus d\'épisode';

  @override
  String get watchlist => 'Watchlist';

  @override
  String weekDays(String day) {
    String _temp0 = intl.Intl.selectLogic(
      day,
      {
        '0': 'Lundi',
        '1': 'Mardi',
        '2': 'Mercredi',
        '3': 'Jeudi',
        '4': 'Vendredi',
        '5': 'Samedi',
        '6': 'Dimanche',
        'other': '',
      },
    );
    return '$_temp0';
  }

  @override
  String get days => 'j';

  @override
  String get watch => 'Regarder';

  @override
  String get notificationNotAuthorized => 'Les notifications ne sont pas autorisées';

  @override
  String get notificationNotAuthorizedSubtitle => 'Veuillez les activer dans les paramètres de votre application';

  @override
  String get downloadingPatch => 'Téléchargement du correctif...';

  @override
  String get patchDownloaded => 'Correctif téléchargé ! Redémarrez l\'application pour appliquer les changements.';

  @override
  String get patchFailed => 'Échec du téléchargement du correctif. Veuillez réessayer plus tard.';

  @override
  String get watchOn => 'Regarder sur :';

  @override
  String get markAsWatched => 'Marquer comme vu';

  @override
  String get defaultDescription => 'Aucune description pour le moment...';

  @override
  String get enableNotifications => 'Activer les notifications';

  @override
  String get notificationsDescription => 'Recevez des mises à jour lorsque un nouvel épisode est disponible. Vous pouvez désactiver les notifications à tout moment dans les paramètres';

  @override
  String get activate => 'Activer';

  @override
  String get later => 'Plus tard';
}
