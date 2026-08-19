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
  String get allSimulcasts => 'Tous les simulcasts';

  @override
  String get search => 'Rechercher...';

  @override
  String get warningCatalog =>
      'Le catalogue s\'enrichit progressivement : certains animés plus anciens peuvent ne pas encore apparaître';

  @override
  String get calendar => 'Calendrier';

  @override
  String get availableOn => 'Disponible sur';

  @override
  String langType(String type) {
    String _temp0 = intl.Intl.selectLogic(type, {
      'subtitles': 'Sous-titrage',
      'voice': 'Doublage',
      'other': 'Inconnu',
    });
    return '$_temp0';
  }

  @override
  String episodeType(String type) {
    String _temp0 = intl.Intl.selectLogic(type, {
      'episode': 'Épisode',
      'film': 'Film',
      'special': 'Spécial',
      'summary': 'Épisode récapitulatif',
      'spinOff': 'Spin-off',
      'other': 'Inconnu',
    });
    return '$_temp0';
  }

  @override
  String season(String type) {
    String _temp0 = intl.Intl.selectLogic(type, {
      'spring': 'Printemps',
      'summer': 'Été',
      'autumn': 'Automne',
      'winter': 'Hiver',
      'other': 'Inconnu',
    });
    return '$_temp0';
  }

  @override
  String episodeDescription(String season, String episodeType, String number) {
    return 'Saison $season • $episodeType $number';
  }

  @override
  String simulcast(String season, int year) {
    return '$season $year';
  }

  @override
  String weekDays(String day) {
    String _temp0 = intl.Intl.selectLogic(day, {
      '0': 'Lundi',
      '1': 'Mardi',
      '2': 'Mercredi',
      '3': 'Jeudi',
      '4': 'Vendredi',
      '5': 'Samedi',
      '6': 'Dimanche',
      'other': 'Inconnu',
    });
    return '$_temp0';
  }
}
